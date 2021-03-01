defmodule RocketpayWeb.NumbersTest do
  use ExUnit.Case

  describe "sum_from_file/1" do
    test "when exists file with given name, returns sum of numbers" do
      response = RocketpayWeb.Numbers.sum_from_file("numbers")
      assert response == 37
    end

    test "when not exists file with the given name, returns error" do
      response = RocketpayWeb.Numbers.sum_from_file("banana")
      assert response == {:error, %{message: "Invalid File!"}}
    end
  end
end
