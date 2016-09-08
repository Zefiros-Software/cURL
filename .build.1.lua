
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
            "USE_MBEDTLS",
            "CURL_HIDDEN_SYMBOLS"
            --"CURLOPT_SSL_VERIFYPEER=0"
        }

        local downloadPem = path.join(zpm.build._currentExportPath, "cacert.pem")
        -- find the location of the ca bundle
        local ca = nil
        for _, f in ipairs {
             downloadPem,
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
        print(ca)
            defines { 
                'CURL_CA_BUNDLE="' .. ca .. '"' 
            }
        end

    end)