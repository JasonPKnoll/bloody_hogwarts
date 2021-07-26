require 'rails_helper'

RSpec.describe 'students index page' do
  it 'shows students listed with attributes' do
    casseopia = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")

    visit "/students"

    expect(page).to have_content("Casseopia Black")
    expect(page).to have_content(14)
    expect(page).to have_content("Slytherin")
  end

  it "shows average age of students" do
    casseopia = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
    susan = Student.create!(name: "Susan Bones", age: 13, house: "Hufflepuff")

    visit "/students"
    save_and_open_page

    expect(page).to have_content(13.5)
  end
end
