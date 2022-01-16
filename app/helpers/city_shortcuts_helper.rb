# frozen_string_literal: true

require 'yaml'

# CityShortcutsHelper
class CityShortcutsHelper
  def self.substitute(shortcut)
    substitutions_file[shortcut.to_s] || shortcut
  end

  def self.substitutions_file
    @substitutions_file ||= YAML.safe_load(File.read('config/city_shortcuts.yml'))
  end
end
