defmodule Storybook.Components.Base.Header do
  use PhoenixStorybook.Story, :component

  def function, do: &ModernUI.Components.Header.header/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          """
          Main header
          <:subtitle>
          Subtitle
          </:subtitle>
          """
        ]
      }
    ]
  end
end
