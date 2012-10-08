class XmlDocument
  def initialize(with_indents = false)
    with_indents ? @builder = XmlStructBuilder.new : @builder = XmlSimpleBuilder.new
  end

  def method_missing(meth, args = nil, &block)
    if args.nil? && !block_given?
      @builder.make_empty_tag(meth)
    elsif args.is_a?(Hash)
      @builder.make_with_attrs(meth, args)
    elsif args.is_a?(String)
      @builder.make_with_text(meth, args)
    elsif block_given?
      @builder.make_with_block(meth, block)
    end
  end
end

class XmlSimpleBuilder
  def make_empty_tag(tag)
    "<#{ tag }/>"
  end

  def make_with_attrs(tag, attrs)
    "<#{ tag }#{ attrs.map { |key, value| " #{ key }='#{ value }'" }.to_a.join }/>"
  end

  def make_with_text(tag, text)
    "<#{ tag }>#{ text }</#{ tag }>"
  end

  def make_with_block(tag, block)
    "<#{ tag }>" + block.call + "</#{ tag }>"
  end
end

class XmlStructBuilder
  def initialize
    @nesting_lev =-1
  end

  def make_with_block(tag, block)
    @nesting_lev += 1
    formatted_str = "#{ "  " * @nesting_lev }<#{ tag }>\n#{ block.call }#{ "  " * @nesting_lev }</#{ tag }>\n"
    @nesting_lev -= 1
    formatted_str
  end

  def make_with_attrs(tag, attrs)
    "#{ "  " * (@nesting_lev + 1) }<#{ tag }#{ attrs.map { |key, value| " #{ key }='#{ value }'" }.to_a.join }/>\n"
  end
end