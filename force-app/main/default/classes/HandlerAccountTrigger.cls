public with sharing class HandlerAccountTrigger {
    
    public static void billingToShippingMethod(List<Account> accountObject){
        for(Account a:accountObject){
            //a.ShippingAddress = a.BillingAddress;  
            a.ShippingCity = a.BillingCity;
            a.ShippingCountry = a.BillingCountry;
            a.ShippingPostalCode = a.BillingPostalCode;
            a.ShippingState = a.BillingState;
            a.ShippingStreet = a.BillingStreet;          
        }    
    }
    public static void changeFieldMethodOnetoAnother(List<Account> accountObjectNew,List<Account> accountObjectOld){
        for(Account accountObject : accountObjectNew){
            if(accountObject.Industry=='Finance'){
                for(Account accountObject1 : accountObjectOld){
                    if((accountObject.Id==accountObject1.Id) && (accountObject1.Industry=='Engineering')){
                        accountObject.Active__C=true;
                    }
                }
            }
        }
    }
    public static void priventFromDeletMethod(List<Account> oldAccountObject){

            for(Account accountObjectForDelete: oldAccountObject){
                 List<Opportunity> opportunityObject =[select Id from opportunity where Id =:accountObjectForDelete.Id];
                 if(accountObjectForDelete.Active__c==true){
                    accountObjectForDelete.Active__c.addError('You cant delete a record because its in active state');
                 }else if(opportunityObject.size()>0 && accountObjectForDelete.Active__c==true ){
                    accountObjectForDelete.Active__c.addError('You cant delete a record because Opportunity Records are associated with This Account ');
                 }    
            }
    }
    public static void taskCreatedForActivityMethod(List<Account> accountObjectForNewRecord){
        List<Task> taskObjectForCreate=new  List<Task>();
        for(Account acoountObject: accountObjectForNewRecord){
            if(acoountObject.AnnualRevenue>50000){
                task t = new task();
                t.Subject='Follow Up Test Task for Acoount : '+acoountObject.Name;
                t.WhatId=acoountObject.Id;
                taskObjectForCreate.add(t);
            }
            Database.insert(taskObjectForCreate);
        }
    }
}
