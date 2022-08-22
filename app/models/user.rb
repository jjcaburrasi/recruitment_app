class User < ApplicationRecord

    has_many :applications, class_name: "Application",
                            foreign_key: "user_id",
                            dependent: :destroy
    has_many :comments
    has_many :jobs , through: :applications, source: :job

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable #:confirmable

    before_save :downcase_email

    validates :name, presence: true, length: { maximum: 50 }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                        format: { with: VALID_EMAIL_REGEX },
                        uniqueness: { case_sensitive: false }
    
    def apply(job)
        jobs << job
    end

    def unapply(job)
        jobs.delete(job)
    end

    def applied?(job)
        jobs.includes?(job)
    end

    private

        # Converts email to all lowercase.
        def downcase_email
            self.email = email.downcase
        end
end
