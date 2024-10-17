And('the current balance is visible in Dashboard') do
    balancePage.getValueCurrentBalanceValue
end

And('the user click in Rewards Menu') do 
    balancePage.clickButtonRewardsMenu
end

And('the the Coiin Rewards Available is visible') do
    balancePage.getValueCoiinRewardsAvailable
end

Then('the current balance & Coiin Rewards Available are equals') do
    expect(balancePage.compareBalance).to eq true
end