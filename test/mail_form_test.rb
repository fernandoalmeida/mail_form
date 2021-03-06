require 'test_helper'
require 'fixtures/sample_mail'

class MailFormTest < ActiveSupport::TestCase

  def setup
    ActionMailer::Base.deliveries.clear
    @sample = SampleMail.new
    @sample.name = "User"
    @sample.email = "user@example.com"
  end

  test "sample mail has name and email as attributes" do
    assert_equal "User", @sample.name
    assert_equal "user@example.com", @sample.email
  end

  test "sample mail can clear attributes using clear_ prefix" do
    assert_equal "User", @sample.name
    assert_equal "user@example.com", @sample.email
    @sample.clear_name
    @sample.clear_email
    assert_nil @sample.name
    assert_nil @sample.email
  end

  test "sample mail can ask if an attribute is present or not" do
    assert @sample.name?
    assert @sample.email?
    @sample.name = ""
    @sample.email = ""
    assert !@sample.name?
    assert !@sample.email?
  end

  test "delivers an email with attributes" do
    @sample.deliver
    assert_equal 1, ActionMailer::Base.deliveries.size
    
    mail = ActionMailer::Base.deliveries.last
    assert_equal ["user@example.com"], mail.from
    assert_match /Email: user@example\.com/, mail.body.encoded
  end
end
