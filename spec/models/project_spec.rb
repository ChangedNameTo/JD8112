require 'rails_helper'
require Rails.root.join('spec', 'models', 'shared_examples', 'non_null_field.rb')

describe Project do
  it 'has a valid factory' do
    expect(build(:project)).to be_valid
  end

  describe 'project id', field: :id do
    it_behaves_like 'non null field'

    it "has a four digit id" do
      expect(build(:project, id: 300)).to be_invalid
      expect(build(:project, id: 30001)).to be_invalid
      expect(build(:project, id: "asdf3")).to be_invalid
    end
  end

  describe 'name', field: :name do
    it_behaves_like 'non null field'
  end

  describe 'team', field: :team do
    it_behaves_like 'non null field'
  end

  describe 'description', field: :description do
    it_behaves_like 'non null field'

    it "has 500 characters or less" do
      expect(build(:project, description: "a" * 501)).to be_invalid
    end
  end

  describe "repo link", field: :repo_link do
    it "is a valid URL" do
      expect(build(:project, repo_link: "http://www.foo")).to be_invalid
    end
  end
end
