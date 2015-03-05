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
        $ele_id = @browser.span(:xpath, "//div[@id='div_opportunity_header']/div/div/div[1]/div[3]/h5/span").text
        p $ele_id
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

#Edit statistics###############################################################################################
     
     def click_satatis
        ele = @browser.a(:id, "statistics_pencil")
        ele.wait_until_present
      if ele.exists?
          ele.click
      else
          raise Exception.new "Unable to find edit description pencil"
      end 
    end

    def enter_loantype loan_type
        ele = @browser.select_list(:id,"opportunity_loan_type_id")
        ele.wait_until_present
        ele.select loan_type
    end

    def loanoccupancy occupancy_type
        ele = @browser.select_list(:id,"opportunity_occupancy_type")
        ele.wait_until_present
        ele.select occupancy_type
    end

    def statis_values(statistics)
        ele = @browser.select_list(:id,"opportunity_loan_sub_type")
        ele.wait_until_present
        ele.select statistics.loansubtype
        #sleep 2
        @browser.input(:id, "opportunity_industry").when_present.send_keys statistics.industry
        #sleep 2
        @browser.input(:id, "opportunity_loan_rate").when_present.send_keys statistics.loanrate
        #sleep 2 
        @browser.select_list(:id,"opportunity_rate_type").when_present.select statistics.ratetype
        #sleep 2
        @browser.input(:id, "opportunity_loan_amount").when_present.send_keys statistics.loanamount
        #sleep 2
        @browser.input(:id, "opportunity_participation_amount").when_present.send_keys statistics.amounttoparticipate
        #sleep 2
        @browser.text_field(:name, "opportunity[origination_fees]").wait_until_present
        @browser.text_field(:name, "opportunity[origination_fees]").clear
        @browser.text_field(:name, "opportunity[origination_fees]").send_keys statistics.originationfees
        #sleep 2
        #@browser.input(:id, "opportunity_servicing_fee").when_present.clear
        #@browser.text_field(:id, "opportunity_servicing_fee").when_present.send_keys statistics.servicingfee
        @browser.text_field(:name, "opportunity[servicing_fee]").wait_until_present
        @browser.text_field(:name, "opportunity[servicing_fee]").clear
        @browser.text_field(:name, "opportunity[servicing_fee]").send_keys statistics.servicingfee
        #sleep 2
        @browser.input(:id, "opportunity_initial_servicing_fee").when_present.send_keys statistics.initialservicingfee
        #sleep 2
        @browser.input(:id, "opportunity_cra_eligible_1").when_present.click 
        #sleep 2
        #@browser.select_list(:id,"opportunity_gurantors").wait_until_present
        @browser.select_list(:id,"opportunity_gurantors").when_present.select statistics.guarantor
        #sleep 2
        @browser.input(:id, "opportunity_gurantors_amount").when_present.send_keys statistics.guarantoramount
        #sleep 2
        @browser.input(:id, "opportunity_tentative_closing_date").when_present.send_keys statistics.tentclosingdate
        #sleep 2
        @browser.input(:id, "opportunity_closing_date").when_present.send_keys statistics.closingdate
        #sleep 2
        @browser.input(:id, "opportunity_funding_date").when_present.send_keys statistics.fundingdate
        #sleep 2
        @browser.input(:id, "opportunity_maturity_date").when_present.send_keys statistics.maturitydate
        #sleep 2
        @browser.input(:id, "opportunity_loan_term").when_present.send_keys statistics.loanterm
    end
        
    def loanquality loan_quality
       ele = @browser.select_list(:id,"opportunity_issuer_rating")
        ele.wait_until_present
        ele.select loan_quality
    end

    def verify_statistic_changes
      sleep 5
       ele = @browser.a(:id, "preliminary_pencil")
       ele.wait_until_present
     if ele.exists?
         return "Statistics details Saved" 
      else
        raise Exception.new "Unable save the changes"
      end
    end

#Edit preliminary###############################################################################################
    def click_preliminary

        ele = @browser.a(:id, "preliminary_pencil")
        ele.wait_until_present
      if ele.exists?
          ele.click
      else
          raise Exception.new "Unable to find edit borrower pencil"
      end 
    end

    def prelimary_values(preliminary)
      @browser.input(:id, "opportunity_occupancy").when_present.send_keys preliminary.occupancy
        #sleep 2
      @browser.select_list(:id,"opportunity_tenant_quality").when_present.select preliminary.tenantquality
       # sleep 2
      @browser.select_list(:id,"opportunity_lease_tenures").when_present.select preliminary.leasetenures
       # sleep 2
      @browser.input(:id, "opportunity_net_operating_income").when_present.send_keys preliminary.netincome
        #sleep 2
      @browser.input(:id, "opportunity_debt_service_coverage").when_present.send_keys preliminary.debtcoverage
       # sleep 2
      @browser.input(:id, "opportunity_collateral_loan_to_value").when_present.send_keys preliminary.collateral
        #sleep 2
      @browser.input(:id, "opportunity_type_of_collateral").when_present.send_keys preliminary.collateral_type
    end

    def verify_prelimary_changes
       @browser.li(:xpath,"//*[@id='div_preliminary']/div/div[1]/ul/li[1]").wait_until_present
       ele = @browser.li(:xpath,"//*[@id='div_preliminary']/div/div[1]/ul/li[1]").text
     if ele.include? "-"
         raise Exception.new "Unable save the changes" 
      else
         return "Preliminary details Saved"
      end
    end

#Upload Documument#############################################################################################
#Upload Document
    def click_document
      ele = @browser.a(:xpath,"//div[1]/div[2]/div[1]/section/ul/li[2]/a")
      ele.wait_until_present
      if ele.exists?
         ele.click
      else
         raise Exception.new "Unable to find Documents tab" 
      end
    end

    def click_newdoc
      ele = @browser.a(:xpath,"//div[2]/div[1]/div[2]/div[2]/div[1]/div[3]/a")
      ele.wait_until_present
      if ele.exists?
         ele.click
      else
         raise Exception.new "Unable to find New Documents tab" 
      end
    end

    def addfile text,dt
      click_document
      click_newdoc
      #path = File.basename("../plist_automation/Documents/cucumber_cheez.pdf")
      path2 = "C:\\Users\\slal\\Documents\\cucumber_cheez.pdf"
      sleep 3
      @browser.input(:xpath, "//form/div[2]/div[1]/div/div/span/input").send_keys path2
      #add_file.send_keys (path2)
      sleep 3
      @browser.span(:xpath, "//*[@id='fileupload']/div[2]/table/tbody/tr/td[4]/span").wait_until_present 5
      ele = @browser.span(:xpath, "//*[@id='fileupload']/div[2]/table/tbody/tr/td[4]/span").text
      @@ele = @browser.td(:xpath,"//*[@id='fileupload']/div[2]/table/tbody/tr/td[1]").text
     if ele.include? "Uploaded"
       p "File Uploaded"
       @browser.input(:id, "document_description").wait_until_present
       desc = @browser.input(:id, "document_description")
       desc.send_keys text
       @browser.input(:id, "document_document_date").send_keys dt
       @browser.select_list(:id, "document_frequency").select "Monthly"
     else
       raise Exception.new "Failed"
      end  
    end

    def click_done
      sleep 2
      ele =  @browser.button(:id, "document-click")
      ele.wait_until_present
      ele.click
      @browser.a(:xpath,"//tr[2]/td[1]/div/ul/li/a").wait_until_present 5
      ele = @browser.a(:xpath,"//tr[2]/td[1]/div/ul/li/a").text
     if ele.include? @@ele
        p "File dispalying as expected"
     else
        raise Exception.new "Failed"
     end
    end

    def publish_opp
      publish_link = @browser.a(:xpath, "//section[@class='actions-b']//div[1]/a")
      publish_link.wait_until_present
      publish_link.click
      #text_open = @browser.li(:xpath, "//section[@id='opportunity_loan_status']/ul/li[2]").text
      if @browser.input(:id,"opportunity_publish_to_all_authorized_users").wait_until_present 
         @browser.input(:id,"opportunity_publish_to_all_authorized_users").click
         @browser.input(:value,"Save and Continue").click
         if @browser.input(:id,"opportunity_agree_to_terms_and_conditions").wait_until_present
            @browser.input(:id,"opportunity_agree_to_terms_and_conditions").click
            @browser.input(:value,"Publish Opportunity").click
          else
            raise Exception.new "No popup displayed"
          end
      else
        raise Exception.new "Select Who Can Participate popup not present"
      end
      ele = @browser.li(:xpath, "//section[@id='opportunity_loan_status']/ul/li[@class='active']")
      ele.wait_until_present
      if ele.exists? #&& text_open.include? "Open"
        p "Published"
      else
        raise Exception.new "Failed"
      end
    end











 end
end












































































































































































