
workspace "cURL"
   configurations { "Test" }
   startproject "cURL"

    project "cURL"
        kind "ConsoleApp"
        files "main.cpp"

        zpm.uses "Zefiros-Software/cURL"