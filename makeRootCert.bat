C:\"Program Files (x86)"\"Microsoft SDKs"\Windows\v7.1A\Bin\makecert.exe -r -n "CN=DevRoot" -pe -sv DevRoot.pvk -a sha1 -len 2048 -b 01/21/2015 -e 01/21/2040 -cy authority DevRoot.cer

C:\"Program Files (x86)"\"Microsoft SDKs"\Windows\v7.1A\Bin\pvk2pfx.exe -pvk DevRoot.pvk -spc DevRoot.cer -pfx DevRoot.pfx
