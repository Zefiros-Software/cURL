
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

    zpm.export(function()
        includedirs { 
            "include"
        }

        defines { 
            "BUILDING_LIBCURL",
            "CURL_STATICLIB",
            "HTTP_ONLY", 
            "USE_MBEDTLS"
        }

    end)