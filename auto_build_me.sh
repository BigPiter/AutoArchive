
scheme="Penjing"
project_path="/Users/ZJtao/Desktop/Project/Discuz/Discuz_iOS/DiscuzMobile"
development_team="开发者id"
code_sign="a4d6901e-2358-4b75-bf11-192fc3b53118"
sign_name="描述文件名"

autoBuild() {

	#打包之前先清理一下工程
	xcodebuild clean \
	-scheme ${scheme} \
	-configuration Release 
	if [[ $? != 0 ]]; then
		exit
	fi

	#开始编译工程 - 导出.xcarchive文件
	xcodebuild archive \
	-workspace "${project_path}/DiscuzMobile.xcworkspace" \
	-scheme ${scheme} \
	-configuration Release \
	-archivePath "./build/${scheme}.xcarchive" \
#    CODE_SIGN_IDENTITY="iPhone Distribution: Beijing Comsenz-service Technology Limited (5ZLZJ65EY9)" \
#    DEVELOPMENT_TEAM=${development_team} \
#    PROVISIONING_PROFILE=${code_sign} \
#    PROVISIONING_PROFILE_SPECIFIER=${sign_name}
	if [[ $? != 0 ]]; then
		exit
	fi

	#导出ipa包
	xcodebuild -exportArchive \
	-archivePath "${project_path}/build/${scheme}.xcarchive" \
	-exportPath "~/Desktop/PublishIPA/${scheme}" \
	-exportOptionsPlist "./build/${scheme}/exportTest.plist"
	if [[ $? != 0 ]]; then
		exit
	fi
}
autoBuild

