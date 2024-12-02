-- aoc24-1b.lua

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

-- Function to count occurrences in a list
function build_frequency_table(list)
    local frequency = {}
    for _, num in ipairs(list) do
        frequency[num] = (frequency[num] or 0) + 1
    end
    return frequency
end

-- Function to calculate similarity score
function calculate_similarity_score(left, right_frequency)
    local similarity_score = 0
    for _, num in ipairs(left) do
        local count_in_right = right_frequency[num] or 0
        similarity_score = similarity_score + (num * count_in_right)
    end
    return similarity_score
end

-- Function to solve Part 2
function solve_part_two(file_path)
    local left, right = parse_input(file_path)
    local right_frequency = build_frequency_table(right)
    return calculate_similarity_score(left, right_frequency)
end

-- Solve for example input
local example_result = solve_part_two("example_input_1b.txt")
print("Similarity Score (Example, Part 2):", example_result)

-- Uncomment for real input
local real_result = solve_part_two("input_1b.txt")
print("Similarity Score (Real Input, Part 2):", real_result)
