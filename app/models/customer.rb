class Customer < ApplicationRecord  
    has_one_attached :image
  
    validates :full_name, presence: true

    # 验证 email_address 必须是有效的邮箱地址格式
    validates :email_address, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  
    # 验证 phone_number 必须是数字
    validates :phone_number, numericality: { only_integer: true }, allow_blank: true
  
    # 指定哪些属性可以被搜索
    def self.ransackable_attributes(auth_object = nil)
      %w[full_name email_address phone_number notes]
    end
  

  end
  