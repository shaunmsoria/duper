defmodule Duper.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Duper.Results,
      { Duper.PathFinder, "/home/shaun/volume/Course/elixir/project/duper/" },
      Duper.WorkerSupervisor,
      { Duper.Gatherer, 2 },
    ]

    opts = [strategy: :one_for_all, name: Duper.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
