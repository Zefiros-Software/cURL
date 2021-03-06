// taken from http://www.cplusplus.com/forum/unices/45878/

#include <iostream>
#include <string>
#include <curl/curl.h>

std::string data;
size_t writeCallback(char *buf, size_t size, size_t nmemb, void *up)
{
    for (int c = 0; c < size * nmemb; c++)
    {
        data.push_back(buf[c]);
    }

    return size * nmemb;
}

int main()
{
    CURL *curl;

    curl_global_init(CURL_GLOBAL_ALL);
    curl = curl_easy_init();

    curl_easy_setopt(curl, CURLOPT_URL, "http://www.zefiros.com/");
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, &writeCallback);
    curl_easy_setopt(curl, CURLOPT_VERBOSE, 1L);

    curl_easy_perform(curl);

    std::cout << std::endl << data << std::endl;

    curl_easy_cleanup(curl);
    curl_global_cleanup();

    return 0;
}