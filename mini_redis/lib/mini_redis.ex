defmodule MiniRedis do
  @moduledoc """
  Documentation for `MiniRedis`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> MiniRedis.hello()
      :world

  """
  use GenServer

  def init(_) do
    {:ok, %{}}
  end

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [], opts)
  end

  def set(pid, key, value) do
    GenServer.call(pid, {:set, key, value})
  end

  def get(pid, key) do
    GenServer.call(pid, {:get, key})
  end

  def handle_call({:set, key, value}, _from, state) do
    {:reply, :ok, Map.merge(state, %{key => value})}
  end

  def handle_call({:get, key}, _from, state) do
    {:reply, Map.fetch(state, key), state}
  end

  def hello do
    :world
  end
end
