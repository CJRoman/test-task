require 'spec_helper'

RSpec.describe InputFormatters::DollarSignInputFormatter do
  let(:input_data) { File.read('spec/fixtures/people_by_dollar.txt') }

  subject { described_class.new(input_data).call }

  it 'creates array of instances of a Person class with filled attributes' do
    expect(subject).to be_kind_of(Array)

    first_entry = subject.first
    expect(first_entry.first_name).to eq('Rhiannon')
    expect(first_entry.last_name).to eq('Nolan')
    expect(first_entry.birthdate).to eq('30-4-1974')
    expect(first_entry.city).to eq('LA')
  end
end
