classdef TemplateApps < matlab.uitest.TestCase
    % Implements unit tests for the app templates

    % Copyright 2025 The MathWorks Inc.
    
    %% Properties
    properties
        App
        Figure matlab.ui.Figure
        % TempFolder
    end


    %% Test Method Setup
    methods (TestMethodSetup)

        % function prepareTempFolder(testCase)
        %
        %     % Use a temporary folder for sessions
        %     import matlab.unittest.fixtures.TemporaryFolderFixture
        %     fixture = testCase.applyFixture(TemporaryFolderFixture);
        %     testCase.TempFolder = fixture.Folder;
        %
        % end %function

    end %methods


    %% Test Method Teardown
    methods (TestMethodTeardown)
        % Teardown for each test

        function deleteApp(testCase)

            if isscalar(testCase.App) && isvalid(testCase.App)
                if isscalar(testCase.App.Figure)
                    delete(testCase.App.Figure)
                end
                delete(testCase.App)
            end

        end %function

    end %methods

    %% Test methods
    methods (Test)

        function testTemplateBaseApp(testCase)
            % Verifies behavior of the app template

            % Launch the app
            diag = "Expected app to launch without warnings.";
            fcn = @()TemplateBaseApp();
            testCase.App = testCase.verifyWarningFree(fcn, diag);

            % Verify app and component creation
            diag = "Expected app figure to be populated.";
            testCase.verifyNotEmpty(testCase.App.Figure, diag)

            % Verify app closes
            diag = "Expected app to close without warnings.";
            fcn = @()close(testCase.App);
            testCase.verifyWarningFree(fcn, diag);

            diag = "Expected app to be deleted.";
            testCase.verifyFalse(isvalid(testCase.App), diag)

        end %function


        function testTemplateBaseSingleSessionApp(testCase)
            % Verifies behavior of the app template

            % Launch the app
            diag = "Expected app to launch without warnings.";
            fcn = @()TemplateBaseSingleSessionApp();
            testCase.App = testCase.verifyWarningFree(fcn, diag);

            % Verify app and component creation
            diag = "Expected app figure to be populated.";
            testCase.verifyNotEmpty(testCase.App.Figure, diag)

            % Verify app closes
            diag = "Expected app to close without warnings.";
            fcn = @()close(testCase.App);
            testCase.verifyWarningFree(fcn, diag);

            diag = "Expected app to be deleted.";
            testCase.verifyFalse(isvalid(testCase.App), diag)

        end %function


        function testTemplateBaseMultiSessionApp(testCase)
            % Verifies behavior of the app template

            % Launch the app
            diag = "Expected app to launch without warnings.";
            fcn = @()TemplateBaseMultiSessionApp();
            testCase.App = testCase.verifyWarningFree(fcn, diag);

            % Verify app and component creation
            diag = "Expected app figure to be populated.";
            testCase.verifyNotEmpty(testCase.App.Figure, diag)

            % Verify app closes
            diag = "Expected app to close without warnings.";
            fcn = @()close(testCase.App);
            testCase.verifyWarningFree(fcn, diag);

            diag = "Expected app to be deleted.";
            testCase.verifyFalse(isvalid(testCase.App), diag)

        end %function

    end %methods

end %classdef