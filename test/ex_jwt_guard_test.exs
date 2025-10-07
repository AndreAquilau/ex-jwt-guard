defmodule ExJwtGuardTest do
  use ExUnit.Case
  doctest ExJwtGuard

  test "greets the world" do
    assert ExJwtGuard.hello() == :world
  end
end
