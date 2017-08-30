//
//  ProcedureData.swift
//  BPKit
//
//  Created by Quinton Wall on 8/22/17.
//  Copyright © 2017 Quinton Wall. All rights reserved.
//

import Foundation
import SwiftlySalesforce
import Alamofire
import SwiftyJSON

public final class ProcedureData {
    
    public static let shared = ProcedureData()
    
    public fileprivate(set) var cachedProcedures : [Procedure]?
    
    public func getAllProcedures() -> Promise<[Procedure]> {
        
     
        return Promise<[Procedure]> {
            fulfill, reject in
            first {
                salesforce.identity()
                
                }.then { result in
                    let soql = "select  RootWorkOrderId, Subject,Id, WorkOrderNumber, WorkTypeId, LastModifiedById,LastModifiedDate, LineItemCount, CreatedById,CreatedDate, MayEdit, IsClosed, IsDeleted, IsLocked, IsStopped, FSL__IsFillInCandidate__c, FSL__Prevent_Geocoding_For_Chatter_Actions__c, FSL__Scheduling_Priority__c, FSL__VisitingHours__c, Procedure_Template__c FROM WorkOrder"
                    return salesforce.query(soql: soql)
                }.then {
                    (result: QueryResult) -> () in
                    let procedures = result.records.map { Procedure(dictionary: $0) }
                    self.cachedProcedures = procedures
                    fulfill(procedures)
                }.catch { error in
                    reject(error)
            }
            
        }
    }
    
    public func getSteps(forProcedure : String ) -> Promise<[ProcedureStep]> {
        
        return Promise<[ProcedureStep]> {
            fulfill, reject in
            first {
                salesforce.identity()
                
                }.then { result in
                    let soql = "select Actual_Tag_Number__c, Address, Answer__c, Approval_Needed__c, Asset_Verified__c, AssetId, AssetID__c, Branch_On__c, Branch_To_Procedure_ID__c, Branch_To_Step_ID__c, Branch_To_What__c, Chatter_Group_ID__c, Condition_1_5__c, CreatedById, CreatedDate, DB_Days__c, Decimal_Result__c, Description, Discount, Duration, DurationInMinutes, DurationType, EndDate, FSL__IsFillInCandidate__c, FSL__VisitingHours__c, GeocodeAccuracy, GUID__c, Has_Branching__c, High_Number_Reading_Threshold__c, Id, Image__c, Image_Src__c, Insert_After_Step__c, Instruction__c, IsClosed, IsDeleted, IsLocked, LastModifiedById, LastModifiedDate, LineItemNumber, LineItemNumber__c, ListPrice, Low_Number_Reading_Threshold__c, Marked_As_Done__c, MayEdit, Number_Result__c, Operator_Comment__c, OrderId, Otherwise_Next_Step_ID__c, ParentWorkOrderLineItemId, Pass_or_Fail_Result__c, Post_to_Chatter_Group_On_Issue__c, PricebookEntryId, Procedure_Studio_Step_Type__c, Procedure_Type__c, Proceed_To_Step__c, Product2Id, Prompt_for_Emergency_on_Issue__c, Quantity, Question__c, RecordTypeId, Remarks_Key_Points__c, Response__c, Response_Long__c, Resulting_Inputs__c, RootWorkOrderLineItemId, Selected_Option__c, Sequence_Number__c, ServiceTerritoryId, Skip_Step_Description__c, Skip_Step_Summary__c, Skipped__c, StartDate, Status, StatusCategory, Step_ID__c, Step_Type__c, Subject, Subtotal, SystemModstamp, Target_Asset_Tag_ID__c, Target_Tag_Number__c, Template__c, Template_Step__c, TotalPrice, UnitPrice, WorkOrderId, WorkTypeId, Yes_or_No_Result__c from WorkOrderLineItem where WorkOrderId = '\(String(describing: forProcedure))' order by Sequence_Number__c ASC"
                    return salesforce.query(soql: soql)
                }.then {
                    (result: QueryResult) -> () in
                    let steps = result.records.map { ProcedureStep(dictionary: $0) }
                    fulfill(steps)
                }.catch { error in
                    reject(error)
            }
            
        }
        
    }

    

}

