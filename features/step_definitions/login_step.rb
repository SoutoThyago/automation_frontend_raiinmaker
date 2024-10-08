Given('the user is on the login page') do
    loginPage.clickButtonLogin
end

When('the user enters credentials {string} {string}') do |userLogin, userPassword|
    loginPage.sendEmail(userLogin)
    loginPage.sendPassword(userPassword)
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