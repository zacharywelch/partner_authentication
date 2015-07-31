require 'test_helper'

class AuthorizedIpTest < ActiveSupport::TestCase
  fixtures :authorized_ips

  test "responds to attributes" do
    ip = AuthorizedIp.new
    assert_respond_to ip, :ip_address
    assert_respond_to ip, :api_key
    assert_respond_to ip, :pattern
  end

  test "pattern returns ip as regular expression" do
    ip = authorized_ips(:one)
    assert_equal ip.pattern, /127\.0\.0\.1/
  end

  test "pattern replaces wildcards with regular expression" do
    ip = authorized_ips(:ip_with_range)
    assert_equal ip.pattern, /127\.\d{1,3}\.0\.\d{1,3}/
  end
end
