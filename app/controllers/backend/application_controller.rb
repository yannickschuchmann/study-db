class Backend::ApplicationController < ApplicationController
  http_basic_authenticate_with name: "studydb", password: "neverpushpasswordstogit"

  layout "backend/layouts/application"
end
