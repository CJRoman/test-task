class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    people_data = InputFormatter.get_data(params).flatten
    OutputFormatters::Formatter1.new(people_data).call
  end

  private

  attr_reader :params
end
