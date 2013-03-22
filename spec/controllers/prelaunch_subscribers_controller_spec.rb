require 'spec_helper'

describe PrelaunchSubscribersController do

  describe 'GET new' do
    it "build a new prelaunch_subscriber" do
      get :new
      assigns(:subscriber).should be_a(PrelaunchSubscriber)
      assigns(:subscriber).should be_new_record
    end  
  end

  describe 'POST create' do

    context "with success" do
      let(:params) { { prelaunch_subscriber: { email: 'r2d2@jedis.com' } } }

      it "save a prelaunch subscriber" do
        expect do
          post :create, params
        end.to change(PrelaunchSubscriber, :count).by(1)
      end

      it "redirect to root path" do
        post :create, params
        response.should redirect_to(root_path)
      end

      it "flash success message" do
        post :create, params
        flash[:success].should == I18n.t('subscriber_success_message')
      end
    end

    context "with failiure" do
      let(:params) { { prelaunch_subscriber: { email: 'r2d2@' } } }

      it "not flash success message" do
        post :create, params
        flash[:success].should be_nil
      end

      it "subscriber is invalid" do
        post :create, params
        assigns(:subscriber).should_not be_valid
      end

      it "render action new template" do
        post :create, params
        response.should render_template(:new)
      end
      
    end

  end

end
