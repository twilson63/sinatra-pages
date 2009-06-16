require File.dirname(__FILE__) + '/helper'
require 'haml'
require 'sinatra/pages'

class SinatraPagesTest < Test::Unit::TestCase

  
  def test_default
    assert true
  end

  describe 'pages index' do
    setup do
      system "export API_KEY=hello"
      
      system "rake db:migrate"
      
      dbconfig = YAML.load(File.read('config/database.yml'))
      ActiveRecord::Base.establish_connection dbconfig['production']
      
      Page.delete_all
      
      Page.create!(:name => "hello", :body => "%h1 Hello World", :page_type => "haml")
      
      mock_app {
        get '/mystuff' do
          "Hello World"
        end        
        
        register Sinatra::Pages
        
      }
    end
    
    it 'renders hello world' do
      get '/mystuff'
      assert_equal "Hello World", body
    end    

    it 'should render pages index' do
      get '/pages?api_key=hello'
      assert_equal "hello", Crack::JSON.parse(body)[0]["name"]
    end    
    
    it 'should create a page called world' do
      post '/pages?api_key=hello&page[name]=world'
      assert_equal "world", Crack::JSON.parse(body)["name"]
    end
    
    it 'should return page hello when requested' do
      get '/pages/hello?api_key=hello'
      assert_equal "hello", Crack::JSON.parse(body)["name"]  
    end
    
    it 'should update page hello to hello2' do
      get '/pages/hello?api_key=hello'
      id = Crack::JSON.parse(body)["id"]
      put "/pages/#{id}?api_key=hello&page[name]=hello2"
      assert_equal "true", body
    end
    
    it 'should delete page world' do
      get '/pages/hello?api_key=hello'
      id = Crack::JSON.parse(body)["id"]
      delete "/pages/#{id}?api_key=hello"
      assert_equal "", body
      
    end
    
    it 'should return index' do
      get '/'
      assert_equal "<html>\n  <body>\n    <div class='title'>Welcome to the Blank Project</div>\n    <br />\n    <a href='http://github.com/twilson63/blank'>The Blank Project Home Page</a>\n  </body>\n</html>\n", body  
    end
    
    
    

  end


end
