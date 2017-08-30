//
//  ProcedureStep.swift
//  BPKit
//
//  Created by Quinton Wall on 8/22/17.
//  Copyright © 2017 Quinton Wall. All rights reserved.
//

import Foundation

//select Actual_Tag_Number__c, Address, Answer__c, Approval_Needed__c, Asset_Verified__c, AssetId, AssetID__c, Branch_On__c, Branch_To_Procedure_ID__c, Branch_To_Step_ID__c, Branch_To_What__c, Chatter_Group_ID__c, Condition_1_5__c, CreatedById, CreatedDate, DB_Days__c, Decimal_Result__c, Description, Discount, Duration, DurationInMinutes, DurationType, EndDate, FSL__IsFillInCandidate__c, FSL__VisitingHours__c, GeocodeAccuracy, GUID__c, Has_Branching__c, High_Number_Reading_Threshold__c, Id, Image__c, Image_Src__c, Insert_After_Step__c, Instruction__c, IsClosed, IsDeleted, IsLocked, LastModifiedById, LastModifiedDate, LineItemNumber, LineItemNumber__c, ListPrice, Low_Number_Reading_Threshold__c, Marked_As_Done__c, MayEdit, Number_Result__c, Operator_Comment__c, OrderId, Otherwise_Next_Step_ID__c, ParentWorkOrderLineItemId, Pass_or_Fail_Result__c, Post_to_Chatter_Group_On_Issue__c, PricebookEntryId, Procedure_Studio_Step_Type__c, Procedure_Type__c, Proceed_To_Step__c, Product2Id, Prompt_for_Emergency_on_Issue__c, Quantity, Question__c, RecordTypeId, Remarks_Key_Points__c, Response__c, Response_Long__c, Resulting_Inputs__c, RootWorkOrderLineItemId, Selected_Option__c, Sequence_Number__c, ServiceTerritoryId, Skip_Step_Description__c, Skip_Step_Summary__c, Skipped__c, StartDate, Status, StatusCategory, Step_ID__c, Step_Type__c, Subject, Subtotal, SystemModstamp, Target_Asset_Tag_ID__c, Target_Tag_Number__c, Template__c, Template_Step__c, TotalPrice, UnitPrice, WorkOrderId, WorkTypeId, Yes_or_No_Result__c from WorkOrderLineItem where workorderid = '0WOf4000000fggZGAQ'

struct ProcedureStepType {
    static var SimpleYESNO  : String =  "simple yes no"
    static var ComplexInput  : String =  "complex input"
    static var SimpleMarkComplete  : String =  "simple mark complete"
    static var NoInputNeeded  : String =  "no input needed"
    static var NumberInput  : String =  "number input"
    static var SimpleTextInput  : String =  "simple text input"
    static var TextWithBranching  : String =  "text with branching"
    static var SimplePassFail  : String =  "simple pass fail"
    static var AssetVerification  : String =  "asset verification"
    

}


public struct ProcedureStep {
    
      public var Actual_Tag_Number__c : String?
    //Address
    public var Answer__c : String?
    public var Approval_Needed__c : Bool?
    public var Asset_Verified__c : Bool?
    public var AssetID__c : String?
    public var Branch_On__c : String?
    public var Branch_To_Procedure_ID__c : String?
    public var Branch_To_Step_ID__c : String?
    public var Branch_To_What__c : String?
    public var Chatter_Group_ID__c : String?
    public var Condition_1_5__c : String?
    public var CreatedById : String?
    public var CreatedDate : Date?
    public var DB_Days__c : Int?
    public var Decimal_Result__c : Double?
    public var Description : String?
    public var Duration : Int?
    public var DurationInMinutes : Int?
    public var DurationType : String?
    public var EndDate : Date?
    public var FSL__IsFillInCandidate__c : Bool?
    public var FSL__VisitingHours__c : String?
   // public var GeocodeAccuracy : String?
    public var GUID__c : String?
    public var Has_Branching__c : Bool?
    public var High_Number_Reading_Threshold__c : Int?
    public var Id : String?
    public var Image__c : String?
    public var Image_Src__c : String?
    public var Insert_After_Step__c : String?
    public var Instruction__c : String?
    public var IsClosed : Bool?
    public var IsDeleted : Bool?
    public var IsLocked : Bool?
    public var LastModifiedById : String?
    public var LastModifiedDate : Date?
    public var LineItemNumber : Int?
    public var LineItemNumber__c : Int?
    public var ListPrice : Double?
    public var Low_Number_Reading_Threshold__c : Int?
    public var Marked_As_Done__c : Bool?
    public var MayEdit : Bool?
    public var Number_Result__c : Int?
    public var Operator_Comment__c : String?
    public var OrderId : String?
    public var Otherwise_Next_Step_ID__c : String?
    public var ParentWorkOrderLineItemId : String?
    public var Pass_or_Fail_Result__c : Bool?
    public var Post_to_Chatter_Group_On_Issue__c : Bool?
    public var Procedure_Studio_Step_Type__c : String?
    public var Procedure_Type__c : String?
    public var Proceed_To_Step__c : String?
    public var Prompt_for_Emergency_on_Issue__c : Bool?
    public var Question__c : String?
    public var RecordTypeId : String?
    public var Remarks_Key_Points__c : String?
    public var Response__c : String?
    public var Response_Long__c : String?
    public var Resulting_Inputs__c : String?
    public var RootWorkOrderLineItemId : String?
    public var Selected_Option__c : String?
    public var Sequence_Number__c : Int?
    public var ServiceTerritoryId : String?
    public var Skip_Step_Description__c : String?
    public var Skip_Step_Summary__c : String?
    public var Skipped__c : Bool?
    public var StartDate : Date?
    public var Status : String?
    public var StatusCategory : String?
    public var Step_ID__c : String?
    public var Step_Type__c : String?
    public var  Subject : String?
    public var Target_Asset_Tag_ID__c : String?
    public var  Target_Tag_Number__c : String?
    public var  Template__c : String?
    public var  Template_Step__c : String?
    public var  WorkOrderId : String?
    public var  WorkTypeId : String?
    public var  Yes_or_No_Result__c : Bool?
    
    public init() {}
    
    public init(dictionary: [String: Any]) {
        
        
        
        for(key, value) in dictionary {
            switch key.lowercased() {
                case "actual_tag_number__c":
                    self.Actual_Tag_Number__c = value as? String
                case "answer__c":
                    self.Answer__c = value as? String
                case "approval_needed__c":
                    self.Approval_Needed__c = value as? Bool
                case "asset_verified__c":
                    self.Asset_Verified__c = value as? Bool
                 case "assetid__c":
                    self.AssetID__c = value as? String
                case "branch_on__c":
                    self.Branch_On__c = value as? String
                case "branch_to_procedure_id__c":
                    self.Branch_To_Procedure_ID__c = value as? String
                case "branch_to_step_id__c":
                    self.Branch_To_Step_ID__c = value as? String
                case "branch_to_what__c":
                    self.Branch_To_What__c = value as? String
                case "chatter_group_id__c":
                    self.Chatter_Group_ID__c = value as? String
                case "condition_1_5__c":
                    self.Condition_1_5__c = value as? String
                case "createdbyid":
                    self.CreatedById = value as? String
                case "subjCreatedDateect":
                    self.CreatedDate = value as? Date
                case "db_days__c":
                    self.DB_Days__c = value as? Int
                case "decimal_result__c":
                    self.Decimal_Result__c = value as? Double
                case "description":
                    self.Description = value as? String
                case "duration":
                    self.Duration = value as? Int
                case "durationinminutes":
                    self.DurationInMinutes = value as? Int
                case "durationtype":
                    self.DurationType = value as? String
                case "enddate":
                    self.EndDate = value as? Date
                case "fsl__isfillincandidate__c":
                    self.FSL__IsFillInCandidate__c = value as? Bool
                case "fsl__visitinghours__c":
                    self.FSL__VisitingHours__c = value as? String
                case "guid__c":
                    self.GUID__c = value as? String
                case "has_branching__c":
                    self.Has_Branching__c = value as? Bool
                case "high_number_reading_threshold__c":
                    self.High_Number_Reading_Threshold__c = value as? Int
                case "id":
                    self.Id = value as? String
                case "image__c":
                    self.Image__c = value as? String
                case "image_src__c":
                    self.Image_Src__c = value as? String
                case "insert_after_step__c":
                    self.Insert_After_Step__c = value as? String
                case "instruction__c":
                    self.Instruction__c = value as? String
                case "isclosed":
                    self.IsClosed = value as? Bool
                case "isdeleted":
                    self.IsDeleted = value as? Bool
                case "islocked":
                    self.IsLocked = value as? Bool
                case "lastmodifiedbyid":
                    self.LastModifiedById = value as? String
                case "lastmodifieddate":
                    self.LastModifiedDate = value as? Date
                case "lineitemnumber":
                    self.LineItemNumber = value as? Int
                case "lineitemnumber__c":
                    self.LineItemNumber__c = value as? Int
                case "low_number_reading_threshold__c":
                    self.Low_Number_Reading_Threshold__c = value as? Int
                case "marked_as_done__c":
                    self.Marked_As_Done__c = value as? Bool
                case "mayedit":
                    self.MayEdit = value as? Bool
                case "number_result__c":
                    self.Number_Result__c = value as? Int
                case "operator_comment__c":
                    self.Operator_Comment__c = value as? String
                case "orderid":
                    self.OrderId = value as? String
                case "otherwise_next_step_id__c":
                    self.Otherwise_Next_Step_ID__c = value as? String
                case "parentworkorderlineitemid":
                    self.ParentWorkOrderLineItemId = value as? String
                case "procedure_studio_step_type__c":
                    self.Procedure_Studio_Step_Type__c = value as? String
                case "branch_to_procedure_id__c":
                    self.Branch_To_Procedure_ID__c = value as? String
                case "procedure_type__c":
                    self.Procedure_Type__c = value as? String
                case "proceed_to_step__c":
                    self.Proceed_To_Step__c = value as? String
                case "prompt_for_emergency_on_issue__c":
                    self.Prompt_for_Emergency_on_Issue__c = value as? Bool
                case "question__c":
                    self.Question__c = value as? String
                case "recordtypeid":
                    self.RecordTypeId = value as? String
                case "remarks_key_points__c":
                    self.Remarks_Key_Points__c = value as? String
                case "response__c":
                    self.Response__c = value as? String
                case "response_long__c":
                    self.Response_Long__c = value as? String
                case "resulting_inputs__c":
                    self.Resulting_Inputs__c = value as? String
                case "rootworkorderlineitemid":
                    self.RootWorkOrderLineItemId = value as? String
                case "selected_option__c":
                    self.Selected_Option__c = value as? String
                case "sequence_number__c":
                    self.Sequence_Number__c = value as? Int
                case "skip_step_description__c":
                    self.Skip_Step_Description__c = value as? String
                case "skip_step_summary__c":
                    self.Skip_Step_Summary__c = value as? String
                case "skipped__c":
                    self.Skipped__c = value as? Bool
                case "startdate":
                    self.StartDate = value as? Date
                case "status":
                    self.Status = value as? String
                case "statuscategory":
                    self.StatusCategory = value as? String
                case "step_id__c":
                    self.Step_ID__c = value as? String
                case "step_type__c":
                    self.Step_Type__c = value as? String
                case "subject":
                    self.Subject = value as? String
                case "target_asset_tag_id__c":
                    self.Target_Asset_Tag_ID__c = value as? String
                case "target_tag_number__c":
                    self.Target_Tag_Number__c = value as? String
                case "template__c":
                    self.Template__c = value as? String
                case "template_step__c":
                    self.Template_Step__c = value as? String
                case "workorderid":
                    self.WorkOrderId = value as? String
                case "worktypeid":
                    self.WorkTypeId = value as? String
                case "yes_or_no_result__c":
                    self.Yes_or_No_Result__c = value as? Bool
                default:
                    continue
                
            }
        }
    }
    
    
}



