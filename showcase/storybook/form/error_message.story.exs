defmodule Storybook.Components.Form.ErrorMessage do
  use PhoenixStorybook.Story, :component

  def function, do: &ModernUI.Components.ErrorMessage.error_message/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          """
          Oopsie doopsie, something happened
          """
        ]
      }
    ]
  end
end
