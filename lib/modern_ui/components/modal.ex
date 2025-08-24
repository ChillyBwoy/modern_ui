defmodule ModernUI.Components.Modal do
  @moduledoc """
  Modal Dialog
  """

  use ModernUI, :component

  alias Phoenix.LiveView.JS
  alias ModernUI.Components.Icon

  attr :id, :string, required: true
  attr :on_cancel, JS, default: %JS{}
  attr :rest, :global

  attr :size, :string,
    values: ["default", "auto"],
    default: "default"

  slot :inner_block, required: true
  slot :title

  def modal(assigns) do
    ~H"""
    <dialog
      id={@id}
      data-dialog-on-cancel={@on_cancel}
      phx-hook="ModalDialog"
      class="backdrop:backdrop-blur-xs"
      {@rest}
    >
      <div class="fixed inset-0 place-content-center flex items-center justify-center">
        <div
          class={[
            "relative flex flex-col gap-4 p-4 pt-10 bg-white rounded-lg shadow-lg",
            @size == "default" && "min-w-1/2"
          ]}
          phx-click-away={JS.exec("data-dialog-on-cancel", to: "##{@id}")}
        >
          <button
            type="button"
            data-type="ModalDialog.close"
            data-testid="modal-dialog-close"
            class="flex items-center opacity-20 hover:opacity-40 cursor-pointer absolute top-4 right-4"
          >
            <Icon.icon name="mdi-close" />
          </button>

          <h1 :if={@title != []} class="text-xl" data-testid="modal-dailog-title">
            {render_slot(@title)}
          </h1>

          <div data-testid="modal-dialog-content">
            <.focus_wrap id={"#{@id}-container"}>
              {render_slot(@inner_block)}
            </.focus_wrap>
          </div>
        </div>
      </div>
    </dialog>
    """
  end
end
