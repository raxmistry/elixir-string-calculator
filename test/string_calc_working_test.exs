defmodule StringCalcWorkingTest do
  use ExUnit.Case

  test "should return 0 given an empty string" do
    assert StringCalcWorking.add() == 0
  end

  test "should return an integer given a string with a single integer" do
    assert StringCalcWorking.add("3") == 3
  end

  test "should return 3 given a string of 1,2" do
    assert StringCalcWorking.add("1,2") == 3
  end

  test "should return 3 given a string of 1,2,3" do
    assert StringCalcWorking.add("1,2,3") == 6
  end

  test "should return 3 given a string of 1\\n2,3" do
    assert StringCalcWorking.add("1\n2,3") == 6
  end

  test "should return 3 given a string of //;\n1;2;3" do
    assert StringCalcWorking.add("//;\n1;2;3") == 6
  end

  test "should raise error given a string with negatives" do
    assert_raise ArgumentError, "Negatives not allowed: -2", (fn -> StringCalcWorking.add("1,-2,3") end)
  end

  test "should raise error given a string with multipe negatives" do
    assert_raise ArgumentError, "Negatives not allowed: -2,-3", (fn -> StringCalcWorking.add("1,-2,-3") end)
  end

  test "should return 6 given a string with 1,2,1001,3" do
    assert StringCalcWorking.add("1\n2,1001,3") == 6
  end

  test "should return 3 given a string of //[***]\n1***2***3" do
    assert StringCalcWorking.add("//[***]\n1***2***3") == 6
  end

  test "should return 3 given a string of //[*][%]\n1*2%3" do
    assert StringCalcWorking.add("//[*][%]\n1*2%3") == 6
  end

  test "should return 3 given a string of //[***][%%%]\n1***2%%%3" do
    assert StringCalcWorking.add("//[***][%%%]\n1***2%%%3") == 6
  end
end
