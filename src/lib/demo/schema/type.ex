defmodule Demo.Schema.Type do
  use Absinthe.Schema.Notation

  object :product do
    field :id, :integer
    field :name, :string
    field :price, :integer
    field :sku, :string
    field :related_products, list_of(:product)
  end
end
