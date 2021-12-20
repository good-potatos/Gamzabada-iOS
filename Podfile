# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Gamzabada' do
  use_frameworks!
  pod 'Moya/Combine', '~> 15.0'
  pod 'FLEX', '~> 4.6.0', :configurations => ['Debug']
  pod 'SwiftFormat/CLI', '~> 0.48.16'
  pod 'KakaoSDKCommon'  # 필수 요소를 담은 공통 모듈
  pod 'KakaoSDKAuth'  # 사용자 인증
  pod 'KakaoSDKUser'  # 카카오 로그인, 사용자 관리

  target 'GamzabadaTests' do
    inherit! :search_paths
  end

end
