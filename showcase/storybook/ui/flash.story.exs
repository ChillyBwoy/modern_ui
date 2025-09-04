defmodule Storybook.Components.UI.Flash do
  use PhoenixStorybook.Story, :component

  def function, do: &ModernUI.Components.Flash.flash/1

  def imports,
    do: [{ModernUI.Components.Button, button: 1}, {ModernUI.Common.ViewHelpers, show: 1}]

  def render_source, do: :function

  def template do
    """
    <div psb-code-hidden>
      <.button phx-click={show("#:variation_id")}>Open flash</.button>
      <.psb-variation />
    </div>
    """
  end

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
