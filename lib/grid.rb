class Grid

  def initialize(grid)
    @grid = grid
  end

  def tick
    output = []

    @grid.each_with_index do |row, row_in|
      new_row = []
      row.each_with_index do |tic, tic_in|
        n_count = 0
        neighbors = [
          [row_in-1, tic_in], #top
          [row_in+1, tic_in], #bottom
          [row_in, tic_in-1], #left
          [row_in, tic_in+1], #right
          [row_in-1, tic_in-1], #up left
          [row_in-1, tic_in+1], #up right
          [row_in+1, tic_in-1], #bot left
          [row_in+1, tic_in+1] # bot right
        ]

        neighbors.each do |neighbor|
          if is_in?(neighbor, row.length) && @grid[neighbor[0]][neighbor[1]] == 1
            n_count += 1

          end
        end

        if n_count < 2 && is_alive?(tic)
          new_row << 0
        elsif (n_count == 2 || n_count == 3) && is_alive?(tic)
          new_row << 1
        elsif n_count > 3 && is_alive?(tic)
          new_row << 0
        elsif n_count == 3 && tic == 0
          new_row << 1
        else
          new_row << tic
        end
      end
      output << new_row
    end
    output
  end

  private

  def is_alive?(tic)
    tic == 1
  end

  def is_in?(coord, row_length)
    coord[0] < @grid.length && coord[1] < row_length && coord[0] >= 0 && coord[1] >= 0
  end
end