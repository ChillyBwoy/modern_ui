defmodule ModernUI.Common.Error do
  def translate_error({msg, opts}) do
    config_translator = get_translator_from_config()
    config_translator.({msg, opts})
  end

  def translate_errors(errors, field) when is_list(errors) do
    for {^field, {msg, opts}} <- errors, do: translate_error({msg, opts})
  end

  defp get_translator_from_config do
    case Application.get_env(:modern_ui, :error_translator) do
      {module, function} ->
        &apply(module, function, [&1])

      nil ->
        raise """
        The `error_translator` function is not defined:

          config :modern_ui, :error_translator, {MyAppWeb.CoreComponents, :translate_error}

        """
    end
  end
end
