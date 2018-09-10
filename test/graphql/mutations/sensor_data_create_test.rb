# # frozen_string_literal: true
# require 'test_helper'

# module Mutations
#   class SensorDataCreateTest < ActiveSupport::TestCase
#     def execute(params = {})
#       shop = shops(:regular_shop)

#       query_string = 'mutation($registeredBrandInput: RegisteredBrandInput!) {
#         registeredBrandCreate(registeredBrandInput: $registeredBrandInput) {
#           registeredBrand {
#             id
#             name
#             keyAttribute {
#               name
#               humanReadableName
#             }
#             listingCategory {
#               name
#             }
#           }
#           userErrors {
#             message
#           }
#         }
#       }'

#       ServerSchema.execute(
#         query_string,
#         context: { shop: shop },
#         variables: {
#           'registeredBrandInput' => {
#             'name' => params[:name],
#             'listingCategoryId' => params[:listing_category_id],
#             'keyAttributeName' => params[:key_attribute_name],
#           },
#         },
#       )['data']['registeredBrandCreate']
#     end

#     test "Create a registered brand" do
#       parent_category = create_listing_category(parent_category: 'Clothing & Accessories')
#       create_registered_brand_params = {
#         name: "New registered brand",
#         listing_category_id: parent_category.id,
#         key_attribute_name: "style_number",
#       }
#       data = execute(create_registered_brand_params).to_h
#       registered_brand = data['registeredBrand']

#       assert registered_brand
#     end

#     test "Returns correct errors for each field if no fields are provided" do
#       create_registered_brand_params = {}
#       data = execute(create_registered_brand_params).to_h
#       user_errors = data['userErrors']

#       assert_includes(user_errors, "message" => "Name can't be blank")
#       assert_includes(user_errors, "message" => "Key attribute can't be blank")
#       assert_includes(user_errors, "message" => "Listing category can't be blank")
#     end

#     test "Returns correct error if an invalid listing category is provided" do
#       create_registered_brand_params = {
#         name: "New registered brand",
#         listing_category_id: 123456,
#         key_attribute_name: "style_number",
#       }
#       data = execute(create_registered_brand_params).to_h
#       user_errors = data['userErrors']

#       assert_includes(user_errors, "message" => "Listing category can't be blank")
#     end

#     test "Returns correct error if an invalid key attribute is provided" do
#       parent_category = create_listing_category(parent_category: 'Clothing & Accessories')
#       create_registered_brand_params = {
#         name: "New registered brand",
#         listing_category_id: parent_category.id,
#         key_attribute_name: "random key attribute",
#       }
#       data = execute(create_registered_brand_params).to_h
#       user_errors = data['userErrors']

#       assert_includes(user_errors, "message" => "Key attribute is not included in the list")
#     end
#   end
# end
