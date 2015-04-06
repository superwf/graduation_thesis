module Project
  class API
    desc 'manage guardian'
    resource :guardians do
      params do
        requires :id, type: Integer, desc: 'guardian id'
      end

      desc 'get guardian by id'
      get ':id' do
        Guardian.find(params[:id]) || error!('Not Found', 404)
      end

      desc 'get guardian list'
      get do
        Guardian.all
      end

      desc 'create guardian'
      post do
        params.permit!
        Guardian.create name: params[:name], login: params[:login]
      end

      desc 'get a guardian'
      get ':id' do
        Guardian.find params[:id]
      end

      desc 'delete a guardian'
      delete ':id' do
        guardian = Guardian.find_by_id(params[:id])
        if guardian
          guardian.destroy
        else
          error!('Not Found', 404)
        end
      end

      put ':id' do
        guardian = Guardian.find_by_id(params[:id])
        if guardian
          params.permit!
          guardian.update name: params[:name]
        else
          error!('Not Found', 404)
        end
      end
    end
  end
end
