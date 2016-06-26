class User < ActiveRecord::Base
  enum role: { worker: 1, manager: 2 }
end
