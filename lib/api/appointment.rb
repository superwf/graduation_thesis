module Project
  class API
    desc 'manage Appointment'
    resource :appointment do
      params do
        requires :id, type: Integer, desc: 'Appointment id'
      end

      desc 'get Appointment by id'
      get ':id' do
        Appointment.find(params[:id]) || error!('Not Found', 404)
      end

      desc 'get Appointment list'
      get do
        Appointment.all
      end

      desc 'create Appointment'
      post do
        params.permit!
        Appointment.create name: params[:name], login: params[:login]
      end

      desc 'get a Appointment'
      get ':id' do
        Appointment.find params[:id]
      end

      desc 'delete a Appointment'
      delete ':id' do
        Appointment = Appointment.find_by_id(params[:id])
        if Appointment
          Appointment.destroy
        else
          error!('Not Found', 404)
        end
      end

      put ':id' do
        Appointment = Appointment.find_by_id(params[:id])
        if Appointment
          params.permit!
          Appointment.update name: params[:name]
        else
          error!('Not Found', 404)
        end
      end
    end
  end
end
