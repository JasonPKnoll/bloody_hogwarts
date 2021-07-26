require "rails_helper"

RSpec.describe "Courses index page" do
  before(:each) do
    @datda = Course.create!(name: "Defense against the Dark Arts")
    @herbology = Course.create!(name: "Herbology")
    @potions = Course.create!(name: "Potions")

    @casseopia = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
    @lavender = Student.create!(name: "Lavender Brown", age: 14, house: "Gryffindor")
    @susan = Student.create!(name: "Susan Bones", age: 13, house: "Hufflepuff")

    @student_course_1 = StudentCourse.create!(course: @datda, student: @casseopia)
    @student_course_2 = StudentCourse.create!(course: @herbology, student: @casseopia)
    @student_course_3 = StudentCourse.create!(course: @potions, student: @casseopia)
    @student_course_4 = StudentCourse.create!(course: @potions, student: @lavender)
    @student_course_5 = StudentCourse.create!(course: @potions, student: @susan)
    @student_course_6 = StudentCourse.create!(course: @herbology, student: @casseopia)
  end
  it "list courses" do

    visit "/courses"

    expect(page).to have_content("Defense against the Dark Arts")
    expect(page).to have_content("Herbology")
    expect(page).to have_content("Potions")
  end

  it "shows number of students enrolled in each course" do

    visit "/courses"
    save_and_open_page

    expect(page).to have_content("Enrolled Students: 2")
    expect(page).to have_content("Enrolled Students: 1")
    expect(page).to have_content("Enrolled Students: 3")
  end
end
