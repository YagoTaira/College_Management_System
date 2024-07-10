require 'rails_helper'

RSpec.describe EnrollmentsController, type: :controller do
  let(:student) { create(:student) }
  let(:course) { create(:course) }
  
  let(:valid_attributes) {
    { student_id: student.id, course_id: course.id }
  }

  let(:invalid_attributes) {
    { student_id: nil, course_id: nil }
  }

  describe "GET #index" do
    it "returns a success response" do
      create(:enrollment, student: student, course: course)
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
      it "creates a new Enrollment" do
        expect {
          post :create, params: { enrollment: valid_attributes }
        }.to change(Enrollment, :count).by(1)
      end

      it "redirects to the enrollments index" do
        post :create, params: { enrollment: valid_attributes }
        expect(response).to redirect_to(enrollments_url)
      end
    end

    context "with invalid params" do
      it "does not create a new Enrollment" do
        expect {
          post :create, params: { enrollment: invalid_attributes }
        }.to change(Enrollment, :count).by(0)
      end

      it "renders the 'new' template" do
        post :create, params: { enrollment: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      enrollment = create(:enrollment, student: student, course: course)
      get :edit, params: { id: enrollment.to_param }
      expect(response).to be_successful
    end
  end

  describe "PATCH #update" do
    let(:new_student) { create(:student) }
    let(:new_course) { create(:course) }

    context "with valid params" do
      let(:new_attributes) {
        { student_id: new_student.id, course_id: new_course.id }
      }

      it "updates the requested enrollment" do
        enrollment = create(:enrollment, student: student, course: course)
        patch :update, params: { id: enrollment.to_param, enrollment: new_attributes }
        enrollment.reload
        expect(enrollment.student_id).to eq(new_student.id)
        expect(enrollment.course_id).to eq(new_course.id)
      end

      it "redirects to the enrollments index" do
        enrollment = create(:enrollment, student: student, course: course)
        patch :update, params: { id: enrollment.to_param, enrollment: new_attributes }
        expect(response).to redirect_to(enrollments_url)
      end
    end

    context "with invalid params" do
      it "renders the 'edit' template" do
        enrollment = create(:enrollment, student: student, course: course)
        patch :update, params: { id: enrollment.to_param, enrollment: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested enrollment" do
      enrollment = create(:enrollment, student: student, course: course)
      expect {
        delete :destroy, params: { id: enrollment.to_param }
      }.to change(Enrollment, :count).by(-1)
    end

    it "redirects to the enrollments index" do
      enrollment = create(:enrollment, student: student, course: course)
      delete :destroy, params: { id: enrollment.to_param }
      expect(response).to redirect_to(enrollments_url)
    end
  end
end