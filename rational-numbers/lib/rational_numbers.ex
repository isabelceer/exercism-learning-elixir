defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational

  def add({num_a, den_a}, {num_b, den_b}), do:
    {num_a * den_b + num_b * den_a, den_a * den_b}
    |> reduce()

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({num_a, den_a}, {num_b, den_b}), do:
    {num_a * den_b - num_b * den_a, den_a * den_b}
    |> reduce()

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({num_a, den_a}, {num_b, den_b}), do:
    {num_a * num_b, den_a * den_b}
    |> reduce()

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({num_a, den_a}, {num_b, den_b}) when num_b !== 0, do:
    {num_a * den_b, den_a * num_b}
    |> reduce()


  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({num_a, den_a}), do:
  {Kernel.abs(num_a), Kernel.abs(den_a)}
  |> reduce()

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
def pow_rational({num_a, den_a}, n) when n < 0 do
    {Integer.pow(den_a, Kernel.abs(n)), Integer.pow(num_a, Kernel.abs(n))}
    |> reduce()
end

def pow_rational({num_a, den_a}, n) when n > 0 do
    {Integer.pow(num_a, n), Integer.pow(den_a, n)}
    |> reduce()
end

def pow_rational({num_a, den_a}, n) when n == 0 do
    {Integer.pow(num_a, n), Integer.pow(den_a, n)}
    |> reduce()
end

@doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {num_n, den_n}), do: :math.pow(x, num_n / den_n)

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({0, _}), do: {0, 1}
  def reduce({n, n}), do: {1, 1}
  def reduce({n, d}) when d < 0, do: reduce({-n, -d})
  def reduce(original={n, d}) when d > 0 do
    case Integer.gcd(n,d) do
      1 -> original
      gcd -> {div(n, gcd), div(d, gcd)}
    end
  end
end
