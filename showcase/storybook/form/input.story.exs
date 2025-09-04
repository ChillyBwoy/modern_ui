defmodule Storybook.Components.Form.Input do
  use PhoenixStorybook.Story, :component

  def function, do: &ModernUI.Components.Input.input/1
  def render_source, do: :function

  def variations do
    form =
      Phoenix.HTML.FormData.to_form(
        %{
          "text" => "John Doe",
          "text_error" => "John Doe",
          "textarea" =>
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          "textarea_error" =>
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          "checkbox" => true,
          "select" => 1
        },
        id: "test_form",
        errors: [
          text_error: {"Oopsie Doopsie", []},
          textarea_error: {"Oopsie Doopsie", []}
        ]
      )

    [
      %Variation{
        id: :text,
        attributes: %{
          field: form[:text]
        }
      },
      %Variation{
        id: :text_counter,
        attributes: %{
          field: form[:text],
          show_counter: true,
          maxlength: 100
        }
      },
      %Variation{
        id: :text_error,
        attributes: %{
          field: form[:text_error]
        }
      },
      %Variation{
        id: :textarea,
        attributes: %{
          type: "textarea",
          field: form[:textarea]
        }
      },
      %Variation{
        id: :textarea_counter,
        attributes: %{
          type: "textarea",
          field: form[:textarea],
          show_counter: true,
          maxlength: 200
        }
      },
      %Variation{
        id: :textarea_error,
        attributes: %{
          type: "textarea",
          field: form[:textarea_error]
        }
      },
      %Variation{
        id: :checkbox,
        attributes: %{
          type: "checkbox",
          field: form[:checkbox]
        }
      },
      %Variation{
        id: :select,
        attributes: %{
          type: "select",
          field: form[:select],
          options: ["First Option": "first", "Second Option": "second", "Third Option": "third"],
          prompt: "-- select an option --"
        }
      }
    ]
  end
end
