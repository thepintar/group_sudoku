#PSEUDOCODE SOLVER
=begin

INIT array 'board' with 81 empty grids (bx = 9, by = 9)
  POPULATE with given values (sudoku puzzle)
  COPY 'board' to 'active_board'
  ITERATE over 'active_board' SEARCHING for EMPTY cells,
    IF cell is EMPTY
      ASSIGN cell with a value 'i' (1..9)
      IF no CONFLICT with existing row values, col values, and box values
        FILL cell with value 'i' (1..9)
      ELSE IF CONFLICT exists
        REPICK value 'i' (1..9)
    ELSE
      WHILE bx < 9, proceed to next row ADD one to bx
      IF bx is EQUAL TO 9, RESET bx to 1, ADD one to by, proceed to next col
      IF by is EQUAL TO 9, PUZZLE is SOLVED
      ELSE
      PUZZLE is NOT SOLVABLE
=end

string = '1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--'

def init(string)
  board_array = []
  if string.kind_of? String
    string.split('').each_slice(9) do |row|
      board_array << row
    end
  end
  board_array
end

def check_row(row, string)
  board = string
  board = board[(9*row)...(9 * row + 9)].split('').reject { |i| i == '-' }
end

def check_col(col, string)
  board = string
  board_array = []
    (0...9).map do |row|
      board_array << board[col + 9 * row]
    end
  board_array.reject { |i| i == '-' }
end

def check_box(row, col, string)
  board = string
  box = []

  b_row, b_col = (row / 3) * 3, (col / 3) * 3

  (b_row...(b_row + 3)).each do |r|
    (b_col...(b_col + 3)).each do |c|
      box << board[c + 9 * r]
    end
  end

  box.reject { |i| i == '-' }
end

def possibilities(row, col, string)
  answers = ['1','2','3','4','5','6','7','8','9']

  row_arr = check_row(row, string)
  col_arr = check_col(col, string)
  box_arr = check_box(row, col, string)
  possibilities = answers - (row_arr + col_arr + box_arr).uniq

end

# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
def solve(string)
  board_array = init(string)
  empty_spaces = board_array.flatten.count('-')

  until empty_spaces == 30

    bx = 0
    while bx < 9
      by = 0
      while by < 9
        if board_array[bx][by] == '-' && possibilities(bx,by,string).length == 1
          board_array[bx][by] = possibilities(bx,by,string).join('').to_s
          empty_spaces -= 1
        end
        by += 1

        if board_array[bx][by] == '-'
          puts "Empty spaces left: #{empty_spaces}"
          puts '============================='
          # puts possibilities(bx,by,string) if board_array[bx][by] == '-'
          pretty_board(board_array)
          puts '============================='
          p "x: #{bx} ----- y: #{by}"
          p "VALUE"
          p board_array[bx][by]
          p "POSSIBILITIES"
          p possibilities(bx,by,string)
        end
      end
      bx += 1
    end

  end

end

# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(board)
  return true if solved
end

# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.
def pretty_board(board)
  board.each do |row|
    p row
  end
end

#DRIVER CODE
# p check_row(0, string)
# p check_col(0, string)
# p pretty_board(string)
# p possibilities(4,3,string)
# p check_box(4, 3, string)
solve(string)
# p init(string).flatten.include?('-')
# new_array = []
# board_array = string.split('').each_slice(9) do |row|
#   new_array << row
# end
# p new_array.incluyde
# p possibilities(4,3,string).join('').to_s
