
project "cURL"

    kind "StaticLib"

    zpm.uses {
        "Zefiros-Software/mbedTLS"
    }

    includedirs { 
        "lib"
    }

    files {
        "lib/**.c"
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
            "CURL_HIDDEN_SYMBOLS"
            --"CURLOPT_SSL_VERIFYPEER=0"
        }

        defines {  }

        local downloadPem = zpm.build._currentExportPath .. "cacert.pem"
        -- find the location of the ca bundle
        local ca = nil
        for _, f in ipairs {
            "/etc/ssl/certs/ca-certificates.crt",
            "/etc/pki/tls/certs/ca-bundle.crt",
            "/usr/share/ssl/certs/ca-bundle.crt",
            "/usr/local/share/certs/ca-root.crt",
            "/etc/ssl/cert.pem",
             downloadPem } do
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