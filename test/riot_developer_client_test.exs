defmodule RiotDeveloperClientTest do
  use ExUnit.Case, async: true

  import Tesla.Mock

  describe "get_account_data_by_name_and_tag_name/2" do
    test "when found an account data" do
      mock(fn %{method: :get} ->
        %Tesla.Env{
          status: 200,
          body: %{
            puuid: "PUUID",
            gameName: "FELIPE",
            tagLine: "BR1"
          }
        }
      end)

      assert {:ok, response} =
               RiotDeveloperClient.get_account_data_by_name_and_tag_name("FELIPE", "BR1")

      assert "PUUID" == response.puuid
      assert "FELIPE" == response.name
      assert "BR1" == response.tag_name
    end

    test "account data not found" do
      mock(fn %{method: :get} ->
        %Tesla.Env{
          status: 404,
          body: %{status: %{message: "Data not found", status_code: 404}}
        }
      end)

      assert {:error, response} =
               RiotDeveloperClient.get_account_data_by_name_and_tag_name("FELIPE", "BR1")

      assert "Not Found" == response
    end

    test "forbidden request" do
      mock(fn %{method: :get} ->
        %Tesla.Env{
          status: 403,
          body: %{status: %{message: "Forbidden", status_code: 403}}
        }
      end)

      assert {:error, response} =
               RiotDeveloperClient.get_account_data_by_name_and_tag_name("FELIPE", "BR1")

      assert "Forbidden" == response
    end

    test "unauthorized request" do
      mock(fn %{method: :get} ->
        %Tesla.Env{
          status: 401,
          body: %{status: %{message: "Unauthorized", status_code: 401}}
        }
      end)

      assert {:error, response} =
               RiotDeveloperClient.get_account_data_by_name_and_tag_name("FELIPE", "BR1")

      assert "Unauthorized" == response
    end

    test "when the rate limit exceeded" do
      mock(fn %{method: :get} ->
        %Tesla.Env{
          status: 429,
          body: %{status: %{message: "Rate limit exceeded", status_code: 429}}
        }
      end)

      assert {:error, response} =
               RiotDeveloperClient.get_account_data_by_name_and_tag_name("FELIPE", "BR1")

      assert "Rate Limit Exceeded" == response
    end

    test "an internal server error happened" do
      mock(fn %{method: :get} ->
        %Tesla.Env{
          status: 500,
          body: %{status: %{message: "Internal server error", status_code: 500}}
        }
      end)

      assert {:error, response} =
               RiotDeveloperClient.get_account_data_by_name_and_tag_name("FELIPE", "BR1")

      assert "Internal Server Error" == response
    end
  end

  describe "get_account_data_by_puuid/1" do
    test "found an account data" do
      mock(fn %{method: :get} ->
        %Tesla.Env{
          status: 200,
          body: %{
            puuid: "PUUID",
            gameName: "FELIPE",
            tagLine: "BR1"
          }
        }
      end)

      assert {:ok, response} =
               RiotDeveloperClient.get_account_data_by_puuid("PUUID")

      assert "PUUID" == response.puuid
      assert "FELIPE" == response.name
      assert "BR1" == response.tag_name
    end

    test "not found account" do
      mock(fn %{method: :get} ->
        %Tesla.Env{
          status: 404,
          body: %{status: %{message: "Data not found", status_code: 404}}
        }
      end)

      assert {:error, response} =
               RiotDeveloperClient.get_account_data_by_puuid("PUUID")

      assert "Not Found" == response
    end

    test "forbidden request" do
      mock(fn %{method: :get} ->
        %Tesla.Env{
          status: 403,
          body: %{status: %{message: "Forbidden", status_code: 403}}
        }
      end)

      assert {:error, response} =
               RiotDeveloperClient.get_account_data_by_puuid("PUUID")

      assert "Forbidden" == response
    end

    test "unauthorized request" do
      mock(fn %{method: :get} ->
        %Tesla.Env{
          status: 401,
          body: %{status: %{message: "Unauthorized", status_code: 401}}
        }
      end)

      assert {:error, response} =
               RiotDeveloperClient.get_account_data_by_puuid("PUUID")

      assert "Unauthorized" == response
    end

    test "exceeded rate limit" do
      mock(fn %{method: :get} ->
        %Tesla.Env{
          status: 429,
          body: %{status: %{message: "Rate limit exceeded", status_code: 429}}
        }
      end)

      assert {:error, response} =
               RiotDeveloperClient.get_account_data_by_puuid("PUUID")

      assert "Rate Limit Exceeded" == response
    end

    test "internal server error" do
      mock(fn %{method: :get} ->
        %Tesla.Env{
          status: 500,
          body: %{status: %{message: "Internal server error", status_code: 500}}
        }
      end)

      assert {:error, response} =
               RiotDeveloperClient.get_account_data_by_puuid("PUUID")

      assert "Internal Server Error" == response
    end
  end
end
