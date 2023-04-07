@isTest
public class testAccountTrigger {
    
    @isTest
    public static void testbillingToShippingMethod(){
        List<Account> listAccount=new List<Account>();
        
        for(Integer integgerVar=0; integgerVar<25; integgerVar++){
            Account accountObject=new Account();
            accountObject.name='IDBI Bank_Test'+integgerVar;
            accountObject.BillingCity='Aurangabad_test'+integgerVar;
            accountObject.BillingCity='India_test'+integgerVar;
            accountObject.BillingPostalCode='431136'+integgerVar;
            accountObject.BillingState='Maharashtra_test'+integgerVar;
            accountObject.BillingStreet='chakan road_test'+integgerVar;
            listAccount.add(accountObject);
        }
        Database.insert(listAccount,false);
        //insert accountObject;
        Integer i=0;
        List<Account> forAccountObject=[select BillingCity,ShippingCity,ShippingPostalCode,BillingPostalCode from Account ];
        for(Account result:forAccountObject){
            System.assertEquals(result.ShippingCity, result.BillingCity,'Test Case is Pass 1.'+(i++));
            System.assertEquals(result.ShippingPostalCode, result.BillingPostalCode,'Test Case is Pass 2.'+(i++));
        }
    }
    @isTest
    public static void testchangeFieldMethodOnetoAnother(){
        List<Account> listAccount=new List<Account>();
        for(Integer integgerVar=0 ;integgerVar<25; integgerVar++){
            Account accountObject=new Account();
            accountObject.name='IDBI Bank_Test'+integgerVar;
            accountObject.BillingCity='Aurangabad_test'+integgerVar;
            accountObject.BillingCity='India_test'+integgerVar;
            accountObject.BillingPostalCode='431136'+integgerVar;
            accountObject.BillingState='Maharashtra_test'+integgerVar;
            accountObject.BillingStreet='chakan road_test'+integgerVar;
            accountObject.Industry='Engineering';
            listAccount.add(accountObject);
        }
        Database.insert(listAccount,false);
        List<Account> listAccount2=[select Id,Industry,Active__c from Account ];
        List<Account> listAccount3=new  List<Account>();
        for(Account accountObjectForItr:listAccount2 ){
            accountObjectForItr.Industry='Finance';
            listAccount3.add(accountObjectForItr);
        }
        Database.update(listAccount3,false);
        List<Account> resultListAccount=[select Id,Industry,Active__c from Account ];
        for(Account result:resultListAccount){
            System.assertEquals(true,result.Active__c);
        }

    }
    @isTest
    public static void testpriventFromDeletMethod(){
        List<Account> listAccount=new List<Account>();
        
        for(Integer integgerVar=0; integgerVar<25; integgerVar++){
            Account accountObject=new Account();
            accountObject.name='IDBI Bank_Test'+integgerVar;
            accountObject.BillingCity='Aurangabad_test'+integgerVar;
            accountObject.BillingCity='India_test'+integgerVar;
            accountObject.BillingPostalCode='431136'+integgerVar;
            accountObject.BillingState='Maharashtra_test'+integgerVar;
            accountObject.BillingStreet='chakan road_test'+integgerVar;
            accountObject.Active__c=true;
            listAccount.add(accountObject);
        }
        Database.insert(listAccount,false);

        List<Account> accountListObject=[select Id,Name,Industry,Active__c from Account ];
        Database.delete(accountListObject,false);
        List<Account> forDeleteAccount=[select Id,Name,Industry,Active__c from Account ];
        System.assertNotEquals(0, forDeleteAccount.size());

    }
}