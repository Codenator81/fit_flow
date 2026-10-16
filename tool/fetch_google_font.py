#!/usr/bin/env python3
"""Download a Google Fonts variant into google_fonts/ for bundling.

Usage: python3 tool/fetch_google_font.py roboto:500 montserrat:700 ...

The file URL and SHA-256 come from the google_fonts package in the pub cache,
so the bundled file is exactly what the package would fetch at runtime. Run it
when a test fails with "Ensure <Font>-<Variant>.ttf exists ...".
"""
import glob
import hashlib
import os
import re
import sys
import urllib.request

NAMES = {100: "Thin", 200: "ExtraLight", 300: "Light", 400: "Regular",
         500: "Medium", 600: "SemiBold", 700: "Bold", 800: "ExtraBold",
         900: "Black"}


def find_variant(method, weight):
    pattern = os.path.expanduser(
        "~/.pub-cache/hosted/pub.dev/google_fonts-*/lib/src/google_fonts_parts/*.g.dart")
    for path in sorted(glob.glob(pattern), reverse=True):
        src = open(path, encoding="utf-8").read()
        start = src.find(f"static TextStyle {method}(")
        if start < 0:
            continue
        body = src[start:src.find("return googleFontsTextStyle", start)]
        family = re.search(r"fontFamily: '([^']+)'", src[start:]).group(1)
        match = re.search(
            rf"fontWeight: FontWeight\.w{weight},\s*fontStyle: FontStyle\.normal,"
            r"\s*\): GoogleFontsFile\(\s*'(\w+)',\s*(\d+)", body)
        if match:
            return family, match.group(1), int(match.group(2))
    sys.exit(f"{method}:{weight} not found in the google_fonts package")


def main():
    os.makedirs("google_fonts", exist_ok=True)
    for arg in sys.argv[1:]:
        method, weight = arg.split(":")
        family, digest, length = find_variant(method, int(weight))
        url = f"https://fonts.gstatic.com/s/a/{digest}.ttf"
        data = urllib.request.urlopen(url).read()
        if len(data) != length or hashlib.sha256(data).hexdigest() != digest:
            sys.exit(f"checksum mismatch for {url}")
        out = f"google_fonts/{family.replace(' ', '')}-{NAMES[int(weight)]}.ttf"
        open(out, "wb").write(data)
        print(out)


if __name__ == "__main__":
    main()
