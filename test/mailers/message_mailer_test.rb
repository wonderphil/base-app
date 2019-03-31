require 'test_helper'

class MessageMailerTest < ActionMailer::TestCase

  test "contact" do
    message = Message.new name: 'anna',
                          email: 'anna@example.org',
                          phone: '012334567',
                          body: 'hello, how are you doing?'

    email = MessageMailer.contact(message)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal 'Message from base app', email.subject
    assert_equal ['stephen@example.org'], email.to
    assert_equal ['anna@example.org'], email.from
    assert_match /hello, how are you doing?/, email.body.encoded
  end
end