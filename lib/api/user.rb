module Project
  class API
    desc 'manage user'
    resource :users do
      params do
        requires :id, type: Integer, desc: 'user id'
      end

      desc 'get user by id'
      get ':id' do
        User.find(params[:id]) || error!('Not Found', 404)
      end

      desc 'get user list'
      get do
        User.all
      end

      desc 'create user'
      post do
        params.permit!
        User.create name: params[:name], login: params[:login]
      end

      desc 'get a user'
      get ':id' do
        User.find params[:id]
      end

      desc 'delete a user'
      delete ':id' do
        user = User.find_by_id(params[:id])
        if user
          user.destroy
        else
          error!('Not Found', 404)
        end
      end

      put ':id' do
        user = User.find_by_id(params[:id])
        if user
          params.permit!
          user.update name: params[:name]
        else
          error!('Not Found', 404)
        end
      end
    end
  end
end
