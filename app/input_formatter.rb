class InputFormatter
  class << self
    def get_data(params)
      formatters_data(params).map do |key, value|
        klass = input_formatter_class(key)
        const_get(klass).new(value).call
      end
    end

    def input_formatter_key(key)
      /(?<result>\w+)(_format)/ =~ key.to_s
      result
    end

    def input_formatter_class(key)
      "InputFormatters::#{input_formatter_key(key).capitalize}SignInputFormatter"
    end

    def formatters_data(params)
      params.select{|key, val| key.to_s =~ /_format$/}
    end
  end

  attr_reader :data

  def initialize(data)
    @data = data
  end

  def call
    result = []

    data_lines.each do |line|
      person = Person.new
      headers.each_with_index do |header, index|
        person.send("#{header}=", delimited_raw_line(line)[index])
      end
      result << person
    end

    result
  end

  private

  def delimiter
    self.class::DELIMITER
  end

  def raw_lines
    data.split("\n")
  end

  def headers
    raw_lines.first.split(delimiter)
  end

  def data_lines
    raw_lines.drop(1)
  end

  def delimited_raw_line(line)
    line.split(delimiter)
  end
end
