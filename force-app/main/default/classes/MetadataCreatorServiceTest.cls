@IsTest
private with sharing class MetadataCreatorServiceTest {
    
    @IsTest
    static void testSuccessfulMetadataCreation() {
        // Setup test data
        MetadataCreatorService.Input input = new MetadataCreatorService.Input();
        input.xmlDefinition = '<s:Body><createMetadata xmlns="http://soap.sforce.com/2006/04/metadata"><metadata xsi:type="CustomObject"><fullName>TestObject__c</fullName><label>Test Object</label><pluralLabel>Test Objects</pluralLabel><nameField><label>Test Object Name</label><type>Text</type></nameField><deploymentStatus>Deployed</deploymentStatus><sharingModel>ReadWrite</sharingModel></metadata></createMetadata></s:Body>';
        
        // Setup mock response
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(200, '<?xml version="1.0" encoding="UTF-8"?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns="http://soap.sforce.com/2006/04/metadata"><soapenv:Body><createMetadataResponse><result><created>true</created><fullName>TestObject__c</fullName><success>true</success></result></createMetadataResponse></soapenv:Body></soapenv:Envelope>'));
        
        // Start test execution context
        Test.startTest();
        
        // Execute the method
        List<MetadataCreatorService.Output> results = MetadataCreatorService.createMetadata(new List<MetadataCreatorService.Input>{input});
        
        // End test execution context
        Test.stopTest();
        
        // Verify results
        System.assertEquals(1, results.size(), 'Should return exactly one result');
        System.assertEquals('Object created successfully', results[0].result, 'Should indicate successful creation');
    }
    
    @IsTest
    static void testFailedMetadataCreation() {
        // Setup test data
        MetadataCreatorService.Input input = new MetadataCreatorService.Input();
        input.xmlDefinition = '<s:Body><createMetadata xmlns="http://soap.sforce.com/2006/04/metadata"><metadata xsi:type="CustomObject"><fullName>TestObject__c</fullName><label>Test Object</label><pluralLabel>Test Objects</pluralLabel><nameField><label>Test Object Name</label><type>Text</type></nameField><deploymentStatus>Deployed</deploymentStatus><sharingModel>ReadWrite</sharingModel></metadata></createMetadata></s:Body>';
        
        // Setup mock response with error
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(400, '<?xml version="1.0" encoding="UTF-8"?><soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns="http://soap.sforce.com/2006/04/metadata"><soapenv:Body><soapenv:Fault><faultcode>soapenv:Client</faultcode><faultstring>INVALID_SESSION_ID: Invalid Session ID found in SessionHeader: Illegal Session</faultstring></soapenv:Fault></soapenv:Body></soapenv:Envelope>'));
        
        // Start test execution context
        Test.startTest();
        
        // Execute the method
        List<MetadataCreatorService.Output> results = MetadataCreatorService.createMetadata(new List<MetadataCreatorService.Input>{input});
        
        // End test execution context
        Test.stopTest();
        
        // Verify results
        System.assertEquals(1, results.size(), 'Should return exactly one result');
        System.assert(results[0].result.startsWith('Failed to create object: 400'), 'Should indicate failed creation with status code');
    }
    
    @IsTest
    static void testExceptionHandling() {
        // Setup test data
        MetadataCreatorService.Input input = new MetadataCreatorService.Input();
        input.xmlDefinition = '<s:Body><createMetadata xmlns="http://soap.sforce.com/2006/04/metadata"><metadata xsi:type="CustomObject"><fullName>TestObject__c</fullName><label>Test Object</label><pluralLabel>Test Objects</pluralLabel><nameField><label>Test Object Name</label><type>Text</type></nameField><deploymentStatus>Deployed</deploymentStatus><sharingModel>ReadWrite</sharingModel></metadata></createMetadata></s:Body>';
        
        // Setup mock to throw exception
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseGenerator(true));
        
        // Start test execution context
        Test.startTest();
        
        // Execute the method
        List<MetadataCreatorService.Output> results = MetadataCreatorService.createMetadata(new List<MetadataCreatorService.Input>{input});
        
        // End test execution context
        Test.stopTest();
        
        // Verify results
        System.assertEquals(1, results.size(), 'Should return exactly one result');
        System.assert(results[0].result.startsWith('Exception:'), 'Should indicate exception occurred');
    }
    
    @IsTest
    static void testSoapRequestBuilding() {
        // Setup test data
        String soapBody = '<s:Body><createMetadata xmlns="http://soap.sforce.com/2006/04/metadata"><metadata xsi:type="CustomObject"><fullName>TestObject__c</fullName></metadata></createMetadata></s:Body>';
        
        // Start test execution context
        Test.startTest();
        
        // Execute the method
        String soapRequest = MetadataCreatorService.buildSoapRequest(soapBody);
        
        // End test execution context
        Test.stopTest();
        
        // Verify results
        System.assert(soapRequest.contains('<s:Envelope'), 'Should contain SOAP envelope');
        System.assert(soapRequest.contains('<s:Header>'), 'Should contain SOAP header');
        System.assert(soapRequest.contains('<h:SessionHeader'), 'Should contain session header');
        System.assert(soapRequest.contains(soapBody), 'Should contain the provided SOAP body');
    }
    
    // Mock HTTP Response Generator
    private class MockHttpResponseGenerator implements HttpCalloutMock {
        private Integer statusCode;
        private String responseBody;
        private Boolean throwException;
        
        public MockHttpResponseGenerator(Integer statusCode, String responseBody) {
            this.statusCode = statusCode;
            this.responseBody = responseBody;
            this.throwException = false;
        }
        
        public MockHttpResponseGenerator(Boolean throwException) {
            this.throwException = throwException;
        }
        
        public HttpResponse respond(HttpRequest req) {
            if (throwException) {
                throw new CalloutException('Test exception');
            }
            
            HttpResponse res = new HttpResponse();
            res.setStatusCode(statusCode);
            res.setBody(responseBody);
            return res;
        }
    }
}