# coding: utf-8

require "rexml/document"

module RailsBestPractices
  module Formatter
    class Checkstyle

      attr_reader :output, :errors

      def initialize(output, errors)
        @output = output
        @errors = errors
      end

      def started
        @document = REXML::Document.new.tap do |d|
          d << REXML::XMLDecl.new
        end
        @checkstyle = REXML::Element.new('checkstyle', @document)
      end

      def merge_errors
        ret = {}
        @errors.each do |e|
          ret[e.filename] ||= []
          ret[e.filename] << e
        end

        ret
      end

      def add_file
        merge_errors.each do |file, errors|
          REXML::Element.new('file', @checkstyle).tap do |f|
            f.attributes['name'] = file
            add_errors(f, errors)
          end
        end
      end

      def add_errors(parent, err)
        err.each do |e|
          REXML::Element.new('error', parent).tap do |ele|
            ele.attributes['column']   = 0
            ele.attributes['line']     = e.line_number
            ele.attributes['severity'] = 'error'
            ele.attributes['message']  = e.message
            ele.attributes['source']   = 'com.puppycrawl.tools.checkstyle.rbp.' + e.type
          end
        end
      end

      def finished
        @document.write(@output, 2)
      end
    end
  end
end
