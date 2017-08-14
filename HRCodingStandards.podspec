Pod::Spec.new do |s|  
  s.name             = 'HRCodingStandards' 
  s.version          = '0.0.1'
  s.summary          = 'A coding standards for ios.'    
  s.homepage         = 'https://github.com/obgniyum/HRCodingStandards' 

  s.license          = 'MIT'  
  s.author           = { 'liuming' => '97461909@qq.com' }  
  s.source           = { :git => 'https://github.com/xiaoMing0109/CodeStandard.git', :tag => s.version.to_s }  
  
  s.platform     = :ios   
  s.requires_arc = true  
  
  s.source_files = 'Risenb iOS开发Objective-C编码规范.md'  
   
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'  

end 
