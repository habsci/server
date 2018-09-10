# # frozen_string_literal: true
# require 'test_helper'

# module Types
#   class SensorDataTypeTest < ActiveSupport::TestCase
#     def execute(params = {}, shop = shops(:regular_shop))
#       query = 'query {
#         shop {
#           mwsAccount {
#             registeredBrands {
#               name,
#               keyAttribute {
#                 name,
#                 humanReadableName,
#               },
#               isDeletable,
#             }
#           }
#         }
#       }'

#       SellOnAmazonSchema.execute(query, context: { shop: shop }, variables: params).to_h['data']['shop']
#     end

#     test "registered_brand_type returns a list of all registered brands" do
#       create_registered_brand
#       registered_brands = execute['mwsAccount']['registeredBrands']
#       expected = 1
#       actual = registered_brands.count

#       assert_equal expected, actual
#     end

#     test "registered_brand_type returns whether or not it is deletable" do
#       registered_brand = create_registered_brand
#       create_branded_listing(registered_brand: registered_brand)
#       registered_brands = execute['mwsAccount']['registeredBrands']

#       refute registered_brands.first['isDeletable']
#     end
#   end
# end
