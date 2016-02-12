=begin

DEFINE method ingest_puzzle, takes one argument (string)
  SPLIT string
    CREATE 27 arrays
=end

string = '1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--'

def ingest_puzzle(string)
  init_array = string.split('')
  items = 0
  final_array = Array.new(27) { Array.new(3) }
  rows = 0
  while rows < 27
    cells = 0
    while cells < 3
      if items < init_array.length
        final_array[rows][cells] = init_array[items]
        items += 1
      end
      cells += 1
    end
    rows += 1
  end
  final_array
end



def section(string, box)
  array = ingest_puzzle(string)

  box = [array[box], array[box+3], array[box+6]]
  nice_print = box.each { |row| p row}
  nice_print
  p box.join('')
end

def row_check(string)
  array = ingest_puzzle(string)
  row = [array[0],array[1],array[2]]
  p row.flatten
end

def column_check(string)
  array = ingest_puzzle(string).transpose
  column = [array[0],array[1],array[2]]
  p column
end

def display(string)
  ingest_puzzle(string).each_slice(3) { |row| p row }
end


#DRIVER CODE
# display(string)
# section(string, 9)
# row_check(string)
column_check(string)
