require 'rails_helper'

RSpec.describe AttendancesController, type: :controller do
  let(:student) { create(:student) }
  let(:course) { create(:course) }
  let(:enrollment) { create(:enrollment, student: student, course: course) }
  let(:attendance) { create(:attendance, enrollment: enrollment, date: Date.new(2024, 7, 11), status: "Present")}
  
  let(:valid_attributes) {
    { enrollment_id: enrollment.id, date: Date.new(2024, 7, 11), status: "Present" }
  }

  let(:invalid_attributes) {
    { enrollment_id: nil, date: nil, status: nil }
  }

  describe "GET #index" do
    it "returns a success response" do
      attendance
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
      it "creates a new Attendance" do
        expect {
          post :create, params: { attendance: valid_attributes }
        }.to change(Attendance, :count).by(1)
      end

      it "redirects to the attendances index" do
        post :create, params: { attendance: valid_attributes }
        expect(response).to redirect_to(attendances_url)
      end
    end

    context "with invalid params" do
      it "does not create a new Attendance" do
        expect {
          post :create, params: { attendance: invalid_attributes }
        }.to change(Attendance, :count).by(0)
      end

      it "renders the 'new' template" do
        post :create, params: { attendance: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: attendance.to_param }
      expect(response).to be_successful
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      let(:new_attributes) {
        { date: Date.new(2024, 5, 31) }
      }

      it "updates the requested attendance" do
        patch :update, params: { id: attendance.to_param, attendance: new_attributes }
        attendance.reload
        expect(attendance.date).to eq(Date.new(2024, 5, 31))
      end

      it "redirects to the attendance index" do
        patch :update, params: { id: attendance.to_param, attendance: new_attributes }
        expect(response).to redirect_to(attendances_url)
      end
    end

    context "with invalid params" do
      it "renders the 'edit' template" do
        patch :update, params: { id: attendance.to_param, attendance: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested attendance" do
      attendance
      expect {
        delete :destroy, params: { id: attendance.to_param }
      }.to change(Attendance, :count).by(-1)
    end

    it "redirects to the attendances index" do
      delete :destroy, params: { id: attendance.to_param }
      expect(response).to redirect_to(attendances_url)
    end
  end
end