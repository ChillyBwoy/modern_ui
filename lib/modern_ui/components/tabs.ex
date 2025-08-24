defmodule ModernUI.Components.Tabs do
  @moduledoc """
  Tabs
  """
  use ModernUI, :component

  attr :id, :string, required: true
  attr :selected, :string, required: true
  attr :on_select, :any, default: nil

  slot :tab, required: true do
    attr :name, :string, required: true
    attr :title, :string, required: true
  end

  def tabs(assigns) do
    ~H"""
    <div class="relative h-full grid grid-rows-[auto_1fr] w-full">
      <ul
        id={@id}
        class="no-scrollbar scroll-container-h flex w-full flex-nowrap"
        phx-hook="SmoothScroll"
      >
        <li
          :for={tab <- @tab}
          class={[
            "px-4 py-2 grow h-full flex items-center whitespace-nowrap border-b-2",
            tab.name == @selected && "border-primary text-primary",
            tab.name != @selected && "cursor-pointer border-secondary-light text-secondary"
          ]}
          data-active={tab.name == @selected}
          phx-click={@on_select && @on_select.(tab.name)}
        >
          {tab.title}
        </li>
      </ul>
      <div
        :for={tab <- @tab}
        class={[
          "relative h-full",
          tab.name != @selected && "hidden"
        ]}
      >
        {render_slot(tab)}
      </div>
    </div>
    """
  end
end
