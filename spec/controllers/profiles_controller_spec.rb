require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
    login_user

    profile_attributes = {
        first_name: "Indrajit",
        last_name: "Naiya"
    }

    let(:valid_session) { {} }

    describe 'GET index' do
        it 'has a 200 status code' do
            get :index, params: {}, session: valid_session
            expect(response.status).to eq(200)
            # expect(response).to have_http_status(302)
        end
    end
    describe 'GET show' do
        it 'has a 200 status code' do
            get :show, params: {id: 1}
            expect(response.status).to eq(200)
        end
    end

    describe 'GET new' do
        it 'has a 200 status code' do
            get :new
            expect(response.status).to eq(200)
        end
    end

    describe 'POST create' do
        it 'it should redirect to show page of profile' do
            post :create, params: { profile: profile_attributes }
            expect(response.status).to redirect_to(
                action: :show,
                id: assigns(:profile).id
            )        
        end
    end
    describe 'GET edit' do
        it 'has a 200 status code' do
            post :create, params: { profile: profile_attributes }
            get :edit, params:{ id: assigns(:profile).id }
            expect(response.status).to eq(200)
        end
    end
    describe 'PATCH update' do
        it 'has a 200 status code' do
            profile_attributes1 = {
            first_name: "Indrajit1",
            last_name: "Naiya1"
            }
            post :create, params: { profile: profile_attributes }
            patch :update, params: {id: assigns(:profile).id, profile: profile_attributes1}
            expect(response.status).to redirect_to(
                    action: :show,
                    id: assigns(:profile).id
                )        
        end
    end
    describe 'DELETE destroy' do
        it 'has to redirect to index page' do
            post :create, params: { profile: profile_attributes }
            delete :destroy, params: {id: assigns(:profile).id }
            expect(response.status).to redirect_to(
                action: :index
            )
        end
    end
end