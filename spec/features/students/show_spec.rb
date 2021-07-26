require 'rails_helper'

RSpec.describe "Students show page" do
  it "lists the students courses" do
    casseopia = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
    datda = Course.create!(name: "Defense against the Dark Arts")
    herbology = Course.create!(name: "Herbology")
    potions = Course.create!(name: "Potions")

    student_course_1 = StudentCourse.create!(course: datda, student: casseopia)
    student_course_2 = StudentCourse.create!(course: herbology, student: casseopia)
    student_course_3 = StudentCourse.create!(course: potions, student: casseopia)

    visit "students/#{casseopia.id}"

    expect(page).to have_content("Casseopia Black")
    expect(page).to have_content("Defense against the Dark Arts")
    expect(page).to have_content("Herbology")
    expect(page).to have_content("Potions")
  end
end
