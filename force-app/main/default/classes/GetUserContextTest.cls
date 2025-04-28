@IsTest
private class GetUserContextTest {
    @IsTest
    static void testGetUserContext() {
        // Test data setup
        User testUser = [SELECT Id, Name, LanguageLocaleKey, TimeZoneSidKey FROM User WHERE Id = :UserInfo.getUserId()];
        
        // Execute the invocable method
        List<GetUserContext.Context> contexts = GetUserContext.execute(new List<String>{'dummy'});
        
        // Verify results
        System.assertEquals(1, contexts.size(), 'Should return exactly one context');
        GetUserContext.Context context = contexts[0];
        
        // Verify user details
        System.assertEquals(UserInfo.getUserId(), context.userId, 'User ID should match');
        System.assertEquals(UserInfo.getFirstName(), context.userFirstName, 'First name should match');
        System.assertEquals(UserInfo.getLastName(), context.userLastName, 'Last name should match');
        System.assertEquals(UserInfo.getLanguage(), context.userLanguage, 'Language should match');
        System.assertEquals(UserInfo.getTimeZone().getID(), context.userTimezone, 'Timezone should match');
        System.assertEquals(UserInfo.getUserEmail(), context.userEmail, 'Email should match');
        
        // Verify organization details
        System.assertEquals(UserInfo.getOrganizationId(), context.orgId, 'Organization ID should match');
        System.assertEquals(URL.getOrgDomainUrl().toExternalForm(), context.baseUrlForLinks, 'Base URL should match');
        
        // Verify DateTime format includes timezone
        System.assertNotEquals(null, context.userDateTime, 'DateTime should not be null');
    }
    
    @IsTest
    static void testGetUserContextWithNullInput() {
        // Execute with null input
        List<GetUserContext.Context> contexts = GetUserContext.execute(null);
        
        // Verify results
        System.assertEquals(1, contexts.size(), 'Should return exactly one context even with null input');
        GetUserContext.Context context = contexts[0];
        
        // Verify basic properties are set
        System.assertNotEquals(null, context.userId, 'User ID should not be null');
        System.assertNotEquals(null, context.userFirstName, 'First name should not be null');
        System.assertNotEquals(null, context.userLastName, 'Last name should not be null');
        System.assertNotEquals(null, context.userDateTime, 'DateTime should not be null');
    }
}