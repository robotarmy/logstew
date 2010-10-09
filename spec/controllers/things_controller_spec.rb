require 'spec_helper'

describe ThingsController do

  def mock_thing(stubs={})
    @mock_thing ||= mock_model(Thing, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all things as @things" do
      Thing.stub(:all) { [mock_thing] }
      get :index
      assigns(:things).should eq([mock_thing])
    end
  end

  describe "GET show" do
    it "assigns the requested thing as @thing" do
      Thing.stub(:find).with("37") { mock_thing }
      get :show, :id => "37"
      assigns(:thing).should be(mock_thing)
    end
  end

  describe "GET new" do
    it "assigns a new thing as @thing" do
      Thing.stub(:new) { mock_thing }
      get :new
      assigns(:thing).should be(mock_thing)
    end
  end

  describe "GET edit" do
    it "assigns the requested thing as @thing" do
      Thing.stub(:find).with("37") { mock_thing }
      get :edit, :id => "37"
      assigns(:thing).should be(mock_thing)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created thing as @thing" do
        Thing.stub(:new).with({'these' => 'params'}) { mock_thing(:save => true) }
        post :create, :thing => {'these' => 'params'}
        assigns(:thing).should be(mock_thing)
      end

      it "redirects to the created thing" do
        Thing.stub(:new) { mock_thing(:save => true) }
        post :create, :thing => {}
        response.should redirect_to(thing_url(mock_thing))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved thing as @thing" do
        Thing.stub(:new).with({'these' => 'params'}) { mock_thing(:save => false) }
        post :create, :thing => {'these' => 'params'}
        assigns(:thing).should be(mock_thing)
      end

      it "re-renders the 'new' template" do
        Thing.stub(:new) { mock_thing(:save => false) }
        post :create, :thing => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested thing" do
        Thing.should_receive(:find).with("37") { mock_thing }
        mock_thing.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :thing => {'these' => 'params'}
      end

      it "assigns the requested thing as @thing" do
        Thing.stub(:find) { mock_thing(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:thing).should be(mock_thing)
      end

      it "redirects to the thing" do
        Thing.stub(:find) { mock_thing(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(thing_url(mock_thing))
      end
    end

    describe "with invalid params" do
      it "assigns the thing as @thing" do
        Thing.stub(:find) { mock_thing(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:thing).should be(mock_thing)
      end

      it "re-renders the 'edit' template" do
        Thing.stub(:find) { mock_thing(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested thing" do
      Thing.should_receive(:find).with("37") { mock_thing }
      mock_thing.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the things list" do
      Thing.stub(:find) { mock_thing }
      delete :destroy, :id => "1"
      response.should redirect_to(things_url)
    end
  end

end
