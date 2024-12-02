-- aoc24-1a.lua

-- Function to parse input from a file
function parse_input(file_path)
    local left, right = {}, {}
    for line in io.lines(file_path) do
        local l, r = line:match("(%d+)%s+(%d+)")
        table.insert(left, tonumber(l))
        table.insert(right, tonumber(r))
    end
    return left, right
end

-- Function to sort lists
function sort_lists(left, right)
    table.sort(left)
    table.sort(right)
end

-- Function to calculate total distance
function calculate_total_distance(left, right)
    local total_distance = 0
    for i = 1, #left do
        total_distance = total_distance + math.abs(left[i] - right[i])
    end
    return total_distance
end

-- Function to solve the puzzle
function solve_puzzle(file_path)
    local left, right = parse_input(file_path)
    sort_lists(left, right)
    return calculate_total_distance(left, right)
end

-- Solve for example input
local example_result = solve_puzzle("example_input.txt")
print("Total Distance (Example):", example_result)

-- Uncomment the following lines to solve for the real input later
local real_result = solve_puzzle("input.txt")
print("Total Distance (Real Input):", real_result)
