require 'rails_helper'
require Rails.root.join('spec', 'models', 'shared_examples', 'non_null_field.rb')

describe Bookmark do
  subject { build( :bookmark ) }

  it { should validate_presence_of :user_id }
  it { should validate_presence_of :project_id }

  it { should belong_to :user }
  it { should belong_to :project }
end