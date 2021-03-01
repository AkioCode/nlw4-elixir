defmodule RocketpayWeb.Numbers do
  alias RocketpayWeb.Numbers, as: Numbers
  def sum_from_file (filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  defp handle_file({:ok, file}) do
    result =
    file
    |> String.split(",")
    |> Enum.map(fn e -> e |> String.to_integer() end)
    |> Enum.reduce(0, fn x, acc -> x+acc end)

    result
  end
  defp handle_file({:error, _error_description}), do: {:error, %{message: "Invalid File!"}}

end
