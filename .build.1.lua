
project "cURL"

    kind "StaticLib"

    zpm.uses {
        "Zefiros-Software/mbedTLS"
    }

    includedirs { 
        "lib"
    }

    files {
        "lib/**.c",
        "src/**.c"
    }

    local downloadPem = path.join(zpm.build._currentExportPath, "cacert.pem")

    zpm.export(function()
        includedirs { 
            "include"
        }

        defines { 
            "BUILDING_LIBCURL",
            "CURL_STATICLIB",
            "HTTP_ONLY", 
            "USE_MBEDTLS",
            "CURL_HIDDEN_SYMBOLS"
        }

        filter {"system:windows"}
            defines { 
                'CURL_CA_BUNDLE="%%__APPDIR__%%/cacert.pem"'
            }

        filter {"system:not windows"}
            defines {
                'CURL_CA_BUNDLE="/proc/self/exe/cacert.pem"'
            }

        filter {}

    end)