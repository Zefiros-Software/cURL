
if os.isfile( zpm.build._currentExportPath .. "/include/curl/curlbuild.h" ) == false then
    zpm.assert( os.copyfile( zpm.build._currentExportPath .. "/include/curl/curlbuild.h.dist", zpm.build._currentExportPath .. "/include/curl/curlbuild.h") )
end
