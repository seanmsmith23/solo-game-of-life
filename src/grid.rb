class Grid

  def initialize(grid)
    @grid = grid
  end

  def tick
    new_grid = []
    @grid.each_with_index do |row, row_index|
      row.each_with_index do |cell, column_index|
        if cell == 0
          new_grid[row_index, column_index] = 0
        elsif cell == 1
          number_of_live_neighbors =
          @grid[row_index-1][column_index - 1] +
            @grid[row_index-1][column_index] +
            @grid[row_index-1][column_index + 1] +
            @grid[row_index][column_index - 1] +
            @grid[row_index][column_index + 1] +
            @grid[row_index - 1][column_index - 1] +
            @grid[row_index - 1][column_index] +
            @grid[row_index - 1][column_index + 1]

          if number_of_live_neighbors < 2
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