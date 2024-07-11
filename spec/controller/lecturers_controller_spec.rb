require 'rails_helper'

RSpec.describe LecturersController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:lecturer)
  }

  let(:invalid_attributes) {
    { name: nil, email: nil }
  }

  describe "GET #index" do
    it "returns a success response" do
      create(:lecturer)
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Lecturer" do
        expect {
          post :create, params: { lecturer: valid_attributes }
        }.to change(Lecturer, :count).by(1)
      end

      it "redirects to the created lecturer" do
        post :create, params: { lecturer: valid_attributes }
        expect(response).to redirect_to(lecturers_url)
      end
    end

    context "with invalid params" do
      it "does not create a new Lecturer" do
        expect {
          post :create, params: { lecturer: invalid_attributes }
        }.to change(Lecturer, :count).by(0)
      end

      it "renders the 'new' template" do
        post :create, params: { lecturer: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      lecturer = create(:lecturer)
      get :edit, params: { id: lecturer.to_param }
      expect(response).to be_successful
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "New Name", email: "newname@email.com" }
      }

      it "updates the requested lecturer" do
        lecturer = create(:lecturer)
        patch :update, params: { id: lecturer.to_param, lecturer: new_attributes }
        lecturer.reload
        expect(lecturer.name).to eq("New Name")
        expect(lecturer.email).to eq("newname@email.com")
      end

      it "redirects to the lecturer" do
        lecturer = create(:lecturer)
        patch :update, params: { id: lecturer.to_param, lecturer: new_attributes }
        expect(response).to redirect_to(lecturers_url)
      end
    end

    context "with invalid params" do
      it "renders the 'edit' template" do
        lecturer = create(:lecturer)
        patch :update, params: { id: lecturer.to_param, lecturer: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested lecturer" do
      lecturer = create(:lecturer)
      expect {
        delete :destroy, params: { id: lecturer.to_param }
      }.to change(Lecturer, :count).by(-1)
    end

    it "redirects to the lecturers list" do
      lecturer = create(:lecturer)
      delete :destroy, params: { id: lecturer.to_param }
      expect(response).to redirect_to(lecturers_url)
    end
  end
end