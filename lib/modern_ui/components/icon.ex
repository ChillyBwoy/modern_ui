defmodule ModernUI.Components.Icon do
  @moduledoc """
  Icon
  """
  use ModernUI, :component

  attr :name, :string, required: true
  attr :size, :string, values: ~w(xs sm md lg), default: "md"
  attr :class, :string, default: nil
  attr :rest, :global

  def icon(%{name: "mdi-" <> _} = assigns) do
    ~H"""
    <span
      class={[
        "inline-flex items-center justify-center",
        @name,
        @size == "xs" && "text-[1rem] size-3",
        @size == "sm" && "text-[1.25rem] size-4",
        @size == "md" && "text-[1.5rem] size-5",
        @size == "lg" && "text-[2rem] size-6",
        @class
      ]}
      {@rest}
    />
    """
  end
end
