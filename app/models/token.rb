class Token
  def combination
    [
      [adjectives, center, object ],
      [adjectives, center, handleend ],
      [center, object],
      [center, handleend]
    ].sample
  end

  %w{ adjectives center object handleend }.each do |method|
    define_method(method) do
      I18n.t("swear_words.#{method}").sample
    end
  end

  def to_s
    Rails.application.config.swear_words_token ?
      combination.map(&:capitalize).join.gsub(/\s+/, "") :
      SecureRandom.urlsafe_base64
  end
end
