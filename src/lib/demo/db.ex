defmodule Demo.Db do
  use GenServer

  @me __MODULE__

  # External API
  def start_link(_) do
    GenServer.start_link __MODULE__, [], name: @me
  end

  def get() do
    GenServer.call @me, {:get}
  end

  # GenServer implementation
  def init(_) do
    {:ok, get_products(10000, 4)}
  end

  def handle_call({:get}, _from, state) do
    {:reply, state, state}
  end

  # Generate data
  defp get_products(product_count, related_count \\ 0)

  defp get_products(product_count, related_count) do
    1..product_count
    |> Enum.map(fn (_) ->
      get_product(related_count)
    end)
  end

  defp get_product(related_count \\ 0)

  defp get_product(0) do
    %{
      id: :rand.uniform(5_000_000),
      name: :rand.uniform(5_000_000),
      price: :rand.uniform(5_000_000),
      sku: :rand.uniform(5_000_000)
    }
  end

  defp get_product(related_count) do
    get_product()
      |> Map.put(:related_products, get_products(related_count))
  end
end
