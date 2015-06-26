C:\"Program Files (x86)"\"Microsoft SDKs"\Windows\v7.1A\Bin\makecert.exe -iv DevRoot.pvk -ic DevRoot.cer -n "CN=%1" -pe -sv %1.pvk -a sha1 -len 2048 -b 01/21/2015 -e 01/21/2040 -sky exchange %1.cer -eku 1.3.6.1.5.5.7.3.1

C:\"Program Files (x86)"\"Microsoft SDKs"\Windows\v7.1A\Bin\pvk2pfx.exe -pvk %1.pvk -spc %1.cer -pfx %1.pfx