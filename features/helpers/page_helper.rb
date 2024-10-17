Dir[File.join(File.dirname(__FILE__), "../../lib/pages/*/*_page.rb")].each { |file| require file }

module PageObjects   

  require_relative '../../lib/pages/customer/loginPage'
  require_relative '../../lib/pages/balance/balancePage'

  def loginPage
    @loginPage ||= LoginPage.new
  end

  def balancePage
    @balancePage = BalancePage.new
  end

end