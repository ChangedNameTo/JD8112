require 'rails_helper'
require Rails.root.join('spec', 'models', 'shared_examples', 'non_null_field.rb')

describe Project do
  it 'has a valid factory' do
    expect(build(:project)).to be_valid
  end

  describe "batch import projects via csv" do
    it "successfully reads and adds test projects to the db" do
      Project.import_csv("./test/sample_csv.csv")
      expect(Project.first.id).to eq 7101
      expect(Project.first.name).to eq "Thracker"
      expect(Project.last.id).to eq 7359
      expect(Project.last.name).to eq "Jacket"
    end
  end
end
