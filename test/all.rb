scope "Hypertext" do
  test "text" do
    expected = "hello world\n"

    observed = Hypertext.new
    observed.text "hello world"

    assert_equal expected, observed.to_s
  end

  test "self-closing tags" do
    expected = "<br />\n"

    observed = Hypertext.new
    observed.tag :br

    assert_equal expected, observed.to_s
  end

  test "opening and closing tags" do
    expected = "<span>\n  hello world\n</span>\n"

    observed = Hypertext.new
    observed.tag :span do |ht|
      ht.text "hello world"
    end

    assert_equal expected, observed.to_s
  end

  test "nested tags" do
    expected = "<div>\n  <p>\n    hello world\n  </p>\n</div>\n"

    observed = Hypertext.new
    observed.tag :div do |ht|
      ht.tag :p do |ht|
        ht.text "hello world"
      end
    end

    assert_equal expected, observed.to_s
  end

  test "passing a block to Hypertext.new" do
    expected = "<br />\n"

    observed = Hypertext.new do |ht|
      ht.tag :br
    end

    assert_equal expected, observed.to_s
  end

  test "tags with attributes" do
    expected = "<input type=\"text\" name=\"person[name]\" value=\"Foo\" />\n"

    observed = Hypertext.new do |ht|
      ht.tag :input, :type => "text", :name => "person[name]", :value => "Foo"
    end

    assert_equal expected, observed.to_s
  end

  test "custom indentation" do
    expected = "<p>\n....hello world\n</p>\n"

    observed = Hypertext.new do |ht|
      ht.tag :p do |ht|
        ht.text "hello world"
      end
    end

    assert_equal expected, observed.to_s("....")
  end
end
