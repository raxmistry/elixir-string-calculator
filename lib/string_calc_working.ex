defmodule StringCalcWorking do
  def add() do
    0
  end

  def add(input) do
    input
    |> split()
    |> convert_strings_to_ints()
    |> raise_error_given_negatives()
    |> filter_out_numbers_greater_than_1001()
    |> add_numbers()
  end

  def split(input) do
    case String.starts_with?(input, "//") do
      true ->
        [head, rest] = input |> String.split(~r[\n])
        delim = head |> String.split(~r[//|\[|\]], trim: true)
        IO.inspect(delim)
        rest |> String.split(delim)

      _ ->
        input
        |> String.split(~r[,|\n])
    end
  end

  def convert_strings_to_ints(split) do
    split
    |> Enum.map(fn x ->
      {int, _} = Integer.parse(x)
      int
    end)
  end

  def add_numbers(numbers) do
    numbers
    |> Enum.reduce(0, fn x, acc -> acc + x end)
  end

  def raise_error_given_negatives(numbers) do
    negatives = numbers |> Enum.filter(fn x -> x < 0 end)

    if Enum.count(negatives) > 0 do
      raise ArgumentError, "Negatives not allowed: " <> Enum.join(negatives, ",")
    end

    numbers
  end

  def filter_out_numbers_greater_than_1001(numbers) do
    numbers |> Enum.filter(fn x -> x <= 1000 end)
  end
end
