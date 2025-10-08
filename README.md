Claro! Aqui está um exemplo de `README.md` que documenta o módulo `ExJwtGuard.Guard.JWT` e garante que ele seja compreendido e testável:

---

# ExJwtGuard

🔐 Biblioteca simples para geração e verificação de tokens JWT usando [Joken](https://hexdocs.pm/joken/Joken.html).

## 📦 Instalação

Adicione `:joken` ao seu `mix.exs`:

```elixir
def deps do
  [
    {:joken, "~> 2.0"}
  ]
end
```

Em seguida, rode:

```bash
mix deps.get
```

## 🛡️ Módulo: `ExJwtGuard.Guard.JWT`

Este módulo é responsável por gerar e verificar tokens JWT com base em um usuário fictício.

### 🔧 Configuração

O algoritmo utilizado é `HS256` com uma chave secreta definida em `@config`.

```elixir
@config [
  alg: "HS256",
  secret: "<Vq6gFqi7@dNC~XlAvn$C@SHJ*=|$icmzH/em^^8'RgD0^DgG=>8IcqUwE1p%3E"
]
```

> ⚠️ **Importante:** Nunca exponha segredos em produção. Use variáveis de ambiente.

---

## 🚀 Funções

### `generate_token(user \\ %{})`

Gera um token JWT com base em um usuário fictício:

```elixir
%User{
  id: 102,
  user_name: "joao.silva",
  password: "SHA254.salt",
  email: "joao@example.com",
  permissions: ["dashboard", "cadastro"]
}
```

O token expira em 1 hora.

#### Exemplo de uso:

```elixir
token = ExJwtGuard.Guard.JWT.generate_token()
IO.puts(token)
```

---

### `verify_token(jwt)`

Verifica a validade de um token JWT.

#### Exemplo de uso:

```elixir
claims = ExJwtGuard.Guard.JWT.verify_token(token)

case claims do
  %{error: _} -> IO.puts("Token inválido")
  _ -> IO.inspect(claims)
end
```

---

A saída esperada deve conter os campos:

- `exp`
- `sub`
- `name`
- `email`
- `permissions`

---

## 📁 Estrutura recomendada

```
lib/
├── ex_jwt_guard/
│   └── guard/
│       ├── jwt.ex
│       └── user.ex
```

---

## 👤 Módulo `User`

Certifique-se de que o módulo `ExJwtGuard.Guard.User` esteja definido com os campos esperados:

```elixir
defmodule ExJwtGuard.Guard.User do
  defstruct [:id, :user_name, :password, :email, :permissions]
end
```

---

## 📜 Licença

Este projeto está sob a licença MIT.

---