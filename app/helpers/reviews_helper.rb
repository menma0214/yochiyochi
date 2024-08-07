module ReviewsHelper
  def display_stars(rate)
    rate ||= 0  # rateがnilの場合は0にする
    full_star = '<i class="fas fa-star"></i>'
    half_star = '<i class="fas fa-star-half-alt"></i>'
    empty_star = '<i class="far fa-star"></i>'

    stars = ''
    5.times do |i|
      if rate >= i + 1
        stars += full_star
      elsif rate >= i + 0.5
        stars += half_star
      else
        stars += empty_star
      end
    end
    stars.html_safe
  end
end
