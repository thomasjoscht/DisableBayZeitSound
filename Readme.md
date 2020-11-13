# Disable BayZeit Sound #
Das Bayerische Zeitmanagementsystem (**BayZeit**) ist eine Anwendung, welche vom Landesamt für Finanzen (LfF) des Freistaats Bayern für die Zeiterfassung der Mitarbeiter im öffentlichen Dienst verwendet wird. Diese wird für gewöhnlich im Internet Explorer gestartet.

Mit dem Programm **DisableBayZeitSound** kann der Sound, welcher beim Start der BayZeit Anwendung abgespielt wird, deaktiviert werden.

## Funktionsweise ##

Das Programm **DisableBayZeitSound** besteht aus einem einzigen Powershell-Skript. Dieses setzt einen Wert in der Registry welcher dazu führt, dass der Sound beim Start *an diesem Tag* nicht mehr abgespielt wird.

Damit der Sound dauerhaft deaktiviert ist, muss das Powershell-Skript einmal täglich vor dem Start von BayZeit ausgeführt werden. 

## Installation ##
Zur automatisierten Ausführung des Skripts empfiehlt es sich, dieses lokal als regelmäßig Aufgabe einzuplanen. Dabei ist es meist ausreichend, wenn das Programm bei der Windows Anmeldung eines Nutzers ausgeführt führt. 

Die nötigen Schritte sind:

1. Kopiere die DisableBayZeitSound.ps1 an eine beliebige Stelle (z.B. nach %UserProfile%)
2. Erstelle eine Aufgabe in der Aufgabenplanung mit folgenden Einstellungen:
	- Unabhängig von der Benutzeranmeldung ausführen
	- Trigger: Bei Anmeldung
	- Aktion erstellen: 
	- Aktion: Programm starten
	- Skript: "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe";
	- Argumente: -windowstyle hidden -file "%UserProfile%\DisableBayZeitSound.ps1"
3. **FERTIG!** Erfreue dich über die Stille 😊