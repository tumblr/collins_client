require 'uri'

module Collins; module Api

  module Admin

    # Trigger a full reindex of Solr
    #
    # Note that this will trigger a full reindex of the assets and could cause
    # extra load on Solr
    #
    # @param [Boolean] wait_for_completion Execute the reindexing synchronously
    def repopulate_solr! wait_for_completion = true
      parameters = {
        :waitForCompletion => wait_for_completion
      }
      http_get("/api/admin/solr", parameters) do |response|
        parse_response response, :expects => 200
      end

    end

    # Reindex a single asset in Solr
    #
    # Note that this will trigger a reindex of this asset and could cause extra
    # load on Solr
    #
    # @param [String,Collins::Asset] asset_or_tag The asset or asset tag of the
    # asset you want to reindex
    def reindex_asset! asset_or_tag
      asset = get_asset_or_tag asset_or_tag
      http_get("/api/admin/solr/asset/#{asset.tag}") do |response|
        parse_response response, :expects => 200
      end

    end

  end
end; end

