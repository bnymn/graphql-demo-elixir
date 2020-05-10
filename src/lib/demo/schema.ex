defmodule Demo.Schema do
  use Absinthe.Schema

  import_types Absinthe.Type.Custom
  import_types Demo.Schema.Type

  query do
    field :products, list_of(:product) do
      resolve fn (_parent, _args, _resolution) ->
        {:ok, Demo.Db.get()}
      end
    end
  end
end
