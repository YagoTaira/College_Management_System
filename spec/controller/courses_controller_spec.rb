require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:course)
  }

  let(:invalid_attributes) {
    { title: nil, description: nil }
  }

  describe "GET #index" do
    it "returns a success response" do
      create(:course)
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
      it "creates a new Course" do
        expect {
          post :create, params: { course: valid_attributes }
        }.to change(Course, :count).by(1)
      end

      it "redirects to the created course" do
        post :create, params: { course: valid_attributes }
        expect(response).to redirect_to(courses_url)
      end
    end

    context "with invalid params" do
      it "does not create a new Course" do
        expect {
          post :create, params: { course: invalid_attributes }
        }.to change(Course, :count).by(0)
      end

      it "renders the 'new' template" do
        post :create, params: { course: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      course = create(:course)
      get :edit, params: { id: course.to_param }
      expect(response).to be_successful
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      let(:new_attributes) {
        { title: "New Title", description: "New Description" }
      }

      it "updates the requested course" do
        course = create(:course)
        patch :update, params: { id: course.to_param, course: new_attributes }
        course.reload
        expect(course.title).to eq("New Title")
        expect(course.description).to eq("New Description")
      end

      it "redirects to the course" do
        course = create(:course)
        patch :update, params: { id: course.to_param, course: new_attributes }
        expect(response).to redirect_to(courses_url)
      end
    end

    context "with invalid params" do
      it "renders the 'edit' template" do
        course = create(:course)
        patch :update, params: { id: course.to_param, course: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested course" do
      course = create(:course)
      expect {
        delete :destroy, params: { id: course.to_param }
      }.to change(Course, :count).by(-1)
    end

    it "redirects to the courses list" do
      course = create(:course)
      delete :destroy, params: { id: course.to_param }
      expect(response).to redirect_to(courses_url)
    end
  end
end