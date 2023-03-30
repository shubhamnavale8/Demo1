public with sharing class ForMailSending {
    public ForMailSending() {

    }
    public void sendMailMethod(String body,String mailID,String subject){
        
        Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        mail.setToAddresses(mailID);
        Messaging.SendEmailResult[] result= Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
        inspectResult(result);
        
    }
    private static Boolean inspectResult(Messaging.SendEmailResult[] results){
        Boolean sendResult =true;

        for(Messaging.SendEmailResult res : results){
            if(res.isSuccess()){
                System.debug('Email sent successfully'); 
            } 
            else {
                 sendResult = false; System.debug('The following errors occurred: ' + res.getErrors()); 
            } 
            
         return sendResult;
        }
    }

}