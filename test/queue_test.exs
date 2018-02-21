defmodule QueueTest do
  use Mix.Config
  use ExUnit.Case
  doctest SimpleQueue

  setup do
    {:ok, pid} = SimpleQueue.start_link()
    {:ok, pid: pid}
  end

  test "ping", %{pid: pid} do
    assert :pong == SimpleQueue.ping(pid)
  end

  test "add message", %{pid: pid} do
    assert :ok = SimpleQueue.push(pid, "test")
  end

  test "all", %{pid: pid} do
    SimpleQueue.push(pid, "test")
    assert ["test"] = SimpleQueue.all(pid)
  end

  test "pop", %{pid: pid} do
    SimpleQueue.push(pid, "test")
    assert "test" = SimpleQueue.pop(pid)
  end

end
