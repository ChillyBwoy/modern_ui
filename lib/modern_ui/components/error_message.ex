defmodule ModernUI.Components.ErrorMessage do
  @moduledoc """
  Error
  """
  use ModernUI, :component

  alias ModernUI.Components.Icon

  attr :rest, :global

  slot :inner_block, required: true

  # Helper used by inputs to generate form errors
  def error_message(assigns) do
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
