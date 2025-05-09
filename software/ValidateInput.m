function userinput = ValidateInput(validOpt, DisplayedText)
%main use of this function is to repeatedly prompt the user for inputs till
%they're valid
userInput = input(promptText, 's');  %reading input as string for now
while ~any(strcmp(userInput, validOptions))  % Validate against allowed strings
    fprintf('Invalid input. Please try again.\n');
    userInput = input(promptText, 's'); %recurrs function till while condition is satisfied.
end
end