require 'rails_helper'

RSpec.describe GradesController, type: :controller do
  # Create test data using FactoryBot
  let(:student) { create(:student) }
  let(:course) { create(:course) }
  let(:enrollment) { create(:enrollment, student: student, course: course) }
  let(:grade) { create(:grade, enrollment: enrollment, score: 70)}

  # Define valid and invalid attributes for testing
  let(:valid_attributes) {
    { enrollment_id: enrollment.id, score: 70 }
  }
  let(:invalid_attributes) {
    { enrollment_id: nil, score: nil }
  }

  # Test GET #index action
  describe "GET #index" do
    it "returns a success response" do
      grade
      get :index
      expect(response).to be_successful
    end
  end

  # Test GET #new action
  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  # Test POST #create action
  describe "POST #create" do
    context "with valid params" do
      it "creates a new Grade" do
        expect {
          post :create, params: { grade: valid_attributes }
        }.to change(Grade, :count).by(1)
      end

      it "redirects to the grades index" do
        post :create, params: { grade: valid_attributes }
        expect(response).to redirect_to(grades_url)
      end
    end

    context "with invalid params" do
      it "does not create a new Grade" do
        expect {
          post :create, params: { grade: invalid_attributes }
        }.to change(Grade, :count).by(0)
      end

      it "renders the 'new' template" do
        post :create, params: { grade: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  # Test GET #edit action
  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: grade.to_param }
      expect(response).to be_successful
    end
  end

  # Test PATCH #update action
  describe "PATCH #update" do
    context "with valid params" do
      let(:new_attributes) {
        { score: 90 }
      }

      it "updates the requested grade" do
        patch :update, params: { id: grade.to_param, grade: new_attributes }
        grade.reload
        expect(grade.score).to eq(90)
      end

      it "redirects to the grade index" do
        patch :update, params: { id: grade.to_param, grade: new_attributes }
        expect(response).to redirect_to(grades_url)
      end
    end

    context "with invalid params" do
      it "renders the 'edit' template" do
        patch :update, params: { id: grade.to_param, grade: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  # Test DELETE #destroy action
  describe "DELETE #destroy" do
    it "destroys the requested grade" do
      grade
      expect {
        delete :destroy, params: { id: grade.to_param }
      }.to change(Grade, :count).by(-1)
    end

    it "redirects to the grades index" do
      delete :destroy, params: { id: grade.to_param }
      expect(response).to redirect_to(grades_url)
    end
  end
end