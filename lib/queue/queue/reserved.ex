defmodule Queue.Reserved do
  use Ecto.Schema

  schema "queue_reserved" do
    field(:queueId, :integer)
    field(:pid, :integer)
  end
end
