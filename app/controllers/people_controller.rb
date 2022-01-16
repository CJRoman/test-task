# frozen_string_literal: true

# PeopleController
class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    OutputFormatters::Formatter1.new(ordered_people).call
  end

  private

  def people_data
    @people_data ||= InputFormatter.get_data(params).flatten
  end

  def ordered_people
    sorting_attribute = params[:order] || :first_name
    people_data.sort_by { |person| person.send(sorting_attribute) }
  end

  attr_reader :params
end
