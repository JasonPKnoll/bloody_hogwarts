require 'rails_helper'

RSpec.describe 'students index page' do
  it 'shows students listed with attributes' do
    casseopia = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
    visit "/students/#{casseopia.id}"

    expect(page).to have_content("Casseopia Black")
    expect(page).to have_content(14)
    expect(page).to have_content("Slytherin")
  end

end
