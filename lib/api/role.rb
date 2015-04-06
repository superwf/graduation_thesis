module Project
  class API
    desc 'manage roles'
    resource :roles do
      params do
        requires :id, type: Integer, desc: 'role id'
      end

      desc 'get role by id'
      get ':id' do
        Role.find(params[:id]) || error!('Not Found', 404)
      end

      desc 'get role list'
      get do
        Role.all
      end

      desc 'create role'
      post do
        params.permit!
        Role.create name: params[:name]
      end

      desc 'get a role'
      get ':id' do
        Role.find params[:id]
      end

      desc 'delete a role'
      delete ':id' do
        role = Role.find_by_id(params[:id])
        if role
          role.destroy
        else
          error!('Not Found', 404)
        end
      end

      put ':id' do
        role = Role.find_by_id(params[:id])
        if role
          params.permit!
          role.update name: params[:name]
        else
          error!('Not Found', 404)
        end
      end
    end
  end
end
