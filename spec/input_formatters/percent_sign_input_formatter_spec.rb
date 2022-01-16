require 'spec_helper'

RSpec.describe InputFormatters::PercentSignInputFormatter do
  let(:input_data) { File.read('spec/fixtures/people_by_percent.txt') }

  subject { described_class.new(input_data).call }

  it 'creates array of instances of a Person class with filled attributes' do
    expect(subject).to be_kind_of(Array)

    first_entry = subject.first
    expect(first_entry.first_name).to eq('Mckayla')
    expect(first_entry.last_name).to be_nil
    expect(first_entry.birthdate).to eq('1986-05-29')
    expect(first_entry.city).to eq('Atlanta')
  end
end
