
if os.isfile( zpm.build._currentExportPath .. "/include/curl/curlbuild.h" ) == false then
    zpm.assert( os.copyfile( zpm.build._currentExportPath .. "/include/curl/curlbuild.h.dist", zpm.build._currentExportPath .. "/include/curl/curlbuild.h") )
    --zpm.util.download( "https://curl.haxx.se/ca/cacert.pem", zpm.build._currentExportPath )


end

if s.isfile( zpm.build._currentExportPath .. "/lib/curl_config.h" ) == false then
    if os.is( "linux" ) then

        zpm.assert( os.copyfile( zpm.build._currentDependency.dependencyPath .. "/config/config-linux.h", zpm.build._currentExportPath .. "/lib/curl_config.h") )

    end
    if os.is( "macosx" ) then

        zpm.assert( os.copyfile( zpm.build._currentDependency.dependencyPath .. "/config/config-osx.h", zpm.build._currentExportPath .. "/lib/curl_config.h") )

    end
end