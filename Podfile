platform :ios, '9.0'

flutter_application_path = '/Users/bjhl/Desktop/flutter_share/FlutterManage/my_flutter'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'FlutterManage' do
  install_all_flutter_pods(flutter_application_path)
  use_frameworks!
  
  pod 'Masonry'
  

  # Pods for FlutterManage

  target 'FlutterManageTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'FlutterManageUITests' do
    # Pods for testing
  end

end
