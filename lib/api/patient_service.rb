module Project
  class API
    desc 'manage patient_service'
    resource :patient_services do
      params do
        requires :id, type: Integer, desc: 'patient_service id'
      end

      desc 'get patient_service by id'
      get ':id' do
        PatientService.find(params[:id]) || error!('Not Found', 404)
      end

      desc 'get patient_service list'
      get do
        PatientService.all
      end

      desc 'create patient_service'
      post do
        params.permit!
        PatientService.create name: params[:name], login: params[:login]
      end

      desc 'get a patient_service'
      get ':id' do
        PatientService.find params[:id]
      end

      desc 'delete a patient_service'
      delete ':id' do
        patient_service = PatientService.find_by_id(params[:id])
        if patient_service
          patient_service.destroy
        else
          error!('Not Found', 404)
        end
      end

      put ':id' do
        patient_service = PatientService.find_by_id(params[:id])
        if patient_service
          params.permit!
          patient_service.update name: params[:name]
        else
          error!('Not Found', 404)
        end
      end
    end
  end
end
