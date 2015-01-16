require 'yaml'

class Linkedin
  
  attr_accessor :linkedin_email, :password, :phone, :city, :state, :title

  def initialize(linkedin_email,password,phone,city,state,title)
    @linkedin_email = linkedin_email
    @password = password
    @phone = phone
    @city = city
    @state = state
    @title = title
  end

  def self.get_default_user
    self.get_user("linked_in_user:")
  end

  def self.get_user(user)
    path =File.dirname(__FILE__) + '/../config/user_data.yaml'
    users = YAML.load_file(path)
    Linkedin.new(users[user]["linkedin_email"],users[user]["password"],users[user]["phone"],users[user]["city"],users[user]["state"],users[user]["title"])
  end
end
