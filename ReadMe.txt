makeRootCert skapar ett rotcertifikat med namnet DevRoot.
Du får en fråga om password men klicka bara på "None" (eller "Inget"?)
Resultatet blir tre filer 
- DevRoot.cer
- DevRoot.pvk
- DevRoot.pfx
Den tredje filen är ett paket som består av de två första och används när man ska "aktivera" certifikatet.
Vi använder hash-algoritmen sha1, och en valideringstid till 2040.
Rotcertifikatet skapas en gång och de andra certifikaten "ärver" från denna.
Datorn litar på rotcertifikatet och därmed också från alla som skapas utifrån rotcertifikatet.
Du kan i kommandoprompten skriva DevRoot.cer och få lite info om certifikatet.
Man kan se att den inte är "trusted" än.

makeCert.bat skapar ett certifikat för en Web Site utifrån rotcertifikat DevRoot.
Du måste ange ett namn som parameter: makeCert web.Local
Nu skapas 3 filer som när vi skapade rotcertifikatet.

Trust-process
--------------
I kommandoprompten skriv mmc för att starta Microsoft Management Console
File -> Add/Remove Snap-in...
Välj Certificates och klicka på Add
Välj Computer Account och sen på Next -> Finish -> OK
Expandera Certificat-noden
Personal -> Certificates //Här finns de enskilda SSL-certifikat
Trusted Root Certification Authorities //Innehåller lista på utfärdare man litar på

Importera rotcertifikatet till Trusted Root Certification Authorities -> Certificates
- Högerklicka på Certificates och välj "All Tasks" -> Import
- Välj DevRoot.cer (konstigt nog inte den packade filen) -> Open -> Next -> Finish

Nu är web.local-certifikatet "trusted" eftersom rotcertifikatet är trusted.

Importera web.local-certifikatet till Personal-Certificates
- Högerklicka på Certificates och välj "All Tasks" -> Import
- Välj web.local.pfx (ändra i filtret för att se filen) -> Open -> Next -> Finish

Koppla certifikatet i IIS så att vi kan använda det
--------------------------------------------------
- Starta IIS-Manager
- Välj Default Web Site 
- Välj Bindings längst ute till höger  (innehåller en http-bindning)
- Klicka på Add
- Välj https. Välj web.local i dropdown SSL-certificate. Du behöver inte ange Host Name.
Du har nu ett certificat som funkar på https://web.local men datorn kan inte hitta domänen.

Lägg till domänen i hosts-filen
--------------------------------
Starta anteckningar som administratör
Öppna filen C:\Windows\System32\drivers\etc\hosts
Lägg till raden 127.0.0.1 web.local

Man kan nog skapa en web site som heter typ web.local om man vill.

