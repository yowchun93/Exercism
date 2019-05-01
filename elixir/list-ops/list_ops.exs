defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(list) do
    count(0, list)
  end

  def count(total, [_head|tail]) do
    count(total + 1, tail)
  end

  def count(total, []) do
    total
  end

  @spec reverse(list) :: list
  def reverse(list) do
    reverse([], list)
  end

  def reverse(result, []) do
    result
  end

  def reverse(result, [head|tail]) do
    reverse([head|result], tail)
  end

  @spec map(list, (any -> any)) :: list
  def map(list, func) do
    map([], list, func)
  end

  def map(result, [] ,func) do
    reverse(result)
  end

  def map(result, [head|tail] ,func) do
    map([func.(head)|result], tail, func)
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(list, func) do
    filter([], list, func)
  end

  def filter(result, [], func) do
    reverse(result)
  end

  def filter(result, [head|tail], func) do
    if func.(head) do
      filter([head | result], tail, func)
    else
      filter(result, tail, func)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce(list, acc, func) do
    reduce(list, acc, func, acc)
  end

  def reduce([], _acc, _func, result) do
    result
  end

  def reduce([head|tail], acc, func, result) do
    reduce(tail, acc, func, func.(head, result))
  end

  @spec append(list, list) :: list
  def append(a, b) do
    reduce(reverse(a), b, &[&1|&2])
  end

  @spec concat([[any]]) :: [any]
  def concat([]), do: []

  def concat([h|t]) do
    append(h, concat(t))
  end
end
