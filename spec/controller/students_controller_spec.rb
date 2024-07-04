require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:student)
  }

  let(:invalid_attributes) {
    { name: nil, email: nil, age: nil }
  }

  describe "GET #index" do
    it "returns a success response" do
      create(:student)
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
      it "creates a new Student" do
        expect {
          post :create, params: { student: valid_attributes }
        }.to change(Student, :count).by(1)
      end

      it "redirects to the created student" do
        post :create, params: { student: valid_attributes }
        expect(response).to redirect_to(students_url)
      end
    end

    context "with invalid params" do
      it "does not create a new Student" do
        expect {
          post :create, params: { student: invalid_attributes }
        }.to change(Student, :count).by(0)
      end

      it "renders the 'new' template" do
        post :create, params: { student: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      student = create(:student)
      get :edit, params: { id: student.to_param }
      expect(response).to be_successful
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "New Name", age: 30 }
      }

      it "updates the requested student" do
        student = create(:student)
        patch :update, params: { id: student.to_param, student: new_attributes }
        student.reload
        expect(student.name).to eq("New Name")
        expect(student.age).to eq(30)
      end

      it "redirects to the student" do
        student = create(:student)
        patch :update, params: { id: student.to_param, student: new_attributes }
        expect(response).to redirect_to(students_url)
      end
    end

    context "with invalid params" do
      it "renders the 'edit' template" do
        student = create(:student)
        patch :update, params: { id: student.to_param, student: invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested student" do
      student = create(:student)
      expect {
        delete :destroy, params: { id: student.to_param }
      }.to change(Student, :count).by(-1)
    end

    it "redirects to the students list" do
      student = create(:student)
      delete :destroy, params: { id: student.to_param }
      expect(response).to redirect_to(students_url)
    end
  end
end