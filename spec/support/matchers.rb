def assert_line_endings
  @input.string.end_with?("\n\n").must_equal(true)
end
