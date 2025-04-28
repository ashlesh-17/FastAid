@IsTest
private with sharing class CallMetadataApiTest {
    
    @IsTest
    static void testDescribeMetadata() {
        // Setup test data
        CallMetadataApi.MetadataDescription metadataDesc = new CallMetadataApi.MetadataDescription();
        metadataDesc.soapAction = 'describeMetadata';
        
        // Setup mock response
        String mockResponseBody = '<?xml version="1.0" encoding="UTF-8"?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns="http://soap.sforce.com/2006/04/metadata"><soapenv:Body><describeMetadataResponse><result><metadataObjects><directoryName>classes</directoryName><inFolder>false</inFolder><metaFile>false</metaFile><suffix>cls</suffix><xmlName>ApexClass</xmlName></metadataObjects></result></describeMetadataResponse></soapenv:Body></soapenv:Envelope>';
        CallMetadataApi.mockedResponse = new HttpResponse();
        CallMetadataApi.mockedResponse.setBody(mockResponseBody);
        CallMetadataApi.mockedResponse.setStatusCode(200);
        
        // Start test execution context
        Test.startTest();
        
        // Execute the method
        List<CallMetadataApi.Output> results = CallMetadataApi.execute(new List<CallMetadataApi.MetadataDescription>{metadataDesc});
        
        // End test execution context
        Test.stopTest();
        
        // Verify results
        System.assertEquals(1, results.size(), 'Should return exactly one result');
        System.assertEquals(mockResponseBody, results[0].responseBody, 'Response body should match mock response');
    }
    
    @IsTest
    static void testListMetadata() {
        // Setup test data
        CallMetadataApi.MetadataDescription metadataDesc = new CallMetadataApi.MetadataDescription();
        metadataDesc.soapAction = 'listMetadata';
        metadataDesc.typeName = 'CustomObject';
        
        // Setup mock response
        String mockResponseBody = '<?xml version="1.0" encoding="UTF-8"?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns="http://soap.sforce.com/2006/04/metadata"><soapenv:Body><listMetadataResponse><result><createdById>005000000000000AAA</createdById><createdByName>User User</createdByName><createdDate>2024-01-01T00:00:00.000Z</createdDate><fileName>objects/Account.object</fileName><fullName>Account</fullName><id>000000000000000AAA</id><lastModifiedById>005000000000000AAA</lastModifiedById><lastModifiedByName>User User</lastModifiedByName><lastModifiedDate>2024-01-01T00:00:00.000Z</lastModifiedDate><manageableState>unmanaged</manageableState><type>CustomObject</type></result></listMetadataResponse></soapenv:Body></soapenv:Envelope>';
        CallMetadataApi.mockedResponse = new HttpResponse();
        CallMetadataApi.mockedResponse.setBody(mockResponseBody);
        CallMetadataApi.mockedResponse.setStatusCode(200);
        
        // Start test execution context
        Test.startTest();
        
        // Execute the method
        List<CallMetadataApi.Output> results = CallMetadataApi.execute(new List<CallMetadataApi.MetadataDescription>{metadataDesc});
        
        // End test execution context
        Test.stopTest();
        
        // Verify results
        System.assertEquals(1, results.size(), 'Should return exactly one result');
        System.assertEquals(mockResponseBody, results[0].responseBody, 'Response body should match mock response');
    }
    
    @IsTest
    static void testReadMetadata() {
        // Setup test data
        CallMetadataApi.MetadataDescription metadataDesc = new CallMetadataApi.MetadataDescription();
        metadataDesc.soapAction = 'readMetadata';
        metadataDesc.typeName = 'CustomObject';
        metadataDesc.fullName = 'Account';
        
        // Setup mock response
        String mockResponseBody = '<?xml version="1.0" encoding="UTF-8"?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns="http://soap.sforce.com/2006/04/metadata"><soapenv:Body><readMetadataResponse><result><records><fullName>Account</fullName><label>Account</label><pluralLabel>Accounts</pluralLabel><nameField><label>Account Name</label><type>Text</type></nameField><deploymentStatus>Deployed</deploymentStatus><sharingModel>ReadWrite</sharingModel></records></result></readMetadataResponse></soapenv:Body></soapenv:Envelope>';
        CallMetadataApi.mockedResponse = new HttpResponse();
        CallMetadataApi.mockedResponse.setBody(mockResponseBody);
        CallMetadataApi.mockedResponse.setStatusCode(200);
        
        // Start test execution context
        Test.startTest();
        
        // Execute the method
        List<CallMetadataApi.Output> results = CallMetadataApi.execute(new List<CallMetadataApi.MetadataDescription>{metadataDesc});
        
        // End test execution context
        Test.stopTest();
        
        // Verify results
        System.assertEquals(1, results.size(), 'Should return exactly one result');
        System.assertEquals(mockResponseBody, results[0].responseBody, 'Response body should match mock response');
    }
    
    @IsTest
    static void testCreateMetadata() {
        // Setup test data
        CallMetadataApi.MetadataDescription metadataDesc = new CallMetadataApi.MetadataDescription();
        metadataDesc.soapAction = 'createMetadata';
        metadataDesc.typeName = 'CustomField';
        metadataDesc.attributesJson = '{"fullName":"Account.TestField__c","label":"Test Field","type":"Text","length":255}';
        
        // Setup mock response
        String mockResponseBody = '<?xml version="1.0" encoding="UTF-8"?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns="http://soap.sforce.com/2006/04/metadata"><soapenv:Body><createMetadataResponse><result><created>true</created><fullName>Account.TestField__c</fullName><success>true</success></result></createMetadataResponse></soapenv:Body></soapenv:Envelope>';
        CallMetadataApi.mockedResponse = new HttpResponse();
        CallMetadataApi.mockedResponse.setBody(mockResponseBody);
        CallMetadataApi.mockedResponse.setStatusCode(200);
        
        // Start test execution context
        Test.startTest();
        
        // Execute the method
        List<CallMetadataApi.Output> results = CallMetadataApi.execute(new List<CallMetadataApi.MetadataDescription>{metadataDesc});
        
        // End test execution context
        Test.stopTest();
        
        // Verify results
        System.assertEquals(1, results.size(), 'Should return exactly one result');
        System.assertEquals(mockResponseBody, results[0].responseBody, 'Response body should match mock response');
    }
    
    @IsTest
    static void testErrorHandling() {
        // Setup test data with invalid soap action
        CallMetadataApi.MetadataDescription metadataDesc = new CallMetadataApi.MetadataDescription();
        metadataDesc.soapAction = 'invalidAction';
        
        // Setup mock response with error
        String mockResponseBody = '<?xml version="1.0" encoding="UTF-8"?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns="http://soap.sforce.com/2006/04/metadata"><soapenv:Body><soapenv:Fault><faultcode>soapenv:Client</faultcode><faultstring>Invalid SOAP action: invalidAction</faultstring></soapenv:Fault></soapenv:Body></soapenv:Envelope>';
        CallMetadataApi.mockedResponse = new HttpResponse();
        CallMetadataApi.mockedResponse.setBody(mockResponseBody);
        CallMetadataApi.mockedResponse.setStatusCode(400);
        
        // Start test execution context
        Test.startTest();
        
        // Execute the method
        List<CallMetadataApi.Output> results = CallMetadataApi.execute(new List<CallMetadataApi.MetadataDescription>{metadataDesc});
        
        // End test execution context
        Test.stopTest();
        
        // Verify results
        System.assertEquals(1, results.size(), 'Should return exactly one result');
        System.assertNotEquals(null, results[0].responseBody, 'Response body should contain error message');
        System.assert(results[0].responseBody.contains('Invalid SOAP action'), 'Response should contain error message');
    }
}