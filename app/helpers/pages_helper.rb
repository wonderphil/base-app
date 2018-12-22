module PagesHelper

  def company_address
    if ENV['COMPANY_ADDRESS_1']
      address = ENV['COMPANY_ADDRESS_1'] + "<br>"
      if !ENV['COMPANY_ADDRESS_2'].nil?
        address = address + ENV['COMPANY_ADDRESS_2'] + "<br>"
      end
      if ENV['COMPANY_ADDRESS_CITY']
        address = address + ENV['COMPANY_ADDRESS_CITY'] + "<br>"
      end
      if ENV['COMPANY_ADDRESS_COUNTRY']
        address = address + ENV['COMPANY_ADDRESS_COUNTRY'] + "<br>"
      end
      if ENV['COMPANY_ADDRESS_POSTCODE']
        address = address + ENV['COMPANY_ADDRESS_POSTCODE']
      end
    end
  
  end

end
