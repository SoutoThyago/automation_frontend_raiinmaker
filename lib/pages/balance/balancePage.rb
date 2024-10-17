require_relative '../../../features/page_bases/page_base.rb'

class BalancePage < PageBase

    #elements block begin
                                           
    element :labelFirstCurrentBalanceValue, :xpath, '//div[@class="self-end font-semibold"]//span[@class="text-3xl 2xl:text-2xl dark:text-white"]'
    element :labelLastCurrentBalanceValue,  :xpath, '//div[@class="self-end font-semibold"]//span[@class="-mb-[4px] self-end text-white"]'
    element :buttonRewardsMenu,             :xpath, '//a[@href="/rewards"]'
    element :labelCoiinRewardsAvailable,    :xpath, '//span[@class="text-xl sm:text-3xl md:text-5xl font-semibold text-primary"]'

    #elements block end

    #variables block begin

        @firstCurrentBalanceValue   = ''
        @lastCurrentBalanceValue    = ''
        $aggregateValue             = ''
        $coiinRewardsAvailableValue = ''

    #variables block end

    #methods block begin

    private

    def concatCurrentBalanceValue
        $aggregateValue = (@firstcurrentBalanceValue + @lastCurrentBalanceValue).to_s
    end

    def formatValue(term)
        return term.gsub(/,/,".")
    end
   

    public

    def getValueCurrentBalanceValue
        @firstcurrentBalanceValue = (get_text :labelFirstCurrentBalanceValue).to_s
        @lastCurrentBalanceValue  = (get_text :labelLastCurrentBalanceValue).to_s

        concatCurrentBalanceValue()
    end

    def clickButtonRewardsMenu
        clickIfVisible :buttonRewardsMenu
    end

    def getValueCoiinRewardsAvailable
        $coiinRewardsAvailableValue = (get_text :labelCoiinRewardsAvailable).to_s
    end

    def compareBalance
        $coiinRewardsAvailableValue = formatValue($coiinRewardsAvailableValue)
        $aggregateValue             = formatValue($aggregateValue)        

        return $aggregateValue.eql?($coiinRewardsAvailableValue)
    end

    #methods block end
end