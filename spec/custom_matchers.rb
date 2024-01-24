RSpec::Matchers.define_negated_matcher :not_change, :change

# RSpec::Matchers.define :be_invalid_record_for do |entity, opts|
#   supports_block_expectations

#   match do |record|
#     expect{ record.call }
#       .to raise_error(ActiveRecord::RecordInvalid, "Validation failed: #{opts[:with_error]}")
#       .and not_change { entity.count }
#   end
# end
