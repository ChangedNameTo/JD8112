require 'rails_helper'
require Rails.root.join('spec', 'models', 'shared_examples', 'non_null_field.rb')

describe Project do
  it 'has a valid factory' do
    expect(build(:project)).to be_valid
  end

  describe "import projects via csv" do
    it "successfully reads and adds test projects to the db" do
      Project.import_csv("./test/sample_csv_small.csv")
      expect(Project.first.id).to eq 7106
      expect(Project.second.id).to eq 7300
    end
  end
end
