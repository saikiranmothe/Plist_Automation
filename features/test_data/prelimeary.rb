require 'yaml'

class Prelimary_data
  
  attr_accessor :occupancy, :tenantquality, :leasetenures, :netincome, :debtcoverage, :collateral, :collateral_type

  def initialize(occupancy,tenantquality,leasetenures,netincome,debtcoverage,collateral,collateral_type)
    @occupancy = occupancy
    @tenantquality = tenantquality
    @leasetenures = leasetenures
    @netincome = netincome
    @debtcoverage = debtcoverage
    @collateral = collateral
    @collateral_type = collateral_type
  end

  def self.get_default_user
    self.get_user("preliminary")
  end

  def self.get_user(user)
    path =File.dirname(__FILE__) + '/../config/create_opp.yaml'
    users = YAML.load_file(path)
    Prelimary_data.new(users[user]["occupancy"],users[user]["tenantquality"],users[user]["leasetenures"],users[user]["netincome"],users[user]["debtcoverage"],users[user]["collateral"],users[user]["collateral_type"])
  end
end