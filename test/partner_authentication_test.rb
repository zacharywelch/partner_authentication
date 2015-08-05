require 'test_helper'

class PartnerAuthenticationTest < ActionController::TestCase
  tests DummiesController
  
  setup do
    ApiKey.delete_all
    AuthorizedIp.delete_all
    key = ApiKey.create key: 'foo', token: 'bar'
    key.authorized_ips.create ip_address: "127.0.0.1"    
    @request.stubs(:remote_ip).returns("127.0.0.1")
  end

  teardown do
    ApiKey.delete_all
    AuthorizedIp.delete_all
  end
  
  def json
    JSON.parse(response.body)
  end

  test "valid authorization" do
    @request.headers['Authorization'] = "Partner foo:bar"
    get :index, format: :json

    assert_response :success
  end

  test "invalid authorization" do
    @request.headers['Authorization'] = "Partner foo:baz"
    get :index, format: :json

    assert_response :unauthorized
  end

  test "missing authorization" do
    get :index, format: :json

    assert_response :unauthorized
  end
end
