defmodule Queue.App do
  @moduledoc false
  


  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Queue.Repo, [])
    ]

    opts = [strategy: :one_for_one, name: Queue.Supervisor]

    Queue.Supervisor.start_link(children, opts)
  end
end