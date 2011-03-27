require 'spec_helper'

describe PaginasController do

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

  describe "GET 'contato'" do
    it "should be successful" do
      get 'contato'
      response.should be_success
    end
  end

  describe "GET 'sobre'" do
    it "should be successful" do
      get 'sobre'
      response.should be_success
    end
  end

end
