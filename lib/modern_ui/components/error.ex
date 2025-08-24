defmodule ModernUI.Components.Error do
  @moduledoc """
  Error
  """
  use ModernUI, :component

  alias ModernUI.Components.Icon

  @doc """
  Translates an error message using gettext.
  """
  def translate_error({msg, opts}) do
    # When using gettext, we typically pass the strings we want
    # to translate as a static argument:
    #
    #     # Translate the number of files with plural rules
    #     dngettext("errors", "1 file", "%{count} files", count)
    #
    # However the error messages in our forms and APIs are generated
    # dynamically, so we need to translate them by calling Gettext
    # with our gettext backend as first argument. Translations are
    # available in the errors.po file (as we use the "errors" domain).
    if count = opts[:count] do
      Gettext.dngettext(ModernUI.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(ModernUI.Gettext, "errors", msg, opts)
    end
  end

  @doc """
  Translates the errors for a field from a keyword list of errors.
  """
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
