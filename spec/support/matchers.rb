def assert_last_line_blank
  lines = @input.string.lines
  lines[lines.count - 2].wont_equal("\n")
  lines.last.must_equal("\n")
end
