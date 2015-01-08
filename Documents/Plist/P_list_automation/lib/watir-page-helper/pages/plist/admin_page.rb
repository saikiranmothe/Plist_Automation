$LOAD_PATH << './lib/watir-page-helper/pages/plist/'
require 'watir-page-helper'

module WatirPageHelper::Plist
  module AdminPage
    extend WatirPageHelper::ClassMethods

    direct_url "st.plist.qwinixtech.com/"
       
    def wait_for_login_page
        @browser.input(:xpath, "//form/div[2]/div[1]/input").wait_until_present
    end

    #entering username and pwd
     def admin_login(admin_user)
        wait_for_login_page
        @browser.input(:id, "user_login").wait_until_present
        @browser.input(:id, "user_login").send_keys admin_user.username
        @browser.input(:id, "user_password").wait_until_present
        @browser.input(:id, "user_password").send_keys admin_user.password
        login_btn = @browser.button(:xpath, "//form/div[2]/div[4]/button[2]").wait_until_present
        login_bt = @browser.button(:xpath, "//form/div[2]/div[4]/button[2]").click
    end

    #verifying the username in login page
    def verify_home
        verify_homepage = @browser.li(:xpath,"//div[3]/div/ul/li[1]")
         verify_homepage.wait_until_present
        if verify_homepage.exists?
          return "homepage is displaying"
      else
         raise Exception.new "homepage is not displaying"
      end 
    end

    def logout_admin_user
        user_info = @browser.button(:xpath, "//div[3]/div/div[2]/button")
        user_info.wait_until_present
        user_info.click
        logout_link = @browser.a(:xpath,"//div[3]/div/div[2]/ul/li[12]/a")
        logout_link.wait_until_present
        logout_link.click
    end

    def is_logout_admin?
      user_logout =  @browser.a(:xpath,"//div[3]/div/div[1]/span/a")
      return "User log out sccessfully" unless user_logout.exists?
    end

    def manage_users
     mang = @browser.button(:xpath,"//div[3]/div/div[2]/button")
     mang.wait_until_present
    if mang.exists?
        mang.click
    else
      raise Exception.new "setting-dropdown button is not present"
    end
      mang_user_link = @browser.a(:xpath, "//div[3]/div/div[2]/ul/li[5]/a")
        mang_user_link.wait_until_present
        if mang_user_link.exists?
            mang_user_link.click
        else
          raise Exception.new "setting-dropdown Manage Users button is not present"
        end
    end

  def search_c_user user
       @browser.a(:xpath, "//div[1]/div/form/div[6]/a").when_present.click
       @browser.input(:id, "text_search_query").wait_until_present
       @browser.input(:id, "text_search_query").send_keys user
       search_btn = @browser.button(:xpath, "//div[2]/div/span/button")
       search_btn.when_present.click
       search_result =  @browser.td(:xpath, "//div[3]/table/tbody/tr/td[2]").text
      if search_result.include? user
         return "search result are displayning as excepted"
     else
         raise Exception.new "search result is not displayning as excepted"
     end
  end

  def check_make_addmin
    @browser.a(:xpath, "//div[3]/table/tbody/tr/td[7]/a[3]").wait_until_present
     ele = @browser.a(:xpath, "//div[3]/table/tbody/tr/td[7]/a[3]").text
     if ele.include? "Make Admin"
        return ele
     else
        raise Exception.new "Make Admin link is not present"
     end
  end

  def click_make_addmin
     @browser.a(:xpath, "//div[3]/table/tbody/tr/td[7]/a[3]").when_present.click
     confrim_btn = @browser.a(:xpath, "//div[9]/div/div/div[3]/a[1]")
     confrim_btn.wait_until_present
    if confrim_btn.exists?
        confrim_btn.click
    else
        raise Exception.new "Confirm Make Admin popup is not present"
    end
      success_btn = @browser.button(:xpath,"//div[7]/div/div/div[3]/button")
     success_btn.wait_until_present
    if success_btn.exists?
      success_btn.click
      return "successful"
    else
      raise Exception.new "success popup is not displayning"
     end
  end

  def is_admin?
    sleep 2
    ele = @browser.a(:xpath, "//div[3]/table/tbody/tr/td[7]/a[3]").text
    if ele.include? "Make Admin"
    raise Exception.new "Unsccessful to add admin role to common user"
    else 
    return ele
   end
  end

  def check_remove_addmin
    @browser.a(:xpath, "//div[3]/table/tbody/tr/td[7]/a[3]").wait_until_present
     ele_remove = @browser.a(:xpath, "//div[3]/table/tbody/tr/td[7]/a[3]").text                  
     if ele_remove.include? "Remove Admin Role"
        return ele_remove
     else
        raise Exception.new "Remove Admin link is not present"
     end
  end

  def click_remove_addmin
     @browser.a(:xpath, "//div[3]/table/tbody/tr/td[7]/a[3]").when_present.click
     confrim_btn = @browser.a(:xpath, "//div[9]/div/div/div[3]/a[1]")
     confrim_btn.wait_until_present
    if confrim_btn.exists?
       confrim_btn.click
        #return "Confirm popup is present"
    else
        raise Exception.new "Confirm Remove Admin popup is not present"
    end
      success_btn = @browser.button(:xpath, "//div[7]/div/div/div[3]/button")
     success_btn.wait_until_present
    if success_btn.exists?
      success_btn.click
      return "successful"
    else
      raise Exception.new "success popup is not displayning"
     end
  end

  def is_removed_admin?
    sleep 2
    ele = @browser.a(:xpath, "//div[3]/table/tbody/tr/td[7]/a[3]").text
    if ele.include? "Remove Admin Role"
    raise Exception.new "Unsccessful to remove admin role from the common user"
    else 
    return ele
    end
  end

#####Lock&Unlock#####Block############
  def is_lock_before?
    @browser.td(:xpath, "//div[3]/table/tbody/tr/td[4]").wait_until_present
    @browser.td(:xpath, "//div[3]/table/tbody/tr/td[4]").text
  end

  def check_click_edit_button_lock
          sleep 2
            #@browser.td(:xpath, "//div[3]/table/tbody/tr/td[4]").wait_until_present
            #ele = @browser.td(:xpath, "//div[3]/table/tbody/tr/td[4]").text
      #unless ele.include? "Active"
            ele = @browser.a(:xpath, "//div[3]/table/tbody/tr/td[1]/a")
            ele.wait_until_present
        if ele.exists?
            ele.click
          return "Edit button is present"
        else
          raise Exception.new "Edit button is not present"
        end
            ele = @browser.input(:xpath, "//form/div[2]/div/div/div[1]/input")
            ele.wait_until_present
          if ele.exists?
              return "User Edit form is present"
          else
              raise Exception.new "User Edit form is not present"
          end
      #else    
        #msg = "User alreay Locked"
      #end
      #return msg
  end

  def select_lock
      selector = @browser.select_list(:id, "user_status")
      selector.when_present.select "Locked"
      @browser.input(:xpath, "//form/div[3]/div/input").when_present.click
  end

  def is_user_locked?
    sleep 2
    @browser.td(:xpath, "//div[3]/table/tbody/tr/td[4]").wait_until_present
    ele = @browser.td(:xpath, "//div[3]/table/tbody/tr/td[4]").text
    if ele.include? "Locked"
    return "User #{ele} successful"
    else
    raise Exception.new "Unsccessful to Lock the common user"
    end
  end

  def check_click_edit_button_active
     sleep 2
      @browser.td(:xpath, "//div[3]/table/tbody/tr/td[4]").wait_until_present
      ele = @browser.td(:xpath, "//div[3]/table/tbody/tr/td[4]").text
      #return "User alreay in Active status" unless ele.include? "Active"
      ele = @browser.a(:xpath, "//div[3]/table/tbody/tr/td[1]/a")
      ele.wait_until_present
     if ele.exists?
        ele.click
        return "Edit button is present"
      else
        raise Exception.new "Edit button is not present"
      end
      ele = @browser.input(:xpath, "//form/div[2]/div/div/div[1]/input")
      ele.wait_until_present
      if ele.exists?
        return "User Edit form is present"
      else
        raise Exception.new "User Edit form is not present"
      end
  end

  def select_active
      selector = @browser.select_list(:id, "user_status")
      selector.wait_until_present
      selector.when_present.select "Active"
      @browser.input(:xpath, "//form/div[3]/div/input").when_present.click
  end

  def is_user_approved?
     sleep 2
    @browser.td(:xpath, "//div[3]/table/tbody/tr/td[4]").wait_until_present
  ele = @browser.td(:xpath, "//div[3]/table/tbody/tr/td[4]").text
    if ele.include? "Active"
    return "User #{ele} successful"
    else
    raise Exception.new "Unsccessful to active the user account"
    end
  end

  def check_click_edit_button_deactive
     sleep 2
      @browser.td(:xpath, "//div[3]/table/tbody/tr/td[4]").wait_until_present
      ele = @browser.td(:xpath, "//div[3]/table/tbody/tr/td[4]").text
      #return "User alreay in Deactivated status" unless ele.include? "Deactivated"
      ele = @browser.a(:xpath, "//div[3]/table/tbody/tr/td[1]/a")
      ele.wait_until_present
     if ele.exists?
        ele.click
        return "Edit button is present"
      else
        raise Exception.new "Edit button is not present"
      end
      ele = @browser.input(:xpath, "//form/div[2]/div/div/div[1]/input")
      ele.wait_until_present
      if ele.exists?
        return "User Edit form is present"
      else
        raise Exception.new "User Edit form is not present"
      end
  end
  
  def select_block
      selector = @browser.select_list(:id, "user_status")
      selector.wait_until_present
      selector.when_present.select "Deactivated"
      @browser.input(:xpath, "//form/div[3]/div/input").when_present.click
  end

  def is_user_blocked?
    sleep 2
  ele = @browser.td(:xpath, "//div[3]/table/tbody/tr/td[4]").text
    if ele.include? "Deactivated"
    return "User #{ele} successful"
    else
    raise Exception.new "Unsccessful to Block the user account"
    end
  end 

  def is_login?
    sleep 2
    return "user not login sccessfully" unless @browser.a(:xpath,"//div[3]/div/div[1]/span/a").exists?
  end

  ####Filters##############################################################################
  def check_filters
     ele = @browser.select(:xpath, "//div[1]/div/form/div[2]/select")
     sleep(2)
    if ele.exists?
     return "Filter By Status is present"
    else
     raise Exception.new "Filter By Status is not present"
    end
  end

  def select_approved
      selector = @browser.select_list(:id, "status")
      selector.when_present.select "Approved"
  end

  def is_active_users_list?
    @browser.tr(:xpath, "//div[3]/table/tbody/tr[*]").wait_until_present
   ele = @browser.tr(:xpath, "//div[3]/table/tbody/tr[*]").text
   if ele.include? "Active"
    return "Active filter is working"
  else
    raise Exception.new "Active filter is not working"
    end
  end


   def select_blocked
      selector = @browser.select_list(:id, "status")
      selector.when_present.select "Blocked"
  end

  def is_blocked_users_list?
    @browser.tr(:xpath, "//div[3]/table/tbody/tr[*]").wait_until_present
    ele = @browser.tr(:xpath, "//div[3]/table/tbody/tr[*]").text
   if ele.include? "Deactivated"
    return "Blocked filter is working"
  else
    raise Exception.new "Blocked filter is not working"
  end
  end

  def select_locked
      selector = @browser.select_list(:id, "status")
      selector.when_present.select "Locked"
  end

  def is_locked_users_list?
     @browser.tr(:xpath, "//div[3]/table/tbody/tr[*]").wait_until_present
     ele = @browser.tr(:xpath, "//div[3]/table/tbody/tr[*]").text
   if ele.include? "Locked"
    return "Locked filter is working"
  else
    raise Exception.new "Locked filter is not working"
    end
  end

##Admin Search#######################################################################

  def seach_field
   ele = @browser.input(:id, "text_search_query")
   ele.wait_until_present
     if ele.exists?
      return "Search field is present"
    else
      raise Exception.new "Search field is not present"
    end        
  end

  def is_search_user? 
    @browser.td(:xpath, "//div[3]/table/tbody/tr/td[2]").wait_until_present
    search_result = @browser.td(:xpath, "//div[3]/table/tbody/tr/td[2]").text
      if search_result.include? "cucumber8"
         return "search result are displayning as excepted"
     else
         raise Exception.new "search result is not displayning as excepted"
     end
  end
  
  def search_by_mail mail
    @browser.a(:xpath, "//div[1]/div/form/div[6]/a").when_present.click
     @browser.input(:id, "text_search_query").send_keys mail
     search_btn = @browser.button(:xpath, "//div[2]/div/span/button")
     search_btn.when_present.click
  end

  def is_search_mail? 
    search_result = @browser.td(:xpath, "//div[3]/table/tbody/tr/td[2]").text
      if search_result.include? "qaautomation"
         return "search result are displayning as excepted"
     else
         raise Exception.new "search result is not displayning as excepted"
     end
  end


###############Profile and Bnaks###############################################
   def profile_dropdown
    mang = @browser.button(:xpath,"//div[3]/div/div[2]/button")
     mang.wait_until_present
    if mang.exists?
      sleep(3)
      mang.click
      return "setting-dropdown button is present"
    else
      raise Exception.new "setting-dropdown button is not present"
    end   
   end
  
  def my_profile
     mang = @browser.button(:xpath,"//div[3]/div/div[2]/button")
     mang.wait_until_present
    if mang.exists?
      sleep(3)
      mang.click
    else
      raise Exception.new "setting-dropdown button is not present"
    end
      my_profile = @browser.a(:xpath, "//div[3]/div/div[2]/ul/li[1]/a")
        my_profile.wait_until_present
        if my_profile.exists?
          sleep(3)
           my_profile.click
        else
          raise Exception.new "setting-dropdown Myprofile button is not present"
        end
    end
  
  def is_my_profile?
    ele = @browser.ul(:xpath, "//div[3]/div/ul")
    ele.wait_until_present
    if ele.exists?
      return "Present"
    else
      return "No my Profile"    
   end
  end

  def manage_banks
     mang = @browser.button(:xpath,"//div[3]/div/div[2]/button")
     mang.wait_until_present
    if mang.exists?
      sleep(3)
      mang.click
    else
      raise Exception.new "setting-dropdown button is not present"
    end
      mang_bank_link = @browser.a(:xpath, "//div[3]/div/div[2]/ul/li[6]/a")
        mang_bank_link.wait_until_present
        if mang_bank_link.exists?
          sleep(3)
           mang_bank_link.click
        else
          raise Exception.new "setting-dropdown Manage Banks button is not present"
        end
    end

  def is_banks?
    ele = @browser.tr(:xpath, "//div[3]/table/tbody/tr[*]")
    ele.wait_until_present
    if ele.exists?
      return "Banks Present"
    else
      return "No Banks"    
   end
  end

def manage_opp
     mang = @browser.button(:xpath,"//div[3]/div/div[2]/button")
     mang.wait_until_present
    if mang.exists?
      sleep(3)
      mang.click
    else
      raise Exception.new "setting-dropdown button is not present"
    end
      mang_opp_link = @browser.a(:xpath, "//div[3]/div/div[2]/ul/li[8]/a")
        mang_opp_link.wait_until_present
        if mang_opp_link.exists?
          sleep(3)
           mang_opp_link.click
        else
          raise Exception.new "setting-dropdown Manage Opp button is not present"
        end
  end

   def is_opp?
    ele = @browser.tr(:xpath, "//div[3]/div/div[3]/table/tbody/tr[*]")
    ele.wait_until_present
    if ele.exists?
      return "Opp Present"
    else
      return "No Opp"    
    end
  end
   

    def logout
        user_info = @browser.button(:xpath, "//div[3]/div/div[2]/button")
        user_info.wait_until_present
        user_info.click
        logout_link = @browser.a(:xpath, "//div[3]/div/div[2]/ul/li[6]/a")
        logout_link.wait_until_present
        logout_link.click
    end
  end 
end
