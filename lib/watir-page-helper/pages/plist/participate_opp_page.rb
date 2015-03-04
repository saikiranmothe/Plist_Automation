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
           return "search result are displayning as excepted"
       else
           raise Exception.new "search result is not displayning as excepted"
       end
    end
















  end
end
