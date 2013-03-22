require 'spec_helper'

describe PrelaunchSubscriber do
  it "is invalid if email is empty" do
    subscriber = PrelaunchSubscriber.new
    expect(subscriber.valid?).to be_false
  end
  it "is invalid if has a invalid email" do
    subscriber = PrelaunchSubscriber.new(email: 'fulano@invalidemail')
    expect(subscriber.valid?).to be_false
  end
  it "is valid if has a valid email" do
    subscriber = PrelaunchSubscriber.new(email: 'fulano@email.com')
    expect(subscriber.valid?).to be_true
  end
  it "email must be unique" do
    PrelaunchSubscriber.create(email: 'fulano@email.com')
    new_subscriber = PrelaunchSubscriber.create(email: 'fulano@email.com')
    new_subscriber.should be_invalid 
  end
end
