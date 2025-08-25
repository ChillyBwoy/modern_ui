defmodule ModernUI do
  def component do
    quote do
      use Phoenix.Component

      alias Phoenix.LiveView.JS
    end
  end

  @doc """
  When used, dispatch to the appropriate macro.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end

  defmacro __using__(_) do
    quote do
      import ModernUI.Components.Button
      import ModernUI.Components.DropdownMenu
      import ModernUI.Components.ErrorMessage
      import ModernUI.Components.Flash
      import ModernUI.Components.FormField
      import ModernUI.Components.Header
      import ModernUI.Components.Icon
      import ModernUI.Components.Input
      import ModernUI.Components.Modal
      import ModernUI.Components.Tabs
    end
  end
end
