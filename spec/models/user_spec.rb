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

  #----- Other valid Users ----------------
  let(:missing_first_name) do
    valid_user_attributes.except(:first_name)
  end
  
  let(:missing_last_name) do
    valid_user_attributes.except(:last_name)
  end

  let(:missing_first_and_last_name) do
    valid_user_attributes.except(:first_name, :last_name)
  end
  #----- End of other valid Users ----------

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

  it "is invalid without a unique email" do
    User.create(valid_user_attributes)
    same_user = User.create(valid_user_attributes)

    expect(same_user).to_not be_valid
    expect(same_user.errors.full_messages).to include(
      "Email has already been taken"
    )
  end

  it "has a full_name if first and last names are present" do
    user = User.new(valid_user_attributes)
    expect(user.full_name).to eq("Lorem Ipsum")
  end

  it "does not have a full_name if first_name or last_name is absent" do
    users_with_missing_names = [
      missing_first_name, 
      missing_last_name, 
      missing_first_and_last_name
    ]

    users_with_missing_names.each do |user_attributes|
      user = User.new(user_attributes)
      expect(user.full_name).to be_nil
    end
  end

  context "from OmniAuth" do
    let(:fb_omniauth_info) do
      {"email" => "st.nick@northpole.org", "name" => "Santa Claus"}
    end

    it "can initialize a User from an OmniAuth-Facebook hash" do
      user = User.from_fb_omniauth(fb_omniauth_info)
  
      expect(user.email).to eq(fb_omniauth_info["email"])
      expect(user.full_name).to eq(fb_omniauth_info["name"])
      expect(user.first_name).to eq("Santa")
      expect(user.last_name).to eq("Claus")
      expect(user.username).to eq("santa.claus")
      expect(user.password).to be_present
    end

    it "can find an existing User from an OmniAuth-Facebook hash" do
      user1 = User.from_fb_omniauth(fb_omniauth_info)
      user1.save
      user2 = User.from_fb_omniauth(fb_omniauth_info)
      
      # user2 should be the same as user1 despite not being saved to the DB.
      expect(user2).to eq(user1)
    end
  end
  
end