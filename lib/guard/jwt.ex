defmodule ExJwtGuard.Guard.JWT do
  alias ExJwtGuard.Guard.User, as: User
  use Joken.Config

  @config [
    alg: "HS256",
    secret: "<Vq6gFqi7@dNC~XlAvn$C@SHJ*=|$icmzH/em^^8'RgD0^DgG=>8IcqUwE1p%3E"
  ]

  def sign(user \\ %{}) do
    user = %User{
      id: 102,
      user_name: "joao.silva",
      password: "SHA254.salt",
      email: "joao@example.com",
      permissions: ["dashboard", "cadastro"]
    }

    exp = DateTime.utc_now() |> DateTime.add(3600, :second) |> DateTime.to_unix()

    claims =
      %{}
      |> Map.put("exp", exp)
      |> Map.put("sub", user.id)
      |> Map.put("name", user.user_name)
      |> Map.put("email", user.email)
      |> Map.put("permissions", user.permissions)

    claims
    |> Joken.Signer.sign(gen_config_jwt())
    |> case do
      {:ok, jwt} -> jwt
      _error -> nil
    end
  end

  defp gen_config_jwt(), do: Joken.Signer.create(@config[:alg], @config[:secret], %{})
end
