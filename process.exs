defmodule HelloProcess do
  def say(name) do
    IO.puts("Hello #{name}")
  end
end

defmodule AsyncMath do
  def start() do
    receive do
      {:sum, [x, y], pid} ->
        send(pid, {:result, x + y})
    end
    start()
  end
end
