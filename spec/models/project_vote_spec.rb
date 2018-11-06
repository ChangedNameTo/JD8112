require 'rails_helper'
require Rails.root.join('spec', 'models', 'shared_examples', 'non_null_field.rb')

describe ProjectVote do
  subject { build( :project_vote ) }

  it { should validate_presence_of :user_id }
  it { should validate_presence_of :project_id }
  it { should validate_presence_of :yes }

  it { should belong_to :user }
  it { should belong_to :project }
end
