module Project
  class API
    desc 'manage patient_records'
    resource :patient_records do
      params do
        requires :id, type: Integer, desc: 'patient_record id'
      end

      desc 'get patient_record by id'
      get ':id' do
        PatientRecord.find(params[:id]) || error!('Not Found', 404)
      end

      desc 'get patient_record list'
      get do
        PatientRecord.all
      end

      desc 'create patient_record'
      post do
        params.permit!
        PatientRecord.create name: params[:name], login: params[:login]
      end

      desc 'get a patient_record'
      get ':id' do
        PatientRecord.find params[:id]
      end

      desc 'delete a patient_record'
      delete ':id' do
        patient_record = PatientRecord.find_by_id(params[:id])
        if patient_record
          patient_record.destroy
        else
          error!('Not Found', 404)
        end
      end

      put ':id' do
        patient_record = PatientRecord.find_by_id(params[:id])
        if patient_record
          params.permit!
          patient_record.update name: params[:name]
        else
          error!('Not Found', 404)
        end
      end
    end
  end
end
