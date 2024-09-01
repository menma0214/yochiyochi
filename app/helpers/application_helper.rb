module ApplicationHelper

  def page_title(title = '', admin: false)
    base_title = admin ? 'よちよち(管理画面)' : 'よちよち'
    title.present? ? "#{title} | #{base_title}" : base_title
  end

  def default_meta_tags
    {
      site: 'yochiyochi',
      title: '幼児向け施設・イベント検索サービス',
      reverse: true,
      charset: 'utf-8',
      description: 'yochiyochiでは幼児向けの施設・イベントの情報を検索できます。',
      keywords: '赤ちゃん,子ども',
      canonical: request.original_url,
      separator: '|',
      og: {
        site_name: 'yochiyochi',
        title: '幼児向け施設・イベント検索サービス',
        description: 'yochiyochiでは幼児向けの施設・イベントの情報を検索できます。',
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        local: 'ja-JP'
      },
      # Twitter用の設定を個別で設定する
      twitter: {
        card: 'summary_large_image', # Twitterで表示する場合は大きいカードにする
        site: '@', # アプリの公式Twitterアカウントがあれば、アカウント名を書く
        image: image_url('ogp.png') # 配置するパスやファイル名によって変更すること
      }
    }
  end

end
