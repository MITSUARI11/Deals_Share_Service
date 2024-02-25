# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ユーザー情報

tanaka = User.find_or_create_by!(email: "4tanaka@taro.com") do |user|
  user.user_name = "田中太郎"
  user.profile = "田中太郎です。会社員をしています。"
  user.password = "tarotanaka"
  user.icon_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/young_man.png"), filename:"young_man.png")
end

yamada = User.find_or_create_by!(email: "4yamada@hanako.com") do |user|
  user.user_name = "山田花子"
  user.profile = "山田花子です。Webデザイナーです。"
  user.password = "hanakoyamada"
  user.icon_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/woman.png"), filename:"woman.png")
end

apparel = User.find_or_create_by!(email: "4apparel@shop.com") do |user|
  user.user_name = "【公式】アパレルショップ"
  user.profile = "東京都新宿区にあるアパレルショップです。"
  user.password = "shopapparel"
  user.icon_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/apparel_shop.png"), filename:"apparel_shop.png")
end


# ショップ情報

Post.find_or_create_by!(shop_name: "ムービーシアター") do |post|
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/movie.png"), filename:"movie.png")
  post.shop_genre = Post.shop_genres.key(3)
  post.address = "東京都渋谷区"
  post.posting_text = "今話題の怪獣映画を観てきました！"
  post.user = tanaka
end

Post.find_or_create_by!(shop_name: "フレンチレストラン") do |post|
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/gourmet.png"), filename:"gourmet.png")
  post.shop_genre = Post.shop_genres.key(0)
  post.address = "東京都港区"
  post.posting_text = "若い女性を中心に人気のフレンチレストランです"
  post.user = yamada
end

Post.find_or_create_by!(shop_name: "アパレルショップ") do |post|
  post.post_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/apparel_mannequin.png"), filename:"apparel_mannequin.png")
  post.shop_genre = Post.shop_genres.key(1)
  post.address = "東京都新宿区"
  post.posting_text = "新作が入荷しました。ぜひお越しください！"
  post.user = apparel
end

# 管理者ログイン
#Admin.create!(
#  email: "Ad@min",
#  password: "aaaaaa"
#)
