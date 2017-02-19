class Swagger::Docs::Config
  def self.transform_path(path, api_version)
    # Make a distinction between the APIs and API documentation paths.
    "docs/#{path}"
  end

  def self.base_api_controller; ActionController::API end
end

Swagger::Docs::Config.register_apis({
    "v1" => {
        # the output location where your .json files are written to
        :api_file_path => "public/docs",
        # the URL base path to your API
        :base_path => "",
        # if you want to delete all .json files at each generation
        :clean_directory => true,
        # :base_api_controller => V1::BaseController,
        # add custom attributes to api-docs
        :attributes => {
            :info => {
                "title" => "Spinit",
                "description" => "Connections for the Body of Christ",
                "contact" => "nbriardavis@gmail.com",
            }
        }
    }
})
