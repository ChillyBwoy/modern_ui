defmodule Storybook.Components.UI.Tabs do
  use PhoenixStorybook.Story, :component

  def function, do: &ModernUI.Components.Tabs.tabs/1
  def render_source, do: :function

  def variations do
    [
      %Variation{
        id: :default,
        attributes: %{
          selected: "two"
        },
        slots: [
          ~s|<:tab name="one" title="One">Content 1</:tab>|,
          ~s|<:tab name="two" title="Two">Content 2</:tab>|,
          ~s|<:tab name="three" title="Three">Content 3</:tab>|,
          ~s|<:tab name="four" title="Four">Content 4</:tab>|,
          ~s|<:tab name="five" title="Five">Content 5</:tab>|
        ]
      }
    ]
  end
end
