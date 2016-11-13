require "rails_helper"

RSpec.describe AuthenticationController, type: :controller do
  let(:user) { create(:user) }
  let(:headers) { valid_headers }
  let(:params) do
    {
      email: user.email,
      password: user.password
    }
  end
  describe "POST #login" do
    let!(:req) { post "/auth/login", params: params }

    context "when a user logs in" do
      it_behaves_like "a http response", 201, "Logged in successfully"

      it "returns an authentication token" do
        expect(json["auth_token"]).not_to be_nil
      end
    end

    context "when a user logs in with invalid parameters" do
      let(:params) { attributes_for(:user) }

      it_behaves_like "a http response", 401, "Invalid credentials"
    end
  end
end
