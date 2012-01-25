require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "redirects to sign in page" do
      get 'index'
      response.should redirect_to(new_user_session_path)
    end
  end

end
