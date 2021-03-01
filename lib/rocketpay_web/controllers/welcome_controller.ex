defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  def index(conn, %{"filename" => filename}) do
    filename
    |> RocketpayWeb.Numbers.sum_from_file()
    |> handle_response(conn)
  end


  defp handle_response({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(reason)
  end

  defp handle_response(result, conn) when is_integer(result) do
    conn
    |> put_status(:ok)
    |> json(%{message: "Welcome to RocketPay API. Here is your number #{result}"})
  end
end
