require 'uri'

module Collins; module Api

  module Admin

    def repopulate_solr! wait_for_completion = true
      parameters = {
        :waitForCompletion => wait_for_completion
      }
      http_get("/api/admin/solr", parameters) do |response|
        parse_response response, :expects => 200
      end

    end

    def reindex_asset! asset_or_tag
      asset = get_asset_or_tag asset_or_tag
      http_get("/api/admin/solr/asset/#{asset.tag}") do |response|
        parse_response response, :expects => 200
      end

    end

  end
end; end

