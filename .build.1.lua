
project "cURL"

    kind "StaticLib"
    language "C"

    zpm.uses {
        "Zefiros-Software/mbedTLS"
    }

    zpm.export(function()
        includedirs { 
            "include", 
            "lib"
        }

        defines { 
            "BUILDING_LIBCURL",
            "CURL_STATICLIB",
            "HTTP_ONLY", 
            "USE_MBEDTLS" 
        }

        filter { "system:linux" }
            defines { "CURL_HIDDEN_SYMBOLS" }

            -- find the location of the ca bundle
            local ca = nil
            for _, f in ipairs {
                "/etc/ssl/certs/ca-certificates.crt",
                "/etc/pki/tls/certs/ca-bundle.crt",
                "/usr/share/ssl/certs/ca-bundle.crt",
                "/usr/local/share/certs/ca-root.crt",
                "/etc/ssl/cert.pem" } do
                if os.isfile(f) then
                    ca = f
                    break
                end
            end
            if ca then
                defines { 
                    'CURL_CA_BUNDLE="' .. ca .. '"' 
                }
            end
    end)

    files {
        "**.h",
        "**.c"
    }

