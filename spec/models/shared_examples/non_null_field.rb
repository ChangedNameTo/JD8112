RSpec.shared_examples 'non null field' do
  it 'is invalid unless the field is present' do |example|
    expect(build(described_class.to_s.underscore.to_sym, example.metadata[:field] => nil)).not_to be_valid
  end
end
