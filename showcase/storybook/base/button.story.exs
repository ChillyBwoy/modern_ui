defmodule Storybook.Components.Base.Button do
  use PhoenixStorybook.Story, :component

  def function, do: &ModernUI.Components.Button.button/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          type: "button"
        },
        slots: [
          "Click me!"
        ]
      }
    ]
  end
end
