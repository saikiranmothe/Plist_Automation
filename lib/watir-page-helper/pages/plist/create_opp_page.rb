$LOAD_PATH << './lib/watir-page-helper/pages/plist/'
require 'watir-page-helper'

module WatirPageHelper::Plist
  module CreateOppPage
    extend WatirPageHelper::ClassMethods

    direct_url "st.plist.qwinixtech.com/"

   