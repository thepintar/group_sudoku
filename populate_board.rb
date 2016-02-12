
def populate_board(array)
board={}
row = 0
column = 0

  while row < 9
    while column < 9
      puts "i: #{i}"
      puts "x: #{x}"
      board[[column,row]] = [possibilities(array, column, row), solution(array, column, row)]
      column+=1
    end
    column=0
    row+=1
  end
end

def possibilities (array, column, row)
  if array[column][row] == "-"
    return []
  else
    return ["1","2","3","4","5","6","7","8","9"]
  end
endx

def solution (array, column, row)
  if array[column][row] == "-"
    return []
  else
    return [array[column][row]]
  end
end
