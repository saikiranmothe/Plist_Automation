require 'watir-page-helper'

module WatirPageHelper::Plist
  module LoginPage
    extend WatirPageHelper::ClassMethods
    
    direct_url "st.plist.qwinixtech.com/"
     
    def wait_for_home_page
        @browser.a(:xpath, "//div[3]/ul[2]/li[1]/a").wait_until_present
    end
    
    #to click the signin button from plist page
    def click_signin
        wait_for_home_page
        @browser.a(:xpath, "//div[3]/ul[2]/li[1]/a").click
    end

    #verifying the login page
    def wait_for_login_page
        @browser.input(:xpath, "//form/div[2]/div[1]/input").wait_until_present
    end

    #entering username and pwd
    def login common_user
        wait_for_login_page
        @browser.input(:id, "user_login").wait_until_present
        @browser.input(:id, "user_login").send_keys common_user.username
         @browser.input(:id, "user_password").wait_until_present
        @browser.input(:id, "user_password").send_keys common_user.password
        login_btn = @browser.button(:xpath, "//form/div[2]/div[4]/button[2]").wait_until_present
        login_bt = @browser.button(:xpath, "//form/div[2]/div[4]/button[2]").click
    end

    #verifying the login page
    def is_loggedin?
        sleep 3
        (@browser.a(:xpath,"//div[3]/div/div[1]/span/a").exists? && !@browser.button(:xpath,"//form/div[2]/div[4]/button[2]").exists?)
    end
    
    #verifying the username in login page
    def verify_user common_user
        @browser.a(:xpath,"//div[3]/div/div[1]/span/a").wait_until_present
        user_name = @browser.a(:xpath,"//div[3]/div/div[1]/span/a").text
      if user_name.include? common_user.username
         return "Username is present in the homepage"
      else
         raise Exception.new "Username is present not in the homepage"
      end 
    end

    #click sign in as linkedin
    def click_linkedin_sign
        @browser.a(:xpath, "//div[2]/form/div[2]/div[5]/a").wait_until_present
        @browser.a(:xpath, "//div[2]/form/div[2]/div[5]/a").click
    end

  end
end
