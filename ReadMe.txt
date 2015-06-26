makeRootCert skapar ett rotcertifikat med namnet DevRoot.
Du f�r en fr�ga om password men klicka bara p� "None" (eller "Inget"?)
Resultatet blir tre filer 
- DevRoot.cer
- DevRoot.pvk
- DevRoot.pfx
Den tredje filen �r ett paket som best�r av de tv� f�rsta och anv�nds n�r man ska "aktivera" certifikatet.
Vi anv�nder hash-algoritmen sha1, och en valideringstid till 2040.
Rotcertifikatet skapas en g�ng och de andra certifikaten "�rver" fr�n denna.
Datorn litar p� rotcertifikatet och d�rmed ocks� fr�n alla som skapas utifr�n rotcertifikatet.
Du kan i kommandoprompten skriva DevRoot.cer och f� lite info om certifikatet.
Man kan se att den inte �r "trusted" �n.

makeCert.bat skapar ett certifikat f�r en Web Site utifr�n rotcertifikat DevRoot.
Du m�ste ange ett namn som parameter: makeCert web.Local
Nu skapas 3 filer som n�r vi skapade rotcertifikatet.

Trust-process
--------------
I kommandoprompten skriv mmc f�r att starta Microsoft Management Console
File -> Add/Remove Snap-in...
V�lj Certificates och klicka p� Add
V�lj Computer Account och sen p� Next -> Finish -> OK
Expandera Certificat-noden
Personal -> Certificates //H�r finns de enskilda SSL-certifikat
Trusted Root Certification Authorities //Inneh�ller lista p� utf�rdare man litar p�

Importera rotcertifikatet till Trusted Root Certification Authorities -> Certificates
- H�gerklicka p� Certificates och v�lj "All Tasks" -> Import
- V�lj DevRoot.cer (konstigt nog inte den packade filen) -> Open -> Next -> Finish

Nu �r web.local-certifikatet "trusted" eftersom rotcertifikatet �r trusted.

Importera web.local-certifikatet till Personal-Certificates
- H�gerklicka p� Certificates och v�lj "All Tasks" -> Import
- V�lj web.local.pfx (�ndra i filtret f�r att se filen) -> Open -> Next -> Finish

Koppla certifikatet i IIS s� att vi kan anv�nda det
--------------------------------------------------
- Starta IIS-Manager
- V�lj Default Web Site 
- V�lj Bindings l�ngst ute till h�ger  (inneh�ller en http-bindning)
- Klicka p� Add
- V�lj https. V�lj web.local i dropdown SSL-certificate. Du beh�ver inte ange Host Name.
Du har nu ett certificat som funkar p� https://web.local men datorn kan inte hitta dom�nen.

L�gg till dom�nen i hosts-filen
--------------------------------
Starta anteckningar som administrat�r
�ppna filen C:\Windows\System32\drivers\etc\hosts
L�gg till raden 127.0.0.1 web.local

Man kan nog skapa en web site som heter typ web.local om man vill.

