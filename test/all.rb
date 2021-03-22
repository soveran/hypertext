scope "Hypertext" do
  test "append" do
    expected = "hello &rarr; world\n"

    ht = Hypertext.new
    ht.append "hello &rarr; world"

    assert_equal expected, ht.to_s
  end

  test "text" do
    expected = "hello world\n"

    ht = Hypertext.new
    ht.text "hello world"

    assert_equal expected, ht.to_s
  end

  test "self-closing tags" do
    expected = "<br />\n"

    ht = Hypertext.new
    ht.tag :br

    assert_equal expected, ht.to_s
  end

  test "opening and closing tags" do
    expected = "<span>\n  hello world\n</span>\n"

    ht = Hypertext.new
    ht.tag :span do
      ht.text "hello world"
    end

    assert_equal expected, ht.to_s
  end

  test "nested tags" do
    expected = "<div>\n  <p>\n    hello world\n  </p>\n</div>\n"

    ht = Hypertext.new
    ht.tag :div do
      ht.tag :p do
        ht.text "hello world"
      end
    end

    assert_equal expected, ht.to_s
  end

  test "passing a block to Hypertext.new" do
    expected = "<br />\n"

    ht = Hypertext.new do |ht|
      ht.tag :br
    end

    assert_equal expected, ht.to_s
  end

  test "tags with attributes" do
    expected = "<input type=\"text\" name=\"person[name]\" value=\"Foo\" />\n"

    ht = Hypertext.new do |ht|
      ht.tag :input, :type => "text", :name => "person[name]", :value => "Foo"
    end

    assert_equal expected, ht.to_s
  end

  test "custom indentation" do
    expected = "<p>\n....hello world\n</p>\n"

    ht = Hypertext.new do |ht|
      ht.tag :p do
        ht.text "hello world"
      end
    end

    assert_equal expected, ht.to_s("....")
  end
end

scope "Hypertext::DSL" do
  test do
    expected = "<head>\n  <title>\n    hello world\n  </title>\n</head>\n"

    ht = Hypertext::DSL.new do
      head do
        title do
          text "hello world"
        end
      end
    end

    assert_equal expected, ht.to_s
  end
end
