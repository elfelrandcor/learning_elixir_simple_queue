defmodule Queue.Queue do
  use Ecto.Schema

  schema "queue" do
    field(:message, :string)
  end
end
