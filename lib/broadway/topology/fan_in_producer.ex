defmodule Broadway.Topology.FanInProducer do
  @behaviour Broadway.Producer
  use GenStage

  @impl true
  def init(_args) do
    {:producer, %{}}
  end

  @impl true
  def handle_demand(_incoming_demand, state) do
    {:noreply, [], state}
  end

  @impl true
  def handle_call({:push_messages, messages}, _from, state) do
    {:reply, :reply, messages, state}
  end

  def process_name(broadway_name, base_name) do
    :"#{broadway_name}.Broadway.FanIn#{base_name}"
  end
end
