defmodule Storybook.Components.Base.Flash do
  use PhoenixStorybook.Story, :component

  def function, do: &ModernUI.Components.Flash.flash/1
  def imports, do: [{ModernUI.Components.Button, button: 1}]
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          kind: :info
        },
        slots: [
          """
          A simple info flash message.
          """
        ]
      }
    ]
  end
end
