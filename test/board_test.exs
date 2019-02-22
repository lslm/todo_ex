defmodule BoardTest do
  use ExUnit.Case

  describe "new/2" do
    test "creates a new board with empty items" do
      board = Board.new("new board")

      assert %Board{name: "new board", items: []} = board
    end

    test "creates a new board with items" do
      item = Item.new("new item")
      created_board = Board.new("new board", [item])

      expected_board = %Board{
        name: "new board",
        items: [item]
      }

      assert expected_board == created_board
    end
  end
end