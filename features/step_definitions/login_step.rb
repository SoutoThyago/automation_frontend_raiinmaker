Given('the user is on the login page') do
    loginPage.clickButtonLogin
end

When('the user enters credentials') do 
    loginPage.sendEmail
    loginPage.sendPassword('true')
end

When('the user enters wrong credentials') do
    loginPage.sendEmail
    loginPage.sendPassword('false')
end

And('the user submits the login form') do
    loginPage.clickButtonDoLogin
end

Then('an Loged message should be displayed') do
    expect(loginPage.userLogged?).to eq true
end

Then('an error message should be displayed') do
    expect(loginPage.notUserLogged?).to eq true
end