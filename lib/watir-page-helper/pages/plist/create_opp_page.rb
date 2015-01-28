$LOAD_PATH << './lib/watir-page-helper/pages/plist/'
require 'watir-page-helper'
#require 'watir-webdriver'

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
        @@ele = @browser.label(:xpath,"//form/div[2]/div[2]/label").text
        new_opp = @browser.input(:xpath,"//form/div[2]/div[2]/label/input")
        confirm_btn = @browser.input(:id,"create_opportunity_btn")
        new_opp.when_present.click
        confirm_btn.when_present.click
    end
 
    def verify_opp
        @browser.h5(:xpath, "//div[@id='div_opportunity_header']//div[4]/h5").wait_until_present
        ele = @browser.h5(:xpath, "//div[@id='div_opportunity_header']//div[4]/h5").text
      if ele.include? @@ele
          return "New Opportunity Created"
      else
          raise Exception.new "Unable to dispaly new opportunity page"
      end
    end

#Edit Originator###############################################################################################
    def click_originator
        ele = @browser.a(:id, "originator_pencil")
        ele.wait_until_present
      if ele.exists?
          ele.click
      else
          raise Exception.new "Unable to find edit statistics pencil"
      end 
    end

    def edit_originator loan_origin,lender
        ele = @browser.select_list(:id,"opportunity_loan_originator_id")
        ele.wait_until_present
        ele.select loan_origin
        lender_name = @browser.select_list(:id,"opportunity_lender_id")
        lender_name.wait_until_present
        lender_name.select lender
    end 

    def click_save
        save_btn = @browser.input(:xpath, "//div[@class='col-md-8 col-left-main']//input[@value='Save']")
        save_btn.wait_until_present
      if save_btn.exists?
         save_btn.click
      else
         raise Exception.new "Unable to find the save batton" 
      end  
    end 

    def verify_changes
       @browser.li(:xpath,"//div[3]/section/div/div/ul/li[1]").wait_until_present
      ele = @browser.li(:xpath,"//div[3]/section/div/div/ul/li[1]").text
      if ele.include? "-"
        raise Exception.new "Unable save the changes" 
      else
        return "Details Saved" 
      end
    end

#Edit Borrower###############################################################################################
    
    def click_borrower
        ele = @browser.a(:xpath, "//div[2]/div[1]/div[4]/section/a")
        ele.wait_until_present
      if ele.exists?
          ele.click
      else
          raise Exception.new "Unable to find edit borrower pencil"
      end 
    end
    
    def enter_borrower borrower_name
        @browser.input(:id,"opportunity_borrower_name").wait_until_present
        @browser.input(:id,"opportunity_borrower_name").send_keys borrower_name
    end

    def incrop state
        ele = @browser.select_list(:id,"opportunity_borrower_state_of_incorporation")
        ele.wait_until_present
        ele.select state
    end

    def type_entity entity
        entity_type = @browser.select_list(:id,"opportunity_borrower_type_of_entity")
        entity_type.wait_until_present
        entity_type.select entity
    end

    def enter_address address
        line1 = @browser.input(:id,"opportunity_address_attributes_address_line_1")
        line1.wait_until_present
        line1.send_keys address

        line2 = @browser.input(:id,"opportunity_address_attributes_address_line_2")
        line2.wait_until_present
        line2.send_keys address
    end

    def enter_city city
        line1 = @browser.input(:id,"opportunity_address_attributes_city")
        line1.wait_until_present
        line1.send_keys city
    end

    def enter_state state
        ele = @browser.select_list(:id,"opportunity_address_attributes_state_id")
        ele.wait_until_present
        ele.select state
    end 

    def enter_zipcode zipcode
        zip = @browser.input(:id,"opportunity_address_attributes_zip_code")
        zip.wait_until_present
        zip.send_keys zipcode
    end

    def verify_borrow_changes
       ele = @browser.h4(:xpath,"//div[2]/div[1]/div[4]/section/h4")
       ele.wait_until_present
     if ele.exists?
         return "Details Saved" 
      else
        raise Exception.new "Unable save the changes"
      end
    end

#Edit Description#############################################################################################################
    
    def click_descrip
        ele = @browser.a(:xpath, ".//*[@id='div_description_section']/a")
        ele.wait_until_present
      if ele.exists?
          ele.click
      else
          raise Exception.new "Unable to find edit description pencil"
      end 
    end

    def enter_description ln,bg
      ele = @browser.textarea(:id, "opportunity_loan_narrative")
      ele.wait_until_present
      ele.send_keys ln
      ele2 = @browser.textarea(:id, "opportunity_borrower_general")
      ele2.wait_until_present
      ele2.send_keys bg
    end

    def verify_descrip_changes
       ele = @browser.p(:xpath,"//div[1]/div[5]/section/div[1]/p")
       ele.wait_until_present
     if ele.exists?
         return "Description details Saved" 
      else
        raise Exception.new "Unable save the changes"
      end
    end 

#Upload Documument#############################################################################################
#Upload Document
    def document
      sleep 5
        @browser.a(:xpath,"//div[1]/div[2]/div[1]/section/ul/li[2]/a").when_present.click
    end

    def newdoc
      sleep 5
      @browser.a(:xpath,"//div[2]/div[1]/div[2]/div[2]/div[1]/div[3]/a").click
    end

    def addfile
      sleep 5
      path = "/home/somsekhar/Downloads/cucumber_cheez.pdf"
      @browser.input(:name, "document[file]").send_keys (path)
      #@browser.table(:xpath,"//div[2]/div[3]/div/div/div[2]/form/div[2]/table")
    end


 



















































































































































































 end
end

