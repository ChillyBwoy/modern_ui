defmodule Storybook.Components.UI.DropdownMenu do
  use PhoenixStorybook.Story, :component

  def function, do: &ModernUI.Components.DropdownMenu.dropdown_menu/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        slots: [
          """
          <:item variant="secondary" icon="mdi-file-document-multiple-outline">
            Item 1
          </:item>
          """,
          """
          <:item variant="danger" icon="mdi-delete-outline">
            Iten 2
          </:item>
          """
        ]
      }
    ]
  end
end
