defmodule Storybook.Components.Base.Icon do
  use PhoenixStorybook.Story, :component

  def function, do: &ModernUI.Components.Icon.icon/1
  def render_source, do: :function

  def template do
    """
    <a href="https://pictogrammers.com/library/mdi/" class="underline">https://pictogrammers.com/library/mdi/</a>
    <.psb-variation-group />
    """
  end

  def variations do
    icons = ~w(mdi-palette mdi-airplane mdi-alert mdi-apps mdi-battery-50 mdi-border-color)a

    [
      %VariationGroup{
        id: :default,
        variations:
          for icon <- icons do
            %Variation{
              id: icon,
              attributes: %{
                name: "#{icon}"
              }
            }
          end
      }
    ]
  end
end
