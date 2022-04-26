class Product < ApplicationRecord
        validates :title, presence: true
        validates :body, presence: true, length: { minimum: 10 }
        validates :price, comparison: {greater_than: 0}
        validates :stock, comparison: {greater_than_or_equal_to: 0}
      end
    end
  end
end
