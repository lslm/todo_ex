defmodule Board do
  defstruct name: nil, items: []

  def new(name, items \\ []) do
    %Board{name: name, items: items}
  end

  def add_item_to_board(%{name: name, items: items}, new_item) do
    new(name, [new_item | items])
  end

  def remove_item_from_board(%{name: name, items: items}, item_to_remove) do
    new(name, Enum.reject(items, fn item -> item == item_to_remove end))
  end

  def mark_item_as_done(board, undone_item) do
    board
    |> remove_item_from_board(undone_item)
    |> add_item_to_board(Item.done(undone_item))
  end

  def mark_item_as_undone(board, done_item) do
    board
    |> remove_item_from_board(done_item)
    |> add_item_to_board(Item.undone(done_item))
  end
end
