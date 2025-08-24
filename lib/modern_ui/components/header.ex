defmodule ModernUI.Components.Header do
  @moduledoc """
  Renders a header with title.
  """
  use ModernUI, :component

  attr :class, :string, default: nil

  slot :inner_block, required: true
  slot :subtitle
  slot :actions

  def header(assigns) do
    ~H"""
    <header class={[@actions != [] && "flex items-center justify-between gap-6", @class]}>
      <div>
        <h1 class="text-lg">
          {render_slot(@inner_block)}
        </h1>
        <p :if={@subtitle != []} class="text-sm">
          {render_slot(@subtitle)}
        </p>
      </div>
      <div>{render_slot(@actions)}</div>
    </header>
    """
  end
end
