defmodule SimpleQueue do
  use GenServer

  import Ecto.Query
  alias Queue.Queue
  alias Queue.Repo


  @moduledoc """
  Documentation for Queue.
  """

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(state), do: {:ok, state}

  def ping(server_pid) do
    GenServer.call(server_pid, {:ping, "ping"})
  end

  def all(server_pid), do: GenServer.call(server_pid, :all)

  def push(server_pid, message) do
    GenServer.cast(server_pid, {:push, message})
  end

  def pop(server_pid) do
    GenServer.call(server_pid, :pop)
  end


  def handle_call({:ping, message}, _, state) do
    if message == "ping" do
        {:reply, :pong, state}
      else
        {:error, "not ping"}
    end
  end

  def handle_cast({:push, value}, state) do
    {:noreply, state ++ [value]}
  end

  def handle_call(:all, _from, state), do: {:reply, state, state}

  def handle_call(:pop, _from, [value | state]) do
    {:reply, value, state}
  end

  def handle_call(:pop, _from, []), do: {:reply, nil, []}

end
