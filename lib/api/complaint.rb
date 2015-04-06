module Project
  class API
    desc 'manage complaint'
    resource :complaints do
      params do
        requires :id, type: Integer, desc: 'complaint id'
      end

      desc 'get complaint by id'
      get ':id' do
        Complaint.find(params[:id]) || error!('Not Found', 404)
      end

      desc 'get complaint list'
      get do
        Complaint.all
      end

      desc 'create complaint'
      post do
        params.permit!
        Complaint.create name: params[:name], login: params[:login]
      end

      desc 'get a complaint'
      get ':id' do
        Complaint.find params[:id]
      end

      desc 'delete a complaint'
      delete ':id' do
        complaint = Complaint.find_by_id(params[:id])
        if complaint
          complaint.destroy
        else
          error!('Not Found', 404)
        end
      end

      put ':id' do
        complaint = Complaint.find_by_id(params[:id])
        if complaint
          params.permit!
          complaint.update name: params[:name]
        else
          error!('Not Found', 404)
        end
      end
    end
  end
end
