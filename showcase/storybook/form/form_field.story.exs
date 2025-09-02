defmodule Storybook.Components.Form.FormField do
  use PhoenixStorybook.Story, :component

  def function, do: &ModernUI.Components.FormField.form_field/1
  def imports, do: [{ModernUI.Components.Input, input: 1}]
  def render_source, do: :function

  def variations do
    form =
      Phoenix.HTML.FormData.to_form(%{"name" => "John Doe", "invalid_field" => "Invalid data"},
        id: "test_form",
        errors: [
          invalid_field: {"Oopsie Doopsie", []},
          invalid_field: {"Another error", []}
        ]
      )

    [
      %Variation{
        id: :default,
        attributes: %{
          field: form[:name]
        },
        slots: [
          """
          <:label>Name</:label>
          <:content :let={field}>
            <.input field={field} />
          </:content>
          """
        ]
      },
      %Variation{
        id: :error,
        attributes: %{
          field: form[:invalid_field]
        },
        slots: [
          """
          <:label>Name</:label>
          <:content :let={field}>
            <.input field={field} />
          </:content>
          """
        ]
      }
    ]
  end
end
