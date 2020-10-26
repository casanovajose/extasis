defmodule Factorial do
  def factorial(n) do
    f(n, 1)
  end
  #base case
  defp f(0, acc), do: acc

  defp f(n, acc), do: f(n - 1, acc * n)
end
