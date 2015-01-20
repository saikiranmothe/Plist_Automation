require 'watir-page-helper'

module WatirPageHelper::Plist
  module EditUserDetailsPage
    extend WatirPageHelper::ClassMethods


def click_edit_button
      ele = @browser.a(:xpath, "//div[1]/div[1]/section/a")
      ele.wait_until_present
      if ele.exists?
        ele.click
        return "Edit button is present"
      else
        raise Exception.new "Edit Profile button not available"
    end
  end

def verify_authorization_bef
  sleep 2
    @browser.input(:xpath, "//form/div[2]/div[2]/div/label/input[@disabled='disabled']")
  end

def click_checkbox
      ele = @browser.input(:id, "authorized")
      ele.wait_until_present
      if ele.exists?
        ele.click
        return "checkbox is present"
      else
        raise Exception.new "Chekbox is not available"
    end
  end

  def click_save_profile
      ele = @browser.input(:xpath, "//section/div[2]/form/div[3]/input")
      ele.wait_until_present
      if ele.exists?
        ele.click
        return "Save profile button is present"
      else
        raise Exception.new "Save Profile button not available"
    end
  end




























































































end
end