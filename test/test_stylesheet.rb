require File.expand_path('../helper', __FILE__)

class RoccoStylesheetTests < Test::Unit::TestCase
  def test_default_stylesheet
    r = Rocco.new( 'file.rb', [ 'file.rb'] ) {
      "# Content"
    }
    html = r.to_html
    assert(
      html.include?('<link rel="stylesheet" href="https://jashkenas.github.io/docco/resources/linear/docco.css">')
    )
  end

  def test_custom_stylesheet
    r = Rocco.new( 'file.rb', [ 'file.rb'], :stylesheet => 'https://example.com/custom.css' ) {
      "# Content"
    }
    html = r.to_html
    assert(
      html.include?('<link rel="stylesheet" href="https://example.com/custom.css">')
    )
  end

  def test_default_syntax_stylesheet
    r = Rocco.new( 'file.rb', [ 'file.rb'] ) {
      "# Content"
    }
    html = r.to_html
    assert(
      html.include?('<link rel="stylesheet" href="https://jashkenas.github.io/docco/resources/linear/docco.css">')
    )
  end

  def test_custom_syntax_stylesheet
    r = Rocco.new( 'file.rb', [ 'file.rb'], :syntax_stylesheet => 'https://example.com/custom_syntax.css' ) {
      "# Content"
    }
    html = r.to_html
    assert(
      html.include?('<link rel="stylesheet" href="https://example.com/custom_syntax.css">')
    )
  end
end
