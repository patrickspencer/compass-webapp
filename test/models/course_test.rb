require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test "should not save course without title" do
    course = Course.new
    assert_not course.save
  end
end
