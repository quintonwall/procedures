//
//  StepViewController.swift
//  BProcedures
//
//  Created by Quinton Wall on 8/25/17.
//  Copyright © 2017 Quinton Wall. All rights reserved.
//

import UIKit
import SwiftlySalesforce
import Eureka

class StepViewController: FormViewController {

    var procedureid : String?
    var parentProcedure : Procedure?
    var steps : [ProcedureStep] = []
    var currentStep : ProcedureStep?
    var previousStep : ProcedureStep?
    
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = parentProcedure?.Subject
        
        if(steps.count > 0 ) {
            buildStep(step: currentStep!)
        } else {
            fetchSteps()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func fetchSteps() {
        first {
            ProcedureData.shared.getSteps(forProcedure : procedureid!)
            }.then {
                (results) -> () in
                self.steps = results
                print("Got \(results.count) steps")
                if(self.steps.count > 0) {
                    self.currentStep = self.steps[0]
                    for i in self.steps {
                        self.buildStep(step: i)
                    }
                } else {
                    self.showNoStepsAlert()
                }
            }.catch {
                (error) -> () in
                print("error: \(error)")  //todo: handle this better
        }
    }
    
    
    func showNoStepsAlert() {
        let alertController = UIAlertController(title: "Oh Snap!", message: "This procedure has no steps.", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    //take a step and generate the UI
    func buildStep(step : ProcedureStep) {
        let seqnum : Int = step.Sequence_Number__c!
        let r : BaseRow?
        // let nameRow: NameRow =  self.form.rowBy(tag: "NameRow")
        print("build")
        
        var stepSection = Section("STEP-\(seqnum)")

        <<< TextAreaRow("INSTRUCTIONS-\(seqnum)") { row in
            row.title = "INSTRUCTIONS"
            row.value = step.Instruction__c
            row.disabled = true
        }
        
        switch step.Step_Type__c!.lowercased() {
            case ProcedureStepType.SimpleYESNO:
                 r = SwitchRow("step-\(seqnum)") { row in      // initializer
                    row.title = "Is the step complete?"
                    //row.cell.switchControl.addTarget(self, action: #selector(self.simpleYesNOValueChanged), for: .valueChanged)
                    }.onChange { row in
                        self.handleRowChange(therow: row)
            }
        case ProcedureStepType.SimpleMarkComplete:
             r = CheckRow("step-\(seqnum)") { row in      // initializer
                row.title = "Step completed"
             }.onChange { row in
                    self.handleRowChange(therow: row)
            }
        
        case ProcedureStepType.NumberInput:
             r = IntRow("step-\(seqnum)") { row in      // initializer
                row.title = "Enter the value"
            }.onChange { row in
                    self.handleRowChange(therow: row)
            }
          
        case ProcedureStepType.AssetVerification:
             r = LabelRow("step-\(seqnum)") { row in
                row.title = "not implemented yet: \(step.Step_Type__c!.lowercased())"
            }.onChange { row in
                    self.handleRowChange(therow: row)
            }
          
        case ProcedureStepType.ComplexInput:
            //note: prob use a multivaluedsection type control
             r = LabelRow("step-\(seqnum)") { row in
                row.title = "not implemented yet: \(step.Step_Type__c!.lowercased())"
            }.onChange { row in
                    self.handleRowChange(therow: row)
            }
          
        case ProcedureStepType.NoInputNeeded:
             r = LabelRow("step-\(seqnum)") { row in
                row.title = "No input required"
            }.onChange { row in
                    self.handleRowChange(therow: row)
            }
          
        case ProcedureStepType.SimplePassFail:
             r = SwitchRow("step-\(seqnum)") { row in      // initializer
                row.title = "Did the test pass?"
            }.onChange { row in
                    self.handleRowChange(therow: row)
            }
        case ProcedureStepType.SimpleTextInput:
             r = TextRow("step-\(seqnum)") { row in
                row.title = "Enter text value"
            }.onChange { row in
                    self.handleRowChange(therow: row)            }
            
            default:
                r = LabelRow("step-\(seqnum)") { row in
                    row.title = "not implemented yet: \(step.Step_Type__c!.lowercased())"
            }

        }
        //add the row to the section
        stepSection += [r!]
        
        
        //now that we have created and configured the step, do any other overall config
        if (step.Sequence_Number__c != currentStep?.Sequence_Number__c) {
            stepSection.hidden = true
        }
        
        if(!step.MayEdit!) {
            r!.disabled = true
        }
        
        
        
    
        
        
        //add the section to the form
        form += [stepSection]
        
        
        //wrap up and reload the view
        animateScroll = true
        navigationOptions = RowNavigationOptions.Enabled.union(.StopDisabledRow)
        tableView.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func handleRowChange(therow: BaseRow) {
        
        //TODO: store value before calling next step
        
        
        let nextstep : ProcedureStep = fetchStep(stepid: currentStep!.Proceed_To_Step__c!)
        previousStep = currentStep
        
       // let s = self.form.allSections[nextstep.Sequence_Number__c!]
        //s.hidden = false
        
        
        for s in self.form.allSections {
            if ( s.header?.title == "STEP-\(nextstep.Sequence_Number__c!)") {
                s.hidden = false
                s.evaluateHidden()
            }
        }
 
        currentStep = nextstep
        tableView.reloadData()
    }
    
    func fetchStep(stepid : String) -> ProcedureStep {
        var nextstep : ProcedureStep?
   
        for i in steps {
             if (i.Id == stepid) {
                nextstep = i
                break
            }
        }
    
        return nextstep!
    }
    
    // MARK: Cell actions
    func simpleYesNOValueChanged(){
        print("yes no value changed")
        //row.updateCell() // Re-draws the cell which calls 'update' bellow
    }
    
    func simpleMarkChanged(){
        print("simple mark value changed")
        //row.updateCell() // Re-draws the cell which calls 'update' bellow
    }
    

}
