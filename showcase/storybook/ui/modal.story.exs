defmodule Storybook.Components.UI.Flash do
  use PhoenixStorybook.Story, :component

  def function, do: &ModernUI.Components.Modal.modal/1
  def imports, do: [{ModernUI.Components.Button, button: 1}]
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          """
          <:title>Modal dialog title</:title>
          A simple modal dialog.
          """
        ]
      }
    ]
  end
end
