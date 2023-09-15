require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "ユーザ名が空欄でないこと" do
    user = User.new(name: "")
    assert_not user.valid?
  end

  test "ユーザ名が2文字以上であること" do
    user = User.new(name: "A")
    assert_not user.valid?
  end

  test "ユーザ名が20文字以下であること" do
    user = User.new(name: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    assert_not user.valid?
  end

  test "ユーザ名が一意性があること" do
    existing_user = users(:one)  # 既存のユーザを取得する例
    user = User.new(name: existing_user.name)
    assert_not user.valid?
  end

  test "自己紹介が50文字以下であること" do
    user = User.new(introduction: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
    assert_not user.valid?
  end
end
