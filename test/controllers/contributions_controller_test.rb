require 'test_helper'

class ContributionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contributions_index_url
    assert_response :success
  end

  test "create contribution" do
    login_as(:valid_user)
    assert_difference "Contribution.count" do
      post contributions_path, params: { contribution: {
        title: "Very cool contribution",
        description: "Something about a vaguely interesting topic",
        contribution_type: 'contribution'
      }}
      assert_redirected_to contributions_path
    end
  end

  test "edit contribution" do
    login_as(:valid_user)
    get edit_contribution_path(contributions(:one).to_param)
    assert_response :success
  end

  test "edit contribution of wrong user" do
    login_as(:valid_user)
    assert_raises ActiveRecord::RecordNotFound do
      get edit_contribution_path(contributions(:two).to_param)
    end
  end

  test "edit contribution when not logged in" do
    get edit_contribution_path(contributions(:two).to_param)
    assert_redirected_to root_url
  end

  test "update contribution" do
    login_as(:valid_user)
    patch contribution_path(contributions(:one).to_param), params: { contribution: {
      title: "Very cool contribution",
      description: "Something about a vaguely interesting topic",
    }}
    assert_redirected_to contributions_path
    assert_equal 'Very cool contribution', contributions(:one).reload.title
  end

  test "vote for contribution" do
    login_as(:valid_user)
    assert_difference("Vote.count") do
      patch toggle_vote_contribution_path(contributions(:one))
    end
  end

  test "unvote for contribution" do
    login_as(:valid_user)
    contributions(:one).voters << users(:valid_user)
    assert_difference("Vote.count", -1) do
      patch toggle_vote_contribution_path(contributions(:one))
    end
  end

end
