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
      @browser.a(:xpath, "//div[2]/div[1]/section/div[1]/div[1]/a").click
  		# @browser.input(:id, "invite-non-member").click
      sleep 3
  		@browser.input(:id, "email").send_keys "shimithlal.k@gmail.com" 
  		@browser.input(:value,"Share").when_present.click
      msg = @browser.p(:xpath,"//div[2]/div[1]/div[1]/div/div/p")
      msg.wait_until_present
    if msg.present?
      return "#{msg}"
    else
      raise Exception.new "#{msg} failed"
    end
  end

  def follow_opp
      @browser.a(:xpath,"//div[2]/div[1]/section/div[1]/div[2]/a").wait_until_present
      # follow_text_bef = browser.a(:id,"follow").text
      @browser.a(:xpath,"//div[2]/div[1]/section/div[1]/div[2]/a").click
      # @browser.a(:id,"unfollow").wait_until_present
      # @browser.a(:id,"unfollow").click
      # follow_text_aft = browser.a(:id,"unfollow").text
      # if follow_text_bef == follow_text_aft
      #   raise Exception.new "#{follow_text_bef} is failed"
      # else
      #   return "#{follow_text_bef} is Successful"
      # end
  end

  # def request_loanpkg
  #     @browser.a(:xpath,"//div[2]/div[1]/section/div[1]/div[3]/a").wait_until_present
  #     @bowser.a(:xpath,"//div[2]/div[1]/section/div[1]/div[3]/a").click
  #     if @browser.form(:id,"form_request_loan_doc").wait_until_present
  #        @browser.checkbox(:id,"reservation_agree_to_terms_and_conditions").set
  #        if @browser.checkbox(:id,"reservation_agree_to_terms_and_conditions").set?
  #         @browser.input(:xpath,"//div[2]/form/div[3]/div/input").when_present.click

  #       else
  #         raise "Unable to check the I agree checkbox"
  #       end
  #   end
  
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
          else
          raise "Unable to find participation popup"
      end






















  end
end