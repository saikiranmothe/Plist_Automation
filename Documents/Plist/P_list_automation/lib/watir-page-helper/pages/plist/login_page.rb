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
        @browser.window.maximize
        wait_for_home_page
        @browser.a(:xpath, "//div[3]/ul[2]/li[1]/a").click
    end

    #verifying the login page
    def wait_for_login_page
        @browser.input(:xpath, "//form/div[2]/div[1]/input").wait_until_present
    end

    #entering username and pwd
    def login username,password
        sleep(5)
        wait_for_login_page
        @browser.input(:id, "user_login").send_keys username
        @browser.input(:id, "user_password").send_keys password
        login_btn = @browser.button(:xpath, "//form/div[2]/div[4]/button[2]").wait_until_present
        login_bt = @browser.button(:xpath, "//form/div[2]/div[4]/button[2]").click
    end

    #verifying the login page
    def is_loggedin?
        sleep(10)
        (@browser.a(:xpath,"//div[3]/div/div[1]/span/a").exists? && !@browser.button(:xpath,"//form/div[2]/div[4]/button[2]").exists?)
    end
    
    #verifying the username in login page
    def verify_user username
        user_name = @browser.a(:xpath,"//div[3]/div/div[1]/span/a").text
      if user_name.include? username
         return "Username is present in the homepage"
      else
         rise "Username is present not in the homepage"
      end 
    end

    def logout
        user_info = @browser.button(:xpath, "//div[3]/div/div[2]/button")
        user_info.wait_until_present
        user_info.click
        logout_link = @browser.a(:xpath, ".//*[@id='main-public-nav-collapse']/div/div[2]/ul/li[11]/a")
        logout_link.wait_until_present
        logout_link.click
    end

    def is_logout?
      user_logout =  @browser.a(:xpath,"//div[3]/div/div[1]/span/a")
      return "User log out sccessfully" unless user_logout.exists?
    end
  end
end
