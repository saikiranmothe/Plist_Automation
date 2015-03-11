# $LOAD_PATH << './lib/watir-page-helper/pages/plist/'
# require 'watir-page-helper'

# module WatirPageHelper::Plist
#   module ParticipateOppPage
#     extend WatirPageHelper::ClassMethods

#     direct_url "st.plist.qwinixtech.com/"


#   def search_opp 
#        @browser.input(:id, "sarch_query_results").wait_until_present
#        @browser.input(:id, "sarch_query_results").send_keys "49-867" #$ele_id
#        search_btn = @browser.button(:type, "submit")
#        search_btn.when_present.click
#        search_result =  @browser.a(:xpath, "//ul[@class='list-unstyled search-result-list']/li/div[2]/a").text
#       if search_result.include? "49-867" #$ele_id 
#          return "search result are displaying as excepted"
#      else
#          raise Exception.new "search result is not displaying as excepted"
#      end
#   end

#     def opp_details
#   		@browser.a(:xpath,"//div[2]/div/ul/li/div[2]/a").when_present.click
#   	    opp_links = @browser.a(:xpath,"//div[2]/div[1]/section/div[*]//a")
#   	    opp_links.text
#   	   if opp_links.exists?
#   	   	return "#{opp_links} is present"
#   	   else
#   	   	raise Exception.new "Unable to find the Opportunity details page"
#   	   end
#     end

#   def share_opp
#       @browser.a(:xpath, "//div[2]/div[1]/section/div[1]/div[1]/a").wait_until_present
#       @browser.a(:xpath, "//div[2]/div[1]/section/div[1]/div[1]/a").click
#   		# @browser.input(:id, "invite-non-member").click
#       sleep 3
#   		@browser.input(:id, "email").send_keys "shimithlal.k@gmail.com" 
#   		@browser.input(:value,"Share").when_present.click
#       msg = @browser.p(:xpath,"//div[2]/div[1]/div[1]/div/div/p")
#       msg.wait_until_present
#     if msg.present?
#       return "#{msg}"
#     else
#       raise Exception.new "#{msg} failed"
#     end
#   end

#   def follow_opp
#       @browser.a(:xpath,"//div[2]/div[1]/section/div[1]/div[2]/a").wait_until_present
#       # follow_text_bef = browser.a(:id,"follow").text
#       @browser.a(:xpath,"//div[2]/div[1]/section/div[1]/div[2]/a").click
#       # @browser.a(:id,"unfollow").wait_until_present
#       # @browser.a(:id,"unfollow").click
#       # follow_text_aft = browser.a(:id,"unfollow").text
#       # if follow_text_bef == follow_text_aft
#       #   raise Exception.new "#{follow_text_bef} is failed"
#       # else
#       #   return "#{follow_text_bef} is Successful"
#       # end
#   end

#   # def request_loanpkg
#   #     @browser.a(:xpath,"//div[2]/div[1]/section/div[1]/div[3]/a").wait_until_present
#   #     @bowser.a(:xpath,"//div[2]/div[1]/section/div[1]/div[3]/a").click
#   #     if @browser.form(:id,"form_request_loan_doc").wait_until_present
#   #        @browser.checkbox(:id,"reservation_agree_to_terms_and_conditions").set
#   #        if @browser.checkbox(:id,"reservation_agree_to_terms_and_conditions").set?
#   #         @browser.input(:xpath,"//div[2]/form/div[3]/div/input").when_present.click

#   #       else
#   #         raise "Unable to check the I agree checkbox"
#   #       end
#   #   end
  
#    def participate_opp
#       @browser.a(:xpath,"//div[2]/div[1]/section/div[2]/div/a[text()='Participate']").wait_until_present
#       @browser.a(:xpath,"//div[2]/div[1]/section/div[2]/div/a[text()='Participate']").click
#       if @browser.form(:id,"form_reservation").wait_until_present
#         #  @browser.input(:id,"reservation_max_reservation_amount").when_present.send_keys "0"
#         #  @browser.checkbox(:id,"reservation_agree_to_terms_and_conditions").set
#         #  @browser.input(:xpath,"//div/div/div[2]/form/div[3]/div/input").click
#         # if @browser.div(:xpath,"//div[2]/form/div[2]/div/div[2]/div/div/div[1]").exists?
#         #    msg = @browser.div(:xpath,"//div[2]/form/div[2]/div/div[2]/div/div/div[1]").text
#         #    p "#{msg}"
#         #    @browser.input(:id,"reservation_max_reservation_amount").when_present.send_keys "80001"
#         #    @browser.input(:xpath,"//div/div/div[2]/form/div[3]/div/input").click
#         # if @browser.div(:xpath,"//div[2]/form/div[2]/div/div[2]/div/div/div[1]").exists?
#         #    msg = @browser.div(:xpath,"//div[2]/form/div[2]/div/div[2]/div/div/div[1]").text
#         #    p "#{msg}"
#            @browser.input(:id,"reservation_max_reservation_amount").when_present.send_keys "8000000"
#            @browser.checkbox(:id,"reservation_agree_to_terms_and_conditions").set
#            @browser.input(:xpath,"//div/div/div[2]/form/div[3]/div/input").click
#           else
#           raise "Unable to find participation popup"
#       end
#     end






















#   end
# end



$LOAD_PATH << './lib/watir-page-helper/pages/plist/'
require 'watir-page-helper'

module WatirPageHelper::Plist
  module ParticipateOppPage
    extend WatirPageHelper::ClassMethods

    direct_url "st.plist.qwinixtech.com/"


  def search_opp 
       @browser.input(:id, "sarch_query_results").wait_until_present
       @browser.input(:id, "sarch_query_results").send_keys $ele_id
       search_btn = @browser.button(:type, "submit")
       search_btn.when_present.click
       search_result =  @browser.a(:xpath, "//ul[@class='list-unstyled search-result-list']/li/div[2]/a").text
      if search_result.include? $ele_id 
         return "search result are displaying as excepted"
     else
         raise Exception.new "search result is not displaying as excepted"
     end
  end

    def opp_details
    @browser.a(:xpath,"//div[2]/div/ul/li/div[2]/a").when_present.click
       opp_links = @browser.a(:xpath,"//div[2]/div[1]/section/div[*]//a")
       opp_links.text
      if opp_links.exists?
       return "#{opp_links} is present"
      else
       raise Exception.new "Unable to find the Opportunity details page"
      end
    end

  def share_opp
      @browser.a(:xpath, "//div[2]/div[1]/section/div[1]/div[1]/a").wait_until_present
      @browser.a(:id, "invite-non-member").click
    sleep 3
    @browser.input(:name,"email").send_keys "shimithlal.k@gmail.com" 
    @browser.input(:value,"Share").when_present.click
      msg = @browser.p(:xpath,"//div[2]/div[1]/div[1]/div/div/p")
      msg.wait_until_present
    if msg.exists?
      return "#{msg}"
    else
      raise Exception.new "#{msg} failed"
    end
  end

  def follow_opp
      @browser.a(:xpath,"//div[2]/div[1]/section/div[1]/div[2]/a").wait_until_present
      follow_text_bef = @browser.a(:id,"follow").text
      @browser.a(:id,"follow").click
      @browser.a(:id,"unfollow").wait_until_present
      follow_text_aft = browser.a(:id,"unfollow").text
      if follow_text_bef == follow_text_aft
        raise Exception.new "#{follow_text_bef} is failed"
      else
        return "#{follow_text_bef} is Successful"
      end
  end

  def request_loanpkg
      @browser.a(:xpath,"//div[2]/div[1]/section/div[1]/div[3]/a").wait_until_present
      @browser.a(:xpath,"//div[2]/div[1]/section/div[1]/div[3]/a").click
      if @browser.form(:id,"form_request_loan_doc").wait_until_present
         @browser.checkbox(:id,"reservation_agree_to_terms_and_conditions").set
         if @browser.checkbox(:id,"reservation_agree_to_terms_and_conditions").set?
            @browser.input(:xpath,"//div[2]/form/div[3]/div/input").when_present.click
          else
          raise "Unable to check the I agree checkbox"
        end
      else
        raise "Form is not present"
      end
  end

  def verify_req
     doc_ele = @browser.a(:xpath,"//div[1]/section/ul/li[2]/a[text()='Documents']")
     doc_ele.wait_until_present
     doc_ele.text 
    if doc_ele.exists?
      return "#{doc_ele} tab is Present"
       @browser.a(:xpath,"//tr[2]/td[1]/div/ul/li/a").wait_until_present 
       reg_file = @browser.a(:xpath,"//tr[2]/td[1]/div/ul/li/a").text
      if reg_file.include? $ele_file
        return "#{reg_file} is displaying as excepted"
      else
        raise "#{reg_file} is not displaying as excepted"
      end
    else
      raise "#{doc_ele} tab is Present"
    end
  end  
  
    def participate_opp
      @browser.a(:xpath,"//div[2]/div[1]/section/div[2]/div/a[text()='Participate']").wait_until_present
      @browser.a(:xpath,"//div[2]/div[1]/section/div[2]/div/a[text()='Participate']").click
      if @browser.form(:id,"form_reservation").wait_until_present
        #  @browser.input(:id,"reservation_max_reservation_amount").when_present.send_keys "0"
        #  @browser.checkbox(:id,"reservation_agree_to_terms_and_conditions").set
        #  @browser.input(:xpath,"//div/div/div[2]/form/div[3]/div/input").click
        # if @browser.div(:xpath,"//div[2]/form/div[2]/div/div[2]/div/div/div[1]").exists?
        #    msg = @browser.div(:xpath,"//div[2]/form/div[2]/div/div[2]/div/div/div[1]").text
        #    p "#{msg}"
        #    @browser.input(:id,"reservation_max_reservation_amount").when_present.send_keys "80001"
        #    @browser.input(:xpath,"//div/div/div[2]/form/div[3]/div/input").click
        # if @browser.div(:xpath,"//div[2]/form/div[2]/div/div[2]/div/div/div[1]").exists?
        #    msg = @browser.div(:xpath,"//div[2]/form/div[2]/div/div[2]/div/div/div[1]").text
        #    p "#{msg}"
           @browser.input(:id,"reservation_max_reservation_amount").when_present.send_keys "8000000"
           @browser.checkbox(:id,"reservation_agree_to_terms_and_conditions").set
           @browser.input(:xpath,"//div/div/div[2]/form/div[3]/div/input").click
           sleep 3
          else
          raise "Unable to find participation popup"
      end
    end
   
####################################################################################################

def manage_participants
    ele = @browser.a(:xpath,"//div[1]/section/ul/li[3]/a[text()='Manage Participants']")
    ele.wait_until_present
    if ele.exists?
      ele.click
      @browser.a(:xpath,"//div[2]/div/table[1]/tbody/tr[1]/td[5]/a").when_present.click
      @browser.select_list(:id,"select_status").when_present.select "Accepted"
      sleep 3
      @browser.button(:xpath,"//div[2]/div/table[1]/tbody/tr[1]/td/form/div[2]/div[5]/button").when_present.click
      sleep 3
      txt = @browser.span(:xpath,".//*[@id='form_reservation_381']/td[4]/span").text
      begin_btn = @browser.a(:xpath,"//div[2]/div[2]/div[1]/section/div[2]/div/a[text()='Begin Closing']")
    if txt.include? "Accepted" && begin_btn.exists?
      return "#{txt}"
      begin_btn.when_present.click
      popup = @browser.h4(:xpath,"//div[2]/div[3]/div/div/div[1]/h4")
      popup.wait_until_present
      popup.text
      return "#{popup}"
      @browser.button(:xpath,"//div[2]/div[2]/a[text()='Confirm']").when_present.click
    else
       raise "Confirm popup is not present"
     end
     if @browser.a(:xpath,"//div[2]/div/table[1]/tbody/tr[1]/td[5]/a[text()='Sign']").wait_until_present
        @browser.a(:xpath,"//div[2]/div/table[1]/tbody/tr[1]/td[5]/a[text()='Sign']").click
        @browser.input(:id,"issuer_name").when_present.send_keys "Test Issuer"
        @browser.input(:value,"Sign Agreement").wait_until_present
        @browser.input(:value,"Sign Agreement").click
       return "Originator Sign agreement is Successful"
     else
       raise "Sign Agreement is not Successful"
      end
    else
      raise "Manage Participants is not functional"
    end
  end




















  end
end