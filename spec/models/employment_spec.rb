require 'rails_helper'
describe 'Employment model function', type: :model do

  describe 'Employment model function' do
    context 'If the user is set empty' do
      it 'It is hard to Validation' do
        job = FactoryBot.create(:job)
        employment = Employment.create(job_id: job.id)
        expect(employment).not_to be_valid
      end
    end
    context 'If the job is set empty' do
      it 'It is hard to Validation' do
        user = FactoryBot.create(:user)
        employment = Employment.create(user_id: user.id )
        expect(employment).not_to be_valid
      end
    end
    context 'If the job and user are described' do
      it 'Validation passes' do
        job = FactoryBot.create(:job)
        user = FactoryBot.create(:user2)
        employment = Employment.create(job_id: job.id ,user_id: user.id)
        expect(employment).to be_valid
      end
    end
  end
end
