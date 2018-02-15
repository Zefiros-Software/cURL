-- [[
-- @cond ___LICENSE___
--
-- Copyright (c) 2016-2018 Zefiros Software.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
--
-- @endcond
-- ]]
if not os.isfile(path.join(zpm.exportpath(), "/include/curl/curlbuild.h")) then
    zpm.extractfile("/include/curl/curlbuild.h.dist", "/include/curl/curlbuild.h")
    --zpm.util.download( "https://curl.haxx.se/ca/cacert.pem", zpm.build._currentExportPath )
end

local targetConfig = path.join(zpm.exportpath(), "/lib/curl_config.h")
if not os.isfile(targetConfig) then
    if os.istarget("linux") then
        os.copyfile(path.join(zpm.definition(), "/config/config-linux.h"), targetConfig)
    elseif os.istarget("macosx") then
        os.copyfile(path.join(zpm.definition(), "/config/config-osx.h"), targetConfig)
    end
end
