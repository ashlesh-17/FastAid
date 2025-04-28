public with sharing class SubtaskProcessorUtility {
    
    // Inner class to represent each menu item

    // Wrapper class for Flow input (String)
    public class InputWrapper {
        @InvocableVariable(required=true label='JSON String')
        public String jsonString;
    }

    // Wrapper class for Flow output
    public class OutputWrapper {
        @InvocableVariable(label='Subtasks')
        public List<Subtask> subtasks;
    }

    // Invocable method to parse the JSON and return the list of Subtask
    @InvocableMethod(label='Convert JSON String to Subtasks' description='Parses a JSON string into a list of Subtask objects')
    public static List<OutputWrapper> parseSubtasksFromString(List<InputWrapper> inputList) {
        System.debug(inputList);
        List<OutputWrapper> outputList = new List<OutputWrapper>();

        for (InputWrapper input : inputList) {
            List<Subtask> items = (List<Subtask>) JSON.deserialize(input.jsonString, List<Subtask>.class);
            
            OutputWrapper output = new OutputWrapper();
            output.subtasks = items;
            outputList.add(output);
        }

        return outputList;
    }
}