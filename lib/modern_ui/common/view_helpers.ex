defmodule ModernUI.Common.ViewHelpers do
  alias Phoenix.LiveView.JS

  def show(js \\ %JS{}, selector) do
    JS.remove_class(js, "hidden", to: selector)
  end

  def hide(js \\ %JS{}, selector) do
    JS.add_class(js, "hidden", to: selector)
  end

  def toggle(js \\ %JS{}, selector) do
    JS.toggle_class(js, "hidden", to: selector)
  end
end
