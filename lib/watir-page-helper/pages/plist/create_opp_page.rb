$LOAD_PATH << './lib/watir-page-helper/pages/plist/'
require 'watir-page-helper'

module WatirPageHelper::Plist
  module CreateOppPage
    extend WatirPageHelper::ClassMethods

    direct_url "st.plist.qwinixtech.com/"

    def learner_uploads_document doc_URL , doc_name
      @@file_name = "#{doc_name}"
      @browser.execute_script("$(arguments[0]).show();", @@upload_document = @browser.file_field(:id, "files"))
      @@upload_document.set doc_URL
      #@browser.text_field(:placeholder,"Title").set @@file_name
      sleep 5
      @browser.text_field(:placeholder,"Title").send_keys @@file_name
      puts("set file name as "+ @@file_name)
      sleep 10
      # puts("waited for 5 secs before uploading file " + @@file_name)
      @browser.button(:text,"Upload").click
      wait_for_doc_upload_dialog
      wait_for_upload_to_complete
      @browser.button(:text,"Done").click
      wait_for_upload_document_window_close
      sleep 10
    end

    def verify_learner_uploaded_document
      wait_for_my_files_page_load
      wait_for_document_list_refresh
      sleep 30
      @browser.text_field(:id,"documentCatalogSearchBox").set @@file_name
      @browser.send_keys :enter
      wait_for_document_list_refresh
      sleep 10
      @browser.a(:text, "#{@@file_name}").exists?
    end
