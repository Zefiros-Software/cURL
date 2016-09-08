
if os.isfile( zpm.build._currentExportPath .. "/include/curl/curlbuild.h" ) then
    os.remove( zpm.build._currentExportPath .. "/include/curl/curlbuild.h" )
end
zpm.assert( os.copyfile( zpm.build._currentExportPath .. "/include/curl/curlbuild.h.dist", zpm.build._currentExportPath .. "/include/curl/curlbuild.h") )
