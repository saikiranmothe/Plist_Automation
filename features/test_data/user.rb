require 'yaml'

class User
  
  attr_accessor :name, :email, :username, :password, :ph_no, :city, :state, :title

  def initialize(name,email,username,password,ph_no,city,state,title)
    @name = name
    @email = email
    @username = username
    @password = password
    @ph_no = ph_no
    @city = city
    @state = state
    @title = title
  end

  def self.get_default_user
    self.get_user("default")
  end

  def self.get_user(user)
    path =File.dirname(__FILE__) + '/../config/user_data.yaml'
    users = YAML.load_file(path)
    User.new(users[user]["name"],users[user]["email"],users[user]["username"],users[user]["password"],users[user]["ph_no"],users[user]["city"],users[user]["state"],users[user]["title"])
  end
end
