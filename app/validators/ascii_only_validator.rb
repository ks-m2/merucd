# class AsciiOnlyValidator < ActiveModel::EachValidator
#   def validate_each(record, attribute, value)
#     if value.present? && !value.ascii_only?
#       record.errors[attribute] << I18n.t('validators.ascii_only')
#     end
#   end
# end