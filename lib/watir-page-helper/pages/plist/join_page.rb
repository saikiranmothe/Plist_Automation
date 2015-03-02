$LOAD_PATH << './lib/watir-page-helper/pages/plist/'
require 'watir-page-helper'

module WatirPageHelper::Plist
  module JoinPage
    extend WatirPageHelper::ClassMethods

     direct_url "st.plist.qwinixtech.com/"

    def wait_for_home_page
        @browser.a(:xpath, "//div[3]/ul[2]/li[1]/a").wait_until_present
    end
    
    # to click join link
    def click_join
     	wait_for_home_page
        @browser.a(:xpath, "//div[3]/ul[2]/li[2]/a").click
    end

    # Click CREATE A NEW ACCOUNT link
    def click_create_account
           create_account = @browser.a(:xpath, "//*[@id='new_account']/a")
         if create_account.wait_until_present
           create_account.click
         else
           raise Exception.new "unable to find the Create New Account"
        end
    end

    def wait_for_join_page
        @browser.input(:xpath, "//form/div[2]/div/div[1]/input").wait_until_present
    end

    #All in one method
    def enter_join_data(user)
      wait_for_join_page
      #name
      @browser.input(:id, "user_name").when_present.send_keys user.name
      #Email
      @browser.input(:id, "user_email").when_present.send_keys user.email
      #Username
      @browser.input(:id, "user_username").when_present.send_keys user.username
      #Password
      @browser.input(:id, "user_password").when_present.send_keys user.password
      #Confirm Pwd
      @browser.input(:id, "user_password_confirmation").when_present.send_keys user.password
      #phone number
      @browser.input(:id, "phone_us").when_present.send_keys user.ph_no
      #city
      @browser.input(:id, "user_city").when_present.send_keys user.city
      #State
          selector = @browser.select_list(:id, "user_state")
           selector.when_present.select user.state
      #Title
      @browser.select_list(:id, "select_title").when_present.select user.title
    end

  
    #click on select_bank
    def click_bank
      click_bank = @browser.button(:xpath, "//form/div[2]/div/div[10]/div[2]/button")
        if click_bank.wait_until_present
           click_bank.click
        else
           raise Exception.new "unable to find the select_bank button"
        end
    end

    #select bank from the list
    def select_bank
      select_bank = @browser.button(:xpath, "//div[1]/div[1]/div[1]/div[3]/button")
        if select_bank.wait_until_present
           select_bank.click
            ele = @browser.input(:id, "authorized")
            ele.wait_until_present
          if ele.exists?
            return "Bank Selected sccessfully"
          else
             raise Exception.new "Authorization checkbox is not available in Join page"
          end
        else
           raise Exception.new "unable to find the list of banks"
        end
    end

    def click_checkbox
      ele = @browser.input(:id, "authorized")
      ele.wait_until_present
      if ele.exists?
        ele.click
        return "checkbox is present"
      else
        raise Exception.new "Chekbox is not available"
      end
    end
   
    #click on Join ParticipationList
    def click_join_plist
       sleep 3
      click_join_plist = @browser.button(:xpath, "//form/div[5]/div/button") #:id, "join")
        if click_join_plist.wait_until_present
           click_join_plist.click
        else
           raise Exception.new "unable to find the join_plist button"
        end
      agree_popup = @browser.input(:xpath, "//form/div[2]/div/div[2]/div/label/input")
      click_agree = @browser.input(:xpath, "//form/div[3]/div/input")
        if agree_popup.exists?
           agree_popup.click
           click_agree.when_present.click
        else
           raise Exception.new ("Terms of Use popup is not present hence you cant join")
        end
        sleep 3
    end
    
    #verifying the username in login page
    def verify_user(user)
      @browser.a(:xpath, "//div[3]/div/div[1]/span/a").wait_until_present
         user_name = @browser.a(:xpath, "//div[3]/div/div[1]/span/a").text
      if user_name.include? user.name 
          return "#{user_name} is present in the homepage"
      else
         raise Exception.new "#{user_name} is present not in the homepage"
      end 
    end

    def upload_img
      img_link = @browser.a(:xpath,"//form[@id='form_join_plist']//a[text()='Add Picture']")
     if img_link.exists?
        img_link.click
        img_path = "/home/qwinix/Bradley.jpg"
        sleep 3
        img_btn = @browser.div(:xpath,"//form[@id='user_form_photo']/div[3]/div[1]")
        img_btn.wait_until_present
        sleep 3
        img_btn.send_keys (img_path)
        @browser.input(:xpath,"//form[@id='user_form_photo']/div[3]/div[1]/input").when_present.click
      else
        rise Exception.new "#{img_link} link is not present"
      end
    end    
############################################################################################
#Sign In to ParticipationList with LinkedIn methods#
  
    #to click the LinkedIn button from plist page
    def click_linkedin
        sleep(5)
        @browser.a(:xpath, "//div[8]/div/div/div[2]/a").click
    end
    
    #verifying linkedin page
    def is_linkedin_page
         linked_page =  @browser.p(:xpath, "//div[2]/div/form/div[1]/p")
         linked_page.wait_until_present
      if linked_page.exists?
        return "LinkedIn page appeared" 
      else
        raise Exception.new "LinkedIn page is not appeared"
      end
    end

    #entering email and pwd 
    def login_with_linkedin(linkedin)
        @browser.input(:id, "session_key-oauth2SAuthorizeForm").wait_until_present
        @browser.input(:id, "session_key-oauth2SAuthorizeForm").send_keys linkedin.linkedin_email
        @browser.input(:id, "session_password-oauth2SAuthorizeForm").wait_until_present
        @browser.input(:id, "session_password-oauth2SAuthorizeForm").send_keys linkedin.password
    end
    
    #click on allow access
    def click_access
      access_btn =  @browser.input(:class, "allow")
         access_btn.wait_until_present
      if access_btn.exists?
          access_btn.click
      else
        raise Exception.new "Allow access button is not present"
      end 
      sleep 3 
    end

    #verifying setup page
    def is_account_page?
        acc_page = @browser.h2(:xpath, "//div[3]/section/div/h2")
        acc_page.wait_until_present
        if acc_page.exists?
           return "Account setup page is displaying"  
        else
           raise Exception.new "Account setup page is not displaying"
        end
    end


    #All in one method Join with LinkedIn
    def enter_linkedin_join_data(linkedin)
      #Email
      @browser.input(:id, "user_email").send_keys linkedin.linkedin_email
       sleep(2)
      #phone number
      @browser.input(:xpath, "//form/div[2]/div/div[3]/input").send_keys linkedin.phone
       sleep(2)
      #city
      @browser.input(:id, "user_city").send_keys linkedin.city
       sleep(2)
      #State
      @browser.select_list(:id, "user_state").when_present.select linkedin.state 
       sleep(3)
      #Title
      @browser.select_list(:id, "select_title").when_present.select linkedin.title
       sleep(3)
    end


    def click_bank_linkedin
      click_bank = @browser.button(:xpath, "//form/div[2]/div/div[7]/div[2]/button")
        if click_bank.wait_until_present 
           click_bank.click
        else
           raise Exception.new "unable to find the select_bank button"
        end
    end
    
    def verify_user_linkedin
      sleep 5
         user_name = @browser.h3(:xpath, "//div[1]/section/div[2]/h3") #//div[3]/div/div[1]/span/a")
         user_name.wait_until_present
         user_name.text
      if user_name.exists?
          return "#{user_name} is present in the homepage"
      else
         raise Exception.new "#{user_name} is present not in the homepage"
      end 
    end










 





























































































   end
 end
