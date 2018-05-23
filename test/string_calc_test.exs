defmodule StringCalcTest do
  use ExUnit.Case

  test "should return 0 given an empty string" do
    assert StringCalc.add("") == 0
  end

  test "should return an integer given a string with a single integer" do
    assert StringCalc.add("1") == 1
  end

  test "should return 3 given a string of 1,2" do
    assert StringCalc.add("1,2") == 3
  end

  test "should return 6 given a string of 1,2,3" do
    assert StringCalc.add("1,2,3") == 6
  end

  test "should return 6 given a string of 1\\n2,3" do
    assert StringCalc.add("1\n2,3") == 6
  end

  test "should return 6 given a string of //;\n1;2;3" do
    assert StringCalc.add("//;\n1;2;3") == 6
  end

  test "should raise error given a string with negative numbers" do
    assert_raise(ArgumentError, "negatives not allowed: -1,-3", fn ->
      StringCalc.add("-1,2,-3")
    end)
  end

  test "should return 6 given a string of 1,2,1001,3" do
    assert StringCalc.add("1,2,1001,3") == 6
  end

  test "should return 6 given a string of //[***]\n1***2***3" do
    assert StringCalc.add("//[***]\n1***2***3") == 6
  end

  test "should return 6 given a string of //[*][%]\n1*2%3" do
    assert StringCalc.add("//[*][%]\n1*2%3") == 6
  end

  test "should return 6 given a string of //[***][%%%]\n1***2%%%3" do
    assert StringCalc.add("//[***][%%%]\n1***2%%%3") == 6
  end
end
