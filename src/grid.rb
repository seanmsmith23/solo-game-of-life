class Grid

  def initialize(grid)
    @grid = grid
  end

  def number_of_live_neighbors(row_index, column_index)
    @grid[row_index-1][column_index - 1].to_i +
      @grid[row_index-1][column_index].to_i +
      @grid[row_index-1][column_index + 1].to_i +
      @grid[row_index][column_index - 1].to_i +
      @grid[row_index][column_index + 1].to_i +
      @grid[row_index - 1][column_index - 1].to_i +
      @grid[row_index - 1][column_index].to_i +
      @grid[row_index - 1][column_index + 1].to_i
  end

  def tick
    new_grid = []
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|

        number_of_live_neighbors(row_index, column_index)

        if cell == 0

          if number_of_live_neighbors(row_index, column_index) == 3
            new_grid[row_index, column_index] = 1
          else
            new_grid[row_index, column_index] = 0
          end

        elsif cell == 1

          if number_of_live_neighbors(row_index, column_index) < 2
            new_grid[row_index, column_index] = 0
          elsif number_of_live_neighbors(row_index, column_index) > 3
            new_grid[row_index, column_index] = 0
          else
            new_grid[row_index, column_index] = 1
          end
        end
      end
    end
    new_grid
  end
end

cell = [
  [0, 0, 0, 0],
  [0, 1, 1, 0],
  [0, 1, 1, 0],
  [0, 0, 0, 0]
]

new_grid = Grid.new(cell)
new_grid.tick