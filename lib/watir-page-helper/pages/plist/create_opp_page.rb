#$LOAD_PATH << './lib/watir-page-helper/pages/plist/'
require 'watir-page-helper'

module WatirPageHelper::Plist
  module CreateOppPage
    extend WatirPageHelper::ClassMethods

    direct_url "st.plist.qwinixtech.com/"

 #to create opportunity
 def create_opp  
 	ele = @browser.button(:xpath, "//*[@id='main-public-nav-collapse']/div/div[2]/button")
 	ele.when_present.click
 	ele = @browser.a(:xpath, "//ul[@class='dropdown-menu']//li/a[text()='Create an Opportunity']")
 	if ele.exists?
        ele.click
        return "Main menu button is present"
        else
        raise Exception.new "Main menu button is not available" 
    end
 end


 def verify_popup
   ele = @browser.form(:xpath,"//form[@id='new_opportunity']")
   ele.wait_until_present
   if ele.exists?
      return "Popup is displayed with buttons"
     else
      return "Popup not available"
  end 

 end

 def click_new_opp
  @@ele = @browser.input(:xpath,"//form[@id='new_opportunity']/div[2]//label/input[@id='js-opportunity-participation-new']")
  @@ele.text
  return "#{@@ele}"
  confirm_btn = @browser.input(:id,"create_opportunity_btn")
  @@ele.click
  confirm_btn.click
end































end
end

