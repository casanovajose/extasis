defmodule MarsRover do
  use GenServer
  defstruct [:x, :y, :direction, :name]
  @moduledoc """
  Documentation for `MarsRover`.
  """


  def init({x, y, d, name}) do
    {:ok, %MarsRover{x: x, y: y, direction: d, name: name}}
  end

  @doc """
  Hello world.

  ## Examples

      iex> MarsRover.init({20, 20, :S, "peron"})
      {:ok, %MarsRover{direction: :S, name: "peron", x: 20, y: 20}}

  """
  def start_link({x, y, d, name}) do
    GenServer.start_link(__MODULE__, {x, y, d, name}, name: String.to_atom(name))
  end

  def get_state(name) do
    GenServer.call(String.to_atom(name), :get_state)
  end

  def handle_call(:get_state, _from, state) do
    {:reply, {:ok, {state.x, state.y, state.direction, state.name}}, state}
  end
end
