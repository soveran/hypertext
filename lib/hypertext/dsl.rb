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
  class DSL
    TAGS = [:a, :abbr, :address, :area, :article, :aside,
    :audio, :b, :base, :bdi, :bdo, :blockquote, :body, :br,
    :button, :canvas, :caption, :cite, :code, :col, :colgroup,
    :data, :datalist, :dd, :del, :details, :dfn, :dialog, :div,
    :dl, :dt, :em, :embed, :fieldset, :figcaption, :figure,
    :footer, :form, :h1, :h2, :h3, :h4, :h5, :h6, :head,
    :header, :hgroup, :hr, :html, :i, :iframe, :img, :input,
    :ins, :kbd, :label, :legend, :li, :link, :main, :map,
    :mark, :meta, :meter, :nav, :noscript, :object, :ol,
    :optgroup, :option, :output, :p, :param, :picture, :pre,
    :progress, :q, :rb, :rp, :rt, :rtc, :ruby, :s, :samp,
    :script, :section, :select, :slot, :small, :source, :span,
    :strong, :style, :sub, :summary, :sup, :table, :tbody, :td,
    :template, :textarea, :tfoot, :th, :thead, :time, :title,
    :tr, :track, :u, :ul, :var, :video, :wbr]

    def initialize(&block)
      @ht = Hypertext.new
      instance_eval(&block)
    end

    TAGS.each do |tag_name|
      define_method(tag_name) do |attributes = {}, &block|
        @ht.tag(tag_name, attributes, &block)
      end
    end

    def text(content)
      @ht.text(content)
    end

    def to_s
      @ht.to_s
    end
  end
end
