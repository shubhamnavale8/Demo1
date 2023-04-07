trigger AccountTrigger on Account (before insert,before update,before delete,after insert,after update,after delete) {
    if(Trigger.isBefore&& Trigger.isInsert){
        HandlerAccountTrigger.billingToShippingMethod(Trigger.new);
    }
    if(Trigger.isBefore&& Trigger.isUpdate){
        HandlerAccountTrigger.changeFieldMethodOnetoAnother(Trigger.new,Trigger.old);
    }

    if(Trigger.isBefore && Trigger.isDelete){
        HandlerAccountTrigger.priventFromDeletMethod(Trigger.old);  
    }

    if(trigger.isBefore && Trigger.isInsert){
        HandlerAccountTrigger.taskCreatedForActivityMethod(Trigger.new);
    }
}