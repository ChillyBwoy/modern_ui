defmodule ModernUI.Components.Error do
  @moduledoc """
  Error
  """
  use ModernUI, :component

  alias ModernUI.Components.Icon

  def translate_error({msg, _opts}) do
    msg
  end

  def translate_errors(errors, field) when is_list(errors) do
    for {^field, {msg, opts}} <- errors, do: translate_error({msg, opts})
  end

  attr :rest, :global

  slot :inner_block, required: true

  # Helper used by inputs to generate form errors
  def error(assigns) do
    ~H"""
    <p
      class={[
        "flex gap-1 items-center text-sm text-danger",
        @rest[:class]
      ]}
      {@rest}
    >
      <Icon.icon name="mdi-exclamation-thick" size="sm" />
      {render_slot(@inner_block)}
    </p>
    """
  end
end
