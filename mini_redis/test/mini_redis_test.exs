defmodule MiniRedisTest do
  use ExUnit.Case
  doctest MiniRedis

  test "greets the world" do
    assert MiniRedis.hello() == :world
  end
end
