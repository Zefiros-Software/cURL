
project "cURL"

    kind "StaticLib"

    zpm.uses {
        "Zefiros-Software/mbedTLS"
    }

    files {
        "lib/**.c"
    }

    includedirs { 
        "lib"
    }

    zpm.export(function()
        includedirs { 
            "include"
        }

        defines { 
            "BUILDING_LIBCURL",
            "CURL_STATICLIB",
            "HTTP_ONLY", 
            "USE_MBEDTLS",
            "CURL_HIDDEN_SYMBOLS",
        }

        filter {"system:not windows"}
            defines "HAVE_CONFIG_H"
        
        filter {}

    end)