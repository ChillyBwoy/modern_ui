defmodule ModernUITest do
  use ExUnit.Case
  doctest ModernUI

  test "greets the world" do
    assert ModernUI.hello() == :world
  end
end
