require 'colored'
require 'pathname'
require 'yaml'

module Playgroundbook
  # A renderer for playground books.
  class Renderer < AbstractLinter
    attr_accessor :yaml_file_name
    attr_accessor :contents_linter
    attr_accessor :ui

    def initialize(yaml_file_name, ui = Cork::Board.new)
      @yaml_file_name = yaml_file_name
      @contents_linter = contents_linter
      @ui = ui
    end

    def render
      ui.puts "Rendering #{yaml_file_name.yellow}..."
      
      book = yaml_contents
      book_dir_name = "#{book['name']}.playgroundbook"

      Dir.mkdir(book_dir_name) unless Dir.exist?(book_dir_name) 
    end

    def yaml_contents
      YAML.load(File.open(@yaml_file_name))
    end
  end
end
