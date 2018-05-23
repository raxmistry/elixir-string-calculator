defmodule StringCalc do
  def add("") do
    0
  end

  def add(input) do
    input
    |> split()
    |> map()
    |> raise_error_if_negatives()
    |> remove_numbers_greater_than_1000()
    |> reduce()
  end

  def split(input) do
    cond do
      String.starts_with?(input, "//") ->
        [head, rest] = input |> String.split(~r{\n})
        delim = head |> String.split(~r{//|\[|\]}, trim: true)
        rest |> String.split(delim)

      true ->
        input
        |> String.split(~r{,|\n})
    end
  end

  def map(split) do
    split
    |> Enum.map(fn x ->
      {int, _} = Integer.parse(x)
      int
    end)
  end

  def reduce(numbers) do
    numbers
    |> Enum.reduce(0, fn x, acc -> acc + x end)
  end

  def raise_error_if_negatives(numbers) do
    negatives = numbers |> Enum.filter(fn x -> x < 0 end)

    if Enum.empty?(negatives) do
      numbers
    else
      raise(ArgumentError, "negatives not allowed: " <> (negatives |> Enum.join(",")))
    end
  end

  def remove_numbers_greater_than_1000(numbers) do
    numbers |> Enum.filter(fn x -> x <= 1000 end)
  end
end
