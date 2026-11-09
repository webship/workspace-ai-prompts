Feature: The AI Prompts workspace plugin
  Once the plugin is activated and installed, the ai-prompts workspace is on the dashboard, and the
  Plugins page lists the plugin with its four steps.

  Scenario: The workspace page is there
    Given I am on "/ai-prompts"
     Then the element "h1" should be displayed
      And "#webship-workspace-projects, .items-list, .workspace-page" should be attached

  Scenario: The plugin is listed on the Plugins page
    Given I am on "/settings/plugins"
     Then I should see "AI Prompts"
      And I should see "@webship.co/workspace-ai-prompts"
