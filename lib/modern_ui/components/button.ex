defmodule ModernUI.Components.Button do
  @moduledoc """
  Button
  """
  use ModernUI, :component

  attr :type, :string, default: nil
  attr :size, :string, values: ~w(small medium large), default: "medium"

  attr :variant, :string,
    values: ~w(none primary secondary success danger warning info),
    default: "primary"

  attr :class, :string, default: nil
  attr :rest, :global, include: ~w(disabled form name value)

  slot :inner_block

  def button(assigns) do
    ~H"""
    <button
      type={@type}
      class={[
        "flex items-center justify-center gap-1 focus-visible:outline-2 focus-visible:outline-offset-2",
        "rounded-md font-semibold shadow-xs",
        "cursor-pointer disabled:cursor-not-allowed",
        @size == "small" && "px-2.5 py-1.5 text-xs",
        @size == "medium" && "px-3 py-2 text-sm",
        @size == "large" && "px-3.5 py-2.5 text-sm",
        @variant == "none" && "bg-form-background border",
        @variant === "primary" &&
          "border-primary-dark bg-primary hover:bg-primary-dark focus-visible:bg-primary disabled:border-primary-dark/20 disabled:bg-primary-light/70 border fill-white text-white",
        @variant === "secondary" &&
          "border-secondary-dark bg-secondary hover:bg-secondary-dark focus-visible:bg-secondary disabled:border-secondary-dark/20 disabled:bg-secondary-light/70 border fill-white text-white",
        @variant === "success" &&
          "border-success-dark bg-success hover:bg-success-dark focus-visible:bg-success disabled:border-success-dark/20 disabled:bg-success-light/70 border fill-white text-white",
        @variant === "warning" &&
          "border-warning-dark bg-warning hover:bg-warning-dark focus-visible:bg-warning disabled:border-warning-dark/20 disabled:bg-warning-light/70 border fill-white text-white",
        @variant === "danger" &&
          "border-danger-dark bg-danger hover:bg-danger-dark focus-visible:bg-danger disabled:border-danger-dark/20 disabled:bg-danger-light/70 border fill-white text-white",
        @variant === "info" &&
          "border-info-dark bg-info hover:bg-info-dark focus-visible:bg-info disabled:border-info-dark/20 disabled:bg-info-light/70 border fill-white text-white",
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  attr :provider, :string, values: ~w(github google), required: true
  attr :rest, :global, include: ~w(disabled form name value)

  slot :inner_block

  def social_button(assigns) do
    ~H"""
    <.button
      type="button"
      class="w-full flex gap-2"
      variant="none"
      {@rest}
    >
      <span
        style={~c"background-image: url(/modern_ui_static/images/#{@provider}.svg)"}
        class="size-5 bg-cover"
      />
      <span>{render_slot(@inner_block)}</span>
    </.button>
    """
  end
end
