# encoding: UTF-8
#
# Copyright (c) 2021 Michel Martens
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

class Hypertext
  ENTITIES = {
    "'" => '&#39;',
    '&' => '&amp;',
    '"' => '&quot;',
    '<' => '&lt;',
    '>' => '&gt;',
  }

  def self.render(array, indent = "  ", level = 0)
    indentation = indent * level

    array.map do |element|
      if Array === element
        render(element, indent, level + 1)
      else
        sprintf "%s%s\n", indentation, element
      end
    end.join
  end

  def self.escape(str)
    str.gsub(/['&\"<>]/, ENTITIES)
  end

  def initialize
    @dom = []

    if block_given?
      yield self
    end
  end

  def tag(name, attributes = {})
    atts = compile(attributes)

    if block_given?
      @dom << "<#{name}#{atts}>"

      original, @dom = @dom, []
      yield
      @dom = original << @dom

      @dom << "</#{name}>"
    else
      @dom << "<#{name}#{atts} />"
    end
  end

  def text(value)
    @dom << escape(value)
  end

  def to_a
    @dom
  end

  def to_s(indent = "  ")
    self.class.render(@dom, indent)
  end

private

  def escape(str)
    self.class.escape(str)
  end

  def compile(attributes)
    attributes.map do |key, val|
      case val
      when false
      when true
        %[ #{key}]
      else
        %[ #{key}="#{escape(val.to_s)}"]
      end
    end.join
  end
end
