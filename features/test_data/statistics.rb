require 'yaml'

class User
  
  attr_accessor :loantype, :occupancytype, :loansubtype, :industry, :loanrate, :ratetype, :loanamount, :amounttoparticipate, :servicingfee, :initialservicingfee, :loanquality, :craeligible, :guarantor, :guarantoramount, :tentclosingdate, :closingdate, :fundingdate, :maturitydate, :loanterm

  def initialize(loantype,occupancytype,loansubtype,industry,loanrate,ratetype,loanamount,amounttoparticipate,servicingfee,initialservicingfee,loanquality,craeligible,guarantor,guarantoramount,tentclosingdate,closingdate,fundingdate,maturitydate,loanterm)
    @loantype = loantype
    @occupancytype = occupancytype
    @loansubtype = loansubtype
    @industry = industry
    @loanrate = loanrate
    @ratetype = ratetype
    @loanamount = loanamount
    @amounttoparticipate = amounttoparticipate
    @servicingfee = servicingfee
    @initialservicingfee = initialservicingfee
    @loanquality = loanquality
    @craeligible = craeligible
    @guarantor = guarantor
    @guarantoramount = guarantoramount
    @tentclosingdate = tentclosingdate
    @closingdate = closingdate
    @fundingdate = fundingdate
    @maturitydate = maturitydate
    @loanterm = loanterm

  end

  def self.get_default_user
    self.get_user("statistics")
  end

  def self.get_user(user)
    path = File.dirname(__FILE__) + '/../config/create_opp.yaml'
    users = YAML.load_file(path)
    User.new(users[user]["loantype"],users[user]["occupancytype"],users[user]["loansubtype"],users[user]["industry"],users[user]["loanrate"],users[user]["ratetype"],users[user]["loanamount"],users[user]["amounttoparticipate"],users[user]["servicingfee"],users[user]["initialservicingfee"],users[user]["loanquality"],users[user]["craeligible"],users[user]["guarantor"],users[user]["guarantoramount"],users[user]["tentclosingdate"],users[user]["closingdate"],users[user]["fundingdate"],users[user]["maturitydate"],users[user]["loanterm"])
  end
end