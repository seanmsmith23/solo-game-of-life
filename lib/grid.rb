class Grid
  def initialize(board)
    @board = board
  end

  def tick
    height = @board.size - 1
    width = @board[0].size - 1
    new_board = generate_board(height+1, width+1)

    @board.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        alive = 0
        alive += 1 if x < width &&                @board[y][x+1] == 1
        alive += 1 if x > 0 &&                    @board[y][x-1] == 1
        alive += 1 if y > 0 &&                    @board[y-1][x] == 1
        alive += 1 if y < height &&               @board[y+1][x] == 1
        alive += 1 if y < height && x < width &&  @board[y+1][x+1] == 1
        alive += 1 if y > 0 && x < width &&       @board[y-1][x+1] == 1
        alive += 1 if  y > 0 && x > 0 &&          @board[y-1][x-1] == 1
        alive += 1 if y < height && x > 0 &&      @board[y+1][x-1] == 1
        
        new_board[y][x] = live_or_die(alive, @board[y][x])
      end
    end
    new_board
  end

  def live_or_die(live_neighbors, current_cell)
    if current_cell == 1 && live_neighbors == 2 || live_neighbors == 3 then 1
    elsif live_neighbors < 2 then 0
    elsif live_neighbors > 3 then 0
    elsif current_cell == 0 && live_neighbors == 3 then 1
    else 0
    end
  end

  def generate_board(height, width)
    array = []
    (height).times{ array << Array.new(width) }
    array
  end

end

