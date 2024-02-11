CaserecordQ obj= new CaserecordQ();
id jobId= system.enqueueJob(obj);
system.debug('Job Id Number is ->'+jobId);