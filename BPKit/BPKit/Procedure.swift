//
//  Procedure.swift
//  BPKit
//
//  Created by Quinton Wall on 8/22/17.
//  Copyright © 2017 Quinton Wall. All rights reserved.
//

import Foundation


public struct Procedure {
    
    
    //select  RootWorkOrderId, Subject,Id, WorkOrderNumber, WorkTypeId, LastModifiedById,LastModifiedDate, LineItemCount, CreatedById,CreatedDate, MayEdit, IsClosed, IsDeleted, IsLocked, IsStopped, FSL__IsFillInCandidate__c, FSL__Prevent_Geocoding_For_Chatter_Actions__c, FSL__Scheduling_Priority__c, FSL__VisitingHours__c, Procedure_Template__c FROM WorkOrder
    
    
    public var RootWorkOrderId : String?
    public var Subject : String?
    public var Id : String?
    public var WorkOrderNumber : String?
    public var WorkTypeId : String?
    public var LastModifiedById : String?
    public var LastModifiedDate : Date?
    public var LineItemCount : Int?
    public var CreatedById : String?
    public var CreatedDate : Date?
    public var  MayEdit : Bool?
    public var IsClosed : Bool?
    public var IsDeleted : Bool?
    public var IsLocked : Bool?
    public var IsStopped : Bool?
    public var FSL__IsFillInCandidate__c : Bool?
    public var FSL__Prevent_Geocoding_For_Chatter_Actions__c : Bool?
    public var FSL__Scheduling_Priority__c : Int?
    public var FSL__VisitingHours__c : Int?
    public var  Procedure_Template__c : String?
    

    public var steps : [ProcedureStep]?
    
    public init() {}
    
    public init(dictionary: [String: Any]) {
               
        for(key, value) in dictionary {
            switch key.lowercased() {
                case "id":
                    self.Id = (value as? String)
                case "subject":
                    self.Subject = (value as? String)
            case "rootworkorderid":
                self.RootWorkOrderId = (value as? String)
            case "worktypeid":
                self.WorkTypeId = (value as? String)
            case "lastmodifiedbyid":
                self.LastModifiedById = (value as? String)
            case "lastmodifieddate":
                self.LastModifiedDate = Date.dateFromSalesforceString((value as? String)!)
            case "lineitemcount":
                self.LineItemCount = (value as? Int)
            case "createdbyid":
                self.CreatedById = (value as? String)
            case "createddate":
                self.CreatedDate = Date.dateFromSalesforceString((value as? String)!)
            case "mayedit":
                self.MayEdit = (value as? String)?.toBool()
            case "isclosed":
                self.IsClosed = (value as? String)?.toBool()
            case "isdeleted":
                self.IsDeleted = (value as? String)?.toBool()
            case "islocked":
                self.IsLocked = (value as? String)?.toBool()
            case "fsl__isfillincandidate__c":
                self.FSL__IsFillInCandidate__c = (value as? String)?.toBool()
            case "fsl__prevent_geocoding_for_chatter_actions__c":
                self.FSL__Prevent_Geocoding_For_Chatter_Actions__c = (value as? String)?.toBool()
            case "fsl__scheduling_priority__c":
                self.FSL__Scheduling_Priority__c = (value as? Int)
            case "fsl__visitinghours__c":
                self.FSL__VisitingHours__c = (value as? Int)
            case "procedure_template__c":
                self.Procedure_Template__c = (value as? String)
            default:
                continue
                
            }
        }
    }
    
}
