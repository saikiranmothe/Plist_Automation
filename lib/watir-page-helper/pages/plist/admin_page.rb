#$LOAD_PATH << './lib/watir-page-helper/pages/plist/'
require 'watir-page-helper'
require 'join_page'
module WatirPageHelper::Plist
  module AdminPage
    extend WatirPageHelper::ClassMethods
      include JoinPage

    #direct_url "st.plist.qwinixtech.com/"
       
####Admin and Remove admin############################################################################################
  
  def manage_users
     @@mang = @browser.button(:xpath,"//div[3]/div/div[2]/button")
     @@mang.wait_until_present
    if @@mang.exists?
        @@mang.click
    else
      raise Exception.new "setting-dropdown button is not present"
    end
      mang_user_link = @browser.a(:xpath,"//ul[@class='dropdown-menu']//a[text()='Manage Users']")
        mang_user_link.wait_until_present
        if mang_user_link.exists?
            mang_user_link.click
        else
          raise Exception.new "setting-dropdown Manage Users button is not present"
        end
  end

  def search_user user
       @browser.input(:id, "text_search_query").wait_until_present
       @browser.a(:xpath, "//div[1]/div/form/div[6]/a").when_present.click
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

  def check_make_admin
    @browser.a(:xpath, "//div[3]/table/tbody/tr/td[7]/a[3]").wait_until_present
     ele = @browser.a(:xpath, "//div[3]/table/tbody/tr/td[7]/a[3]").text
     if ele.include? "Make Admin"
        return ele
     else
        raise Exception.new "Make Admin link is not present"
     end
  end
 
  def verify_role_bef
    @browser.td(:xpath, "//div[3]/table/tbody/tr/td[6]").wait_until_present
    @browser.td(:xpath, "//div[3]/table/tbody/tr/td[6]").text
  end
  
  def click_make_admin
     @browser.a(:xpath, "//div[3]/table/tbody/tr/td[7]/a[3]").when_present.click
     confrim_btn = @browser.a(:xpath,"//div[9]/div/div/div[3]/a[1]")
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

  def check_remove_admin
    @browser.a(:xpath, "//div[3]/table/tbody/tr/td[7]/a[3]").wait_until_present
     ele_remove = @browser.a(:xpath, "//div[3]/table/tbody/tr/td[7]/a[3]").text                  
     if ele_remove.include? "Remove Admin Role"
        return ele_remove
     else
        raise Exception.new "Remove Admin link is not present"
     end
  end

  def click_remove_admin
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

#####Lock, Unlock and Block##################################################################
  def check_user_status_bef
    @browser.td(:xpath, "//div[3]/table/tbody/tr/td[4]").wait_until_present
    @browser.td(:xpath, "//div[3]/table/tbody/tr/td[4]").text
  end

  def check_edit_button
        @@ele = @browser.a(:xpath, "//div[3]/table/tbody/tr/td[1]/a")
        @@ele.wait_until_present 5
      if @@ele.exists?
         #@@ele.click
        puts "Edit button is present"
      else
        raise Exception.new "Edit button is not present"
      end
  end
  
  def click_edit_button
        @@ele.click
        ele = @browser.input(:xpath, "//form/div[2]/div/div/div[1]/input")
        ele.wait_until_present
      if ele.exists?
          return "User Edit form is present"
      else
          raise Exception.new "User Edit form is not present"
      end
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

  def is_login?
    sleep 2
    return "user not login sccessfully" unless @browser.a(:xpath,"//div[3]/div/div[1]/span/a").exists?
  end

  ####Filters##############################################################################
  def check_filters
     ele = @browser.select(:id, "status")
     ele.wait_until_present
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
   ele = @browser.input(:id,"text_search_query")
   ele.wait_until_present
     if ele.exists?
      return "Search field is present"
    else
      raise Exception.new "Search field is not present"
    end        
  end

  def search_aa_user search_user
       @browser.input(:id, "text_search_query").wait_until_present
       @browser.a(:xpath, "//div[1]/div/form/div[6]/a").when_present.click
       @browser.input(:id, "text_search_query").send_keys search_user
       search_btn = @browser.button(:xpath, "//div[2]/div/span/button")
       search_btn.when_present.click
  end

  def is_search_user? search_user
    @browser.td(:xpath, "//div[3]/table/tbody/tr/td[2]").wait_until_present 
    search_result = @browser.td(:xpath, "//div[3]/table/tbody/tr/td[2]").text
      if search_result.include? search_user
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
      mang.click
    else
      raise Exception.new "setting-dropdown button is not present"
    end
      my_profile = @browser.a(:xpath, "//div[3]/div/div[2]/ul/li[1]/a")
        my_profile.wait_until_present
        if my_profile.exists?
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
        mang.click
    else
      raise Exception.new "setting-dropdown button is not present"
    end
      mang_bank_link = @browser.a(:xpath, "//div[3]/div/div[2]/ul/li[6]/a")
        mang_bank_link.wait_until_present
        if mang_bank_link.exists?
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
        mang.click
    else
      raise Exception.new "setting-dropdown button is not present"
    end
      mang_opp_link = @browser.a(:xpath, "//div[3]/div/div[2]/ul/li[8]/a")
        mang_opp_link.wait_until_present
        if mang_opp_link.exists?
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
#################################################################################

  def check_auth_button
    @browser.a(:xpath, "//table[@id='table_user_collections']//td[7]/a[text()='Authorize']").wait_until_present
    @@ele = @browser.a(:xpath, "//table[@id='table_user_collections']//td[7]/a[text()='Authorize']").text
   if @@ele.include? "Authorize"
    return @@ele
   else
    raise Exception.new "#{@@ele} button is not present"
   end
  end

  def click_button
    @browser.a(:xpath, "//div[3]/table/tbody/tr/td[7]/a[3]").when_present.click
  end

  def check_verification_logs enter_log
     @browser.textarea(:name, "user[verification_log]").wait_until_present
     @browser.textarea(:name, "user[verification_log]").clear
     @browser.textarea(:name, "user[verification_log]").send_keys enter_log
  end

 def click_verify_auth
  ele = @browser.input(:xpath, "//div[2]/form/div[3]/div/input")
    ele.wait_until_present
    ele.click
  end

  def is_authorized
    sleep 2
    @browser.td(:xpath, "//div[3]/table/tbody/tr/td[6]").wait_until_present
    ele = @browser.td(:xpath, "//div[3]/table/tbody/tr/td[6]").text
    if ele.include? "Authorized Affiliated User"
       return ele
   else
    raise Exception.new "Unable to make the user authorized" 
   end
  end

  def check_auth_notification
      @@mang.click
      ele = @browser.a(:xpath, "//div[3]/div/div[2]/ul/li[2]/a")
      ele.wait_until_present
      ele.click
      @browser.div(:xpath,"//div[2]/ul/li[1]/div").wait_until_present
       noti = @browser.div(:xpath,"//div[2]/ul/li[1]/div").text
    if noti.include? "You have been authorized to transact in ParticipationList"
      return "User has been authorized successfuly"
    else
      raise Exception.new "Failed to see the notification"
    end
  end
#Disable/Enable User Registration#################################################################################
  
  def check_before
   @browser.checkbox(:id,"suspend-user-registration")
  end

  def check_enable
     enable_ele = @browser.checkbox(:id,"suspend-user-registration")
     enable_ele.wait_until_present 10
    if enable_ele.exists?
       enable_ele.set
       enable_ele.set?
       confrim_msg = @browser.p(:xpath, "//div[@id='div_modal_message']/div/div/div[2]/div/p")
      if confrim_msg.wait_until_present
         confrim_msg.text
         close_btn = @browser.button(:xpath,"//div[@id='div_modal_message']/div/div//button[text()='Close']")
         close_btn.click
         return "#{confrim_msg}"
      else
         raise Exception.new "#{confrim_msg} dialog box not present"
      end
    else
      raise Exception.new "Unable to find the check box" 
    end
  end

  def check_disable
     disable_ele = @browser.checkbox(:id,"suspend-user-registration")
     disable_ele.wait_until_present 10
    if disable_ele.set?
       disable_ele.clear
       confrim_msg = @browser.p(:xpath, ".//*[@id='div_modal_message']/div/div/div[2]/div/p")
      if confrim_msg.wait_until_present
         confrim_msg.text
         close_btn = @browser.button(:xpath,"//div[@id='div_modal_message']/div/div//button[text()='Close']")
         close_btn.click
         close_btn.click
      else
         raise Exception.new "#{confrim_msg} dialog box not present"
      end
    else
      raise Exception.new "Unable to find the check box" 
    end
  end


  def verify_user_reg
    click_join
      msg = @browser.h4(:xpath, "//div[9]/div/div/div[1]/h4").text
      dialog = @browser.div(:xpath, "//div[9]/div/div/div[1]")
      dialog.wait_until_present
    if dialog.exists?
       p "#{msg}"
       @browser.a(:xpath,"//div[9]/div/div/div[3]/a").click
    else
      raise Exception.new "#{msg} dialog not present"
    end
  end








































 end
end