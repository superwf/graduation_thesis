module Project
  class API
    desc 'manage patient'
    resource :patients do
      params do
        requires :id, type: Integer, desc: 'patient id'
      end

      desc 'get patient by id'
      get ':id' do
        Patient.find(params[:id]) || error!('Not Found', 404)
      end

      desc 'get patient list'
      get do
        Patient.all
      end

      desc 'create patient'
      post do
        params.permit!
        Patient.create name: params[:name], login: params[:login]
      end

      desc 'get a patient'
      get ':id' do
        Patient.find params[:id]
      end

      desc 'delete a patient'
      delete ':id' do
        patient = Patient.find_by_id(params[:id])
        if patient
          patient.destroy
        else
          error!('Not Found', 404)
        end
      end

      put ':id' do
        patient = Patient.find_by_id(params[:id])
        if patient
          params.permit!
          patient.update name: params[:name]
        else
          error!('Not Found', 404)
        end
      end
    end
  end
end
