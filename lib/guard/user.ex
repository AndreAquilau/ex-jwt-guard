defmodule ExJwtGuard.Guard.User do
  @enforce [:id, :user_name, :email, :password]
  defstruct [:id, :user_name, :email, :password, permissions: ["dashboard"]]
end
