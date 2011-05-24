require 'reco_test'

class PreprocessorTest < Reco::TestCase
  def test_preprocessing_hello_eco_fixture
    assert_equal fixture('hello.coffee'), preprocess('hello.eco')
  end
  
  def test_preprocessing_projects_eco_fixture
    assert_equal fixture('projects.coffee'), preprocess('projects.eco')
  end
  
  def test_preprocessing_helpers_eco_fixture
    assert_equal fixture('helpers.coffee'), preprocess('helpers.eco')
  end
  
  def test_unexpected_dedent
    assert_raises Reco::Preprocessor::Error do
      preprocess 'invalid_dedentation.eco'
    end
  end
  
  def test_expected_newline_in_code_block
    assert_raises Reco::Preprocessor::Error do
      preprocess 'unexpected_newline_in_code_block.eco'
    end
  end
  
  private
  def preprocess(path)
    source = fixture(path)
    Reco::Preprocessor.preprocess source
  end
end
