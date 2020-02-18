require 'rails_helper'

describe User do
  let(:valid_user_attributes) do
    {
      username: "lorem.ipsum",
      first_name: "Lorem",
      last_name: "Ipsum",
      email: "dolorsitamet@gmail.com",
      password: "reallybadpassword"
    }
  end

  it "recognizes a valid new user" do
    expect(User.new(valid_user_attributes)).to be_valid
  end

  it "saves a valid new user" do
    user = User.create(valid_user_attributes)
    expect(user.id).to_not be_nil
    expect(User.last).to eq(user)
  end

end