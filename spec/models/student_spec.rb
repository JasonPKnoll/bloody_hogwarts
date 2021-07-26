require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end

  describe 'class methods' do
    it "calculates student age averages" do
      casseopia = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
      susan = Student.create!(name: "Susan Bones", age: 13, house: "Hufflepuff")

      expect(Student.average_age).to eq(13.5)
    end
  end
end
