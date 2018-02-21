defmodule Queue.Repo.Migrations.CreateQueueTables do
  use Ecto.Migration

  def change do
    create table(:queue) do
      add(:message, :string, null: false)
      timestamps
    end

    create table(:queue_reserved) do
      add(:queueId, :integer, null: false)
      add(:pid, :integer, null: false)
      timestamps
    end
  end
end
