// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

HelloWorld obj=new HelloWorld();
obj.printHello();


StudentCourse arr=new StudentCourse();
arr.setStudentId(10);
arr.setStudentName('Shubham');
arr.setStudentAddress('Pune');
arr.setStudentFees(1000);
arr.setStudentCourseFee(1000);
System.debug(arr.getStudentId()+' '+arr.getStudentName()+' '+arr.studentFees());

select ID from Account;



ForCollection obj=new ForCollection();
obj.demoMethod();


//------------------------------Exception code----------------------------------

ForExceptionCheck exceptionObject=new ForExceptionCheck();
exceptionObject.dmlExceptionMethod();
exceptionObject.listExceptionMethod();
exceptionObject.nullPointerExceptionMethod();
exceptionObject.queryExceptionMethod();
exceptionObject.genericExceptionMethod();


SOQLtestClassForCheck obj=new SOQLtestClassForCheck();
obj.accountSOQLmethod();


