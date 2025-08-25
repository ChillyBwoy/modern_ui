defmodule ModernUI.Components.Flash do
  @moduledoc """
  Flash
  """
  use ModernUI, :component

  alias Phoenix.LiveView.JS

  alias ModernUI.Components.Icon
  alias ModernUI.Common.ViewHelpers

  attr :id, :string, doc: "the optional id of flash container"
  attr :flash, :map, default: %{}, doc: "the map of flash messages to display"
  attr :title, :string, default: nil
  attr :kind, :atom, values: [:info, :error], doc: "used for styling and flash lookup"
  attr :rest, :global, doc: "the arbitrary HTML attributes to add to the flash container"

  slot :inner_block, doc: "the optional inner block that renders the flash message"

  def flash(assigns) do
    assigns = assign_new(assigns, :id, fn -> "flash-#{assigns.kind}" end)

    ~H"""
    <div
      :if={msg = render_slot(@inner_block) || Phoenix.Flash.get(@flash, @kind)}
      id={@id}
      role="alert"
      class={[
        "fixed top-4 right-4 text-wrap w-80 sm:w-96 max-w-80 sm:max-w-96 z-50 rounded-lg p-3 ring-1 grid grid-cols-[1fr_auto] gap-1 group",
        @kind == :info && "bg-info-light text-info-dark ring-info",
        @kind == :error && "bg-danger-light text-danger-dark ring-danger"
      ]}
      {@rest}
    >
      <div class="flex flex-col gap-2">
        <p :if={@title} class="font-semibold">{@title}</p>
        <p>{msg}</p>
      </div>

      <div class="flex items-center justify-center">
        <Icon.icon name="mdi-information" size="lg" />
      </div>
      <button
        type="button"
        class={[
          "cursor-pointer absolute -top-2 -left-2 size-6 flex items-center justify-center rounded-full ring-1 shadow invisible group-hover:visible",
          @kind == :info && "bg-info-light text-info-dark ring-info",
          @kind == :error && "bg-danger-light text-danger-dark ring-danger"
        ]}
        phx-click={JS.push("lv:clear-flash", value: %{key: @kind}) |> ViewHelpers.hide("##{@id}")}
      >
        <Icon.icon name="mdi-close" size="sm" />
      </button>
    </div>
    """
  end
end
