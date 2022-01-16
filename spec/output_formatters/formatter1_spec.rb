require 'spec_helper'

RSpec.describe OutputFormatters::Formatter1 do
  let(:input_data) { [
    Person.new('Elliot', nil, '04-05-1947', 'NYC'),
    Person.new('Mckayla', nil, '29-05-1986', 'Atlanta'),
    Person.new('Rhiannon', nil, '30-04-1974', 'LA'),
    Person.new('Rigoberto', nil, '05-01-1962', 'NYC'),
  ] }

  subject { described_class.new(input_data).call }

  it 'outputs persons` data as array of formatted strings' do
    expect(subject).to be_kind_of(Array)

    expect(subject).to eq([
      'Elliot, New York City, 5/4/1947',
      'Mckayla, Atlanta, 5/29/1986',
      'Rhiannon, Los Angeles, 4/30/1974',
      'Rigoberto, New York City, 1/5/1962'
    ])
  end
end
