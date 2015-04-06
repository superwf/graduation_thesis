module Project
  class API
    desc 'manage terminal'
    resource :terminals do
      params do
        requires :id, type: Integer, desc: 'terminal id'
      end

      desc 'get terminal by id'
      get ':id' do
        Terminal.find(params[:id]) || error!('Not Found', 404)
      end

      desc 'get terminal list'
      get do
        Terminal.all
      end

      desc 'create terminal'
      post do
        params.permit!
        Terminal.create name: params[:name], login: params[:login]
      end

      desc 'get a terminal'
      get ':id' do
        Terminal.find params[:id]
      end

      desc 'delete a terminal'
      delete ':id' do
        terminal = Terminal.find_by_id(params[:id])
        if terminal
          terminal.destroy
        else
          error!('Not Found', 404)
        end
      end

      put ':id' do
        terminal = Terminal.find_by_id(params[:id])
        if terminal
          params.permit!
          terminal.update name: params[:name]
        else
          error!('Not Found', 404)
        end
      end
    end
  end
end
