@isTest
private class SubtaskProcessorUtilityTest {

    @isTest
    static void testParseSubtasksFromString() {
        // Step 1: Create a sample list of Subtask objects
        List<Subtask> sampleSubtasks = new List<Subtask>();
        
        Subtask task1 = new Subtask();
        task1.name = 'Subtask 1';
        task1.description = 'Description 1';
        task1.label = 'Label 1';
        task1.fieldtype = 'Text';
        task1.apiName = 'ApiName1';
        
        Subtask task2 = new Subtask();
        task2.name = 'Subtask 2';
        task2.description = 'Description 2';
        task2.label = 'Label 2';
        task2.fieldtype = 'Number';
        task2.apiName = 'ApiName2';
        
        sampleSubtasks.add(task1);
        sampleSubtasks.add(task2);

        // Step 2: Serialize the list into a JSON string
        String jsonString = JSON.serialize(sampleSubtasks);

        // Step 3: Create an InputWrapper with the JSON string
        SubtaskProcessorUtility.InputWrapper inputWrapper = new SubtaskProcessorUtility.InputWrapper();
        inputWrapper.jsonString = jsonString;

        List<SubtaskProcessorUtility.InputWrapper> inputList = new List<SubtaskProcessorUtility.InputWrapper>{inputWrapper};

        // Step 4: Call the method under test
        Test.startTest();
        List<SubtaskProcessorUtility.OutputWrapper> outputList = SubtaskProcessorUtility.parseSubtasksFromString(inputList);
        Test.stopTest();

        // Step 5: Assertions to verify the results
        System.assertNotEquals(null, outputList, 'Output list should not be null');
        System.assertEquals(1, outputList.size(), 'There should be one OutputWrapper');

        SubtaskProcessorUtility.OutputWrapper output = outputList[0];
        System.assertNotEquals(null, output.subtasks, 'Subtasks list should not be null');
        System.assertEquals(2, output.subtasks.size(), 'There should be two subtasks parsed');

        // Check fields of the parsed subtasks
        System.assertEquals('Subtask 1', output.subtasks[0].name);
        System.assertEquals('Description 1', output.subtasks[0].description);
        System.assertEquals('Label 1', output.subtasks[0].label);
        System.assertEquals('Text', output.subtasks[0].fieldtype);
        System.assertEquals('ApiName1', output.subtasks[0].apiName);

        System.assertEquals('Subtask 2', output.subtasks[1].name);
        System.assertEquals('Description 2', output.subtasks[1].description);
        System.assertEquals('Label 2', output.subtasks[1].label);
        System.assertEquals('Number', output.subtasks[1].fieldtype);
        System.assertEquals('ApiName2', output.subtasks[1].apiName);
    }
}