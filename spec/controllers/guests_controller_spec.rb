require 'spec_helper'

describe GuestsController do

  def mock_person(stubs={})
    @mock_person ||= mock_model(Guest, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all people as @people" do
      Guest.stub(:all) { [mock_person] }
      get :index
      assigns(:guests).should eq([mock_person])
    end
  end

  describe "GET show" do
    it "assigns the requested person as @person" do
      Guest.stub(:find).with("37") { mock_person }
      get :show, :id => "37"
      assigns(:guest).should be(mock_person)
    end
  end

  describe "GET new" do
    it "assigns a new person as @person" do
      Guest.stub(:new) { mock_person }
      get :new
      assigns(:guest).should be(mock_person)
    end
  end

  describe "GET edit" do
    it "assigns the requested person as @person" do
      Guest.stub(:find).with("37") { mock_person }
      get :edit, :id => "37"
      assigns(:guest).should be(mock_person)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created person as @person" do
        Guest.stub(:new).with({'these' => 'params'}) { mock_person(:save => true) }
        post :create, :guest => {'these' => 'params'}
        assigns(:guest).should be(mock_person)
      end

      it "redirects to the created person" do
        Guest.stub(:new) { mock_person(:save => true) }
        post :create, :guest => {}
        response.should redirect_to(guest_url(mock_person))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved person as @person" do
        Guest.stub(:new).with({'these' => 'params'}) { mock_person(:save => false) }
        post :create, :guest => {'these' => 'params'}
        assigns(:guest).should be(mock_person)
      end

      it "re-renders the 'new' template" do
        Guest.stub(:new) { mock_person(:save => false) }
        post :create, :guest => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested person" do
        Guest.should_receive(:find).with("37") { mock_person }
        mock_person.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :guest => {'these' => 'params'}
      end

      it "assigns the requested person as @person" do
        Guest.stub(:find) { mock_person(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:guest).should be(mock_person)
      end

      it "redirects to the person" do
        Guest.stub(:find) { mock_person(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(guest_url(mock_person))
      end
    end

    describe "with invalid params" do
      it "assigns the person as @person" do
        Guest.stub(:find) { mock_person(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:guest).should be(mock_person)
      end

      it "re-renders the 'edit' template" do
        Guest.stub(:find) { mock_person(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested person" do
      Guest.should_receive(:find).with("37") { mock_person }
      mock_person.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the people list" do
      Guest.stub(:find) { mock_person }
      delete :destroy, :id => "1"
      response.should redirect_to(guests_url)
    end
  end

end