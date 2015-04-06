module Project
  class API
    desc 'manage terminal_record'
    resource :terminal_records do
      params do
        requires :id, type: Integer, desc: 'terminal_record id'
      end

      desc 'get terminal_record by id'
      get ':id' do
        TerminalRecord.find(params[:id]) || error!('Not Found', 404)
      end

      desc 'get terminal_record list'
      get do
        TerminalRecord.all
      end

      desc 'create terminal_record'
      post do
        params.permit!
        TerminalRecord.create name: params[:name], login: params[:login]
      end

      desc 'get a terminal_record'
      get ':id' do
        TerminalRecord.find params[:id]
      end

      desc 'delete a terminal_record'
      delete ':id' do
        terminal_record = TerminalRecord.find_by_id(params[:id])
        if terminal_record
          terminal_record.destroy
        else
          error!('Not Found', 404)
        end
      end

      put ':id' do
        terminal_record = TerminalRecord.find_by_id(params[:id])
        if terminal_record
          params.permit!
          terminal_record.update name: params[:name]
        else
          error!('Not Found', 404)
        end
      end
    end
  end
end
