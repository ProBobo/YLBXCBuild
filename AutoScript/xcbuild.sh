#!/bin/bash

# 对工程进行清理：

workspacePath="../YLBXCBuild.xcworkspace"
schemeName="YLBXCBuild"

xcodebuild clean -workspace $workspacePath -scheme $schemeName -configuration debug
xcodebuild clean -workspace $workspacePath -scheme $schemeName -configuration release

# 生成xcarchive操作：
archivePath="../AutoArchive/YLBXCBuild.xcarchive"
xcodebuild archive -workspace $workspacePath -scheme $schemeName -archivePath $archivePath

# 生成ipa文件
ipaPath="../AutoIPA/YLBXCBuild"
exportOptionPath="../AutoIPA/ExportOptions.plist"
xcodebuild -exportArchive -archivePath $archivePath -exportPath $ipaPath -exportOptionsPlist $exportOptionPath