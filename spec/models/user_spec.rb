require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user_attributes) do # This User is valid.
    {
      username: "lorem.ipsum",
      first_name: "Lorem",
      last_name: "Ipsum",
      email: "dolorsitamet@gmail.com",
      password: "reallybadpassword"
    }
  end

  let(:missing_first_and_last_name) do # And this User is valid.
    valid_user_attributes.except(:first_name, :last_name)
  end

  it "has a username, email, first_name, and last_name" do
    user = User.new(valid_user_attributes)
    expect(user.username).to eq("lorem.ipsum")
    expect(user.email).to eq("dolorsitamet@gmail.com")
    expect(user.first_name).to eq("Lorem")
    expect(user.last_name).to eq("Ipsum")
  end

  it "is valid" do
    expect(User.new(valid_user_attributes)).to be_valid
  end

  it "can be saved if it is valid" do
    user = User.create(valid_user_attributes)
    expect(user.id).to_not be_nil
    expect(User.last).to eq(user)
  end

  it "is valid without a first name and last name" do
    expect(User.new(missing_first_and_last_name)).to be_valid
  end

  it "is invalid without a username, email, or password" do
    invalid_user = User.new

    expect(invalid_user).to_not be_valid
    expect(invalid_user.errors.full_messages).to include(
      "Username can't be blank",
      "Email can't be blank",
      "Password can't be blank"
    )
  end

  it "is invalid without a unique email or username" do
    User.create(valid_user_attributes)
    same_user = User.create(valid_user_attributes)

    expect(same_user).to_not be_valid
    expect(same_user.errors.full_messages).to include(
      "Username has already been taken",
      "Email has already been taken"
    )
  end

end