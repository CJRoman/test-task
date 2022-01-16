# frozen_string_literal: true

require 'date'

module OutputFormatters
  # OutputFormatters::Formatter1
  class Formatter1
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def call
      data.map do |person|
        "#{person.first_name}, #{format_city(person.city)}, #{format_date(person.birthdate)}"
      end
    end

    private

    def format_city(city)
      CityShortcutsHelper.substitute(city)
    end

    def format_date(date)
      DateTime.parse(date).strftime('%-m/%-d/%Y')
    end
  end
end
