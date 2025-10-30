require 'spec_helper'
#require 'rails_helper' # Takes a long time to load

RSpec.describe 'Suite RSpec test' do
  let(:value) { 10 }
  
  it 'For numeric value' do
   #expect(10).to eq(10)
   #expect(10).to eql(10)
   #expect(10).to be(10)
   #expect(10).to be_a(Integer)
   #expect(10).to be_an_instance_of(Integer)
    expect(value).to be_a(Numeric)
  end

  # Disable(spec/spec_helper.rb):
  # config.filter_run_when_matching :focus
  # Run:
  # bin/rspec --tag focus -fd
  it 'runs only this test when focused', :focus do
    expect(value * 2).to eq(20)
  end
end
