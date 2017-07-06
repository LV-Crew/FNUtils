#INCLUDE "BOX.CH"

PROCEDURE HMenue
//PROCEDURE zum anzeigen des Hauptmen�s

//Version := "1.02.01"    //Versionsnummer des Programmes
//PDatum  := "30.08.1999" //Erstellungsdatum des Programmes

VorCMenue()               //unbedingt erforderlich

Menueende := 1            //wenn 2 wird das Men� verlassen
Zeiger    := 3            //Men�zeiger

DO WHILE Menueende <> 2
   Hilfe  := "HMenue"                                 //gibt an f�r was eine
                                                      //Hilfe ben�tigt wird
                                                      //Ausgabe von CMenue
                                                      //z.B. HMenue-3
   CMenueUS := ""                                     //�berschrift des Menues
   CMenueOZ := 10                                     //Obere Zeile
   CMenueVS := 14                                     //Vordere Spalte
   CMenueHS := 57                                     //Hintere Spalte
   ESCErro := 0                                       //gibt den Wert an, den
                                                      //Menueende annimt, wenn
                                                      //die ESC-Taste gedr�ckt
                                                      //wird
   F3Text := "3  [F3] Artikelinformation                " //F3 Text
   F4Text := ""                                           //F4 Text
   F5Text := "5  [F5] Datenpflege                       " //F5 Text
   F6Text := ""                                           //F6 Text
   F7Text := "7  [F7] Rechnungsjournal anzeigen/drucken " //F7 Text
   F8Text := ""                                           //F8 Text
   F9Text := ""                                           //F9 Text
   F0Text := "0 [F10] Einstellungen/Ende                " //F0 Text

   zeile  := 5 //Zeilennummer
   spalte := 0 //Spaltennummer
   SETCOLOR(FarbeHG)
   DO WHILE zeile <> 25
      DO WHILE spalte <> 80
         @ zeile, spalte SAY "�"
         spalte := spalte + 1
      ENDDO
      spalte := 0
      zeile  := zeile + 1
   ENDDO

   DatumsZ()
   SETCOLOR(FarbeTi)
   @ 01,00 CLEAR TO 04,80
   DISPBOX(01,00,04,79,B_SINGLE)
   thelp  := "Tobi's F+N Utilities � Version: " + FNUVersion + " � Stand: "
   thelp  := thelp + Datum + " � (c) " + Copyright + " TB"
   spalte := ((80 - LEN(THelp)) / 2)
   @ 02,spalte SAY THelp
   spalte := ((80 - LEN(lizenz)) / 2)
   @ 03,spalte SAY lizenz
   SETCOLOR(FarbeUS)
   @ 09,14 SAY SPACE(44)
   @ 09,24 SAY "H a u p t a u s w a h l"
   SETCOLOR("N/N")
   @ 10,58 SAY SPACE(1)

   CMenueH()
   DO CASE
      CASE Menueende = 3                              //F3 Befehl
         
      CASE Menueende = 4                              //F4 Befehl
         
      CASE Menueende = 5                              //F5 Befehl
         DPMenue()
      CASE Menueende = 6                              //F6 Befehl
         
      CASE Menueende = 7                              //F7 Befehl
         RJournal()
      CASE Menueende = 8                              //F8 Befehl
         
      CASE Menueende = 9                              //F9 Befehl
         
      CASE Menueende = 0                              //F10 Befehl
         Endemenue()
   ENDCASE
ENDDO
NachCMenue() //unbedingt erforderlich

//****************************************************************************

PROCEDURE DPMenue
//PROCEDURE zum anzeigen des Datenpflegemen�s

//Version := "1.02.01"    //Versionsnummer des Programmes
//PDatum  := "28.08.1999" //Erstellungsdatum des Programmes

VorCMenue()               //unbedingt erforderlich

Menueende := 1            //wenn 2 wird das Men� verlassen
Zeiger    := 3            //Men�zeiger

DO WHILE Menueende <> 2
   Hilfe  := "DPMenue"                                //gibt an f�r was eine
                                                      //Hilfe ben�tigt wird
                                                      //Ausgabe von CMenue
                                                      //z.B. DPMenue-3
   CMenueUS := "[Datenpflege]"                        //�berschrift des Menues
   CMenueOZ := 06                                     //Obere Zeile
   CMenueVS := 32                                     //Vordere Spalte
   CMenueHS := 77                                     //Hintere Spalte
   ESCErro := 2                                       //gibt den Wert an, den
                                                      //Menueende annimt, wenn
                                                      //die ESC-Taste gedr�ckt
                                                      //wird
   F3Text := "3  [F3] Programmausgleich                   " //F3 Text
   F4Text := "4  [F4] Datenpflege �ber Artikel-Dateien    " //F4 Text
   F5Text := ""                                             //F5 Text
   F6Text := "6  [F6] Einser-Umwandlung                   " //F6 Text
   F7Text := "7  [F7] Artikeldatei komplett neu erstellen " //F7 Text
   F8Text := "8  [F8] Artikeldaten l�schen                " //F8 Text
   F9Text := "9  [F9] Langtext-Datei �berpr�fen           " //F9 Text
   F0Text := "0 [F10] Zur�ck zur Hauptauswahl             " //F0 Text
   CMenueH()
   DO CASE
      CASE Menueende = 3                              //F3 Befehl
         Arti2() //Progausg()
      CASE Menueende = 4                              //F4 Befehl
         DPArtikelM()
      CASE Menueende = 5                              //F5 Befehl
         
      CASE Menueende = 6                              //F6 Befehl
         EinserUmwan()
      CASE Menueende = 7                              //F7 Befehl
         ADneuErstellen()
      CASE Menueende = 8                              //F8 Befehl
         ADLMenue()
      CASE Menueende = 9                              //F9 Befehl
         LDPruefen()
      CASE Menueende = 0                              //F10 Befehl
         Menueende := 2
      ENDCASE
ENDDO
NachCMenue() //unbedingt erforderlich

//****************************************************************************

PROCEDURE DPArtikelM
//PROCEDURE zum anzeigen des Datenpflege-ASCII-Men�s

//Version := "1.01.00"    //Versionsnummer des Programmes
//PDatum  := "26.08.1999" //Erstellungsdatum des Programmes

VorCMenue()               //unbedingt erforderlich

Menueende := 1            //wenn 2 wird das Men� verlassen
Zeiger    := 3            //Men�zeiger

DO WHILE Menueende <> 2
   Hilfe  := "DPArtikelM"                             //gibt an f�r was eine
                                                      //Hilfe ben�tigt wird
                                                      //Ausgabe von CMenue
                                                      //z.B. DPArtikelM-3
   CMenueUS := "[Datenpflege �ber Artikel-Dateien]"   //�berschrift des Menues
   CMenueOZ := 07                                     //Obere Zeile
   CMenueVS := 03                                     //Vordere Spalte
   CMenueHS := 49                                     //Hintere Spalte
   ESCErro := 2                                       //gibt den Wert an, den
                                                      //Menueende annimt, wenn
                                                      //die ESC-Taste gedr�ckt
                                                      //wird
   F3Text := "3  [F3] Datenpflege �ber Datanorm4-Dateien   " //F3 Text
   F4Text := "4  [F4] Datanorm4-Infos                      " //F4 Text
   F5Text := "5  [F5] Datenpflege �ber AEG-Dateien         " //F5 Text
   F6Text := "6  [F6] Datenpflege �ber Blomberg-Dateien    " //F6 Text
   F7Text := "7  [F7] Datenpflege �ber Imperial-Dateien    " //F7 Text
   F8Text := "8  [F8] Datenpflege �ber Liebherr-Dateien    " //F8 Text
   F9Text := "9  [F9] Datenpflege �ber F+N-Artikel-Dateien " //F9 Text
   F0Text := "0 [F10] Zur�ck zum Datenpflegemen�           " //F0 Text
   CMenueH()
   DO CASE
      CASE Menueende = 3                              //F3 Befehl
         Data4()
      CASE Menueende = 4                              //F4 Befehl
         ShowFile("Data4Infos", "FNUData4.TXT")
      CASE Menueende = 5                              //F5 Befehl
         AEG()
      CASE Menueende = 6                              //F6 Befehl
         Blomberg()
      CASE Menueende = 7                              //F7 Befehl
         Imperial()
      CASE Menueende = 8                              //F8 Befehl
         Liebherr()
      CASE Menueende = 9                              //F9 Befehl
         Arti2() //Progausg()
      CASE Menueende = 0                              //F10 Befehl
         Menueende := 2
      ENDCASE
ENDDO
NachCMenue() //unbedingt erforderlich

//****************************************************************************

PROCEDURE ADLMenue
//PROCEDURE zum anzeigen des Artikeldaten-l�schen-Men�s

//Version := "1.02.01"    //Versionsnummer des Programmes
//PDatum  := "28.08.1999" //Erstellungsdatum des Programmes

VorCMenue()               //unbedingt erforderlich

Menueende := 1            //wenn 2 wird das Men� verlassen
Zeiger    := 3            //Men�zeiger

DO WHILE Menueende <> 2
   Hilfe  := "ADLMenue"                               //gibt an f�r was eine
                                                      //Hilfe ben�tigt wird
                                                      //Ausgabe von CMenue
                                                      //z.B. ADLMenue-3
   CMenueUS := "[Artikeldaten l�schen]"               //�berschrift des Menues
   CMenueOZ := 07                                      //Obere Zeile
   CMenueVS := 03                                      //Vordere Spalte
   CMenueHS := 43                                     //Hintere Spalte
   ESCErro := 2                                       //gibt den Wert an, den
                                                      //Menueende annimt, wenn
                                                      //die ESC-Taste gedr�ckt
                                                      //wird
   F3Text := "3  [F3] L�schen �ber L�schdatei        " //F3 Text
   F4Text := "4  [F4] Artikel mit Lagerb.=0 markieren" //F4 Text
   F5Text := ""                                        //F5 Text
   F6Text := ""                                        //F6 Text
   F7Text := ""                                        //F7 Text
   F8Text := "8  [F8] Artikeldatei l�schen           " //F8 Text
   F9Text := ""                                        //F9 Text
   F0Text := "0 [F10] Zur�ck zur Hauptauswahl        " //F0 Text
   CMenueH()
   DO CASE
      CASE Menueende = 3                              //F3 Befehl
         LDatei()
      CASE Menueende = 4                              //F4 Befehl
         LALB0()
      CASE Menueende = 5                              //F5 Befehl
         
      CASE Menueende = 6                              //F6 Befehl
         
      CASE Menueende = 7                              //F7 Befehl
         
      CASE Menueende = 8                              //F8 Befehl
         ADloeschen()
      CASE Menueende = 9                              //F9 Befehl
         
      CASE Menueende = 0                              //F10 Befehl
         Menueende := 2
   ENDCASE
ENDDO
NachCMenue() //unbedingt erforderlich

//****************************************************************************

PROCEDURE EndeMenue
//PROCEDURE zum anzeigen des Ende-Men�s

//Version := "1.01.01"    //Versionsnummer des Programmes
//PDatum  := "31.08.1999" //Erstellungsdatum des Programmes

VorCMenue()               //unbedingt erforderlich

Menueende := 1            //wenn 2 wird das Men� verlassen
Zeiger    := 3            //Men�zeiger

DO WHILE Menueende <> 2
   Hilfe  := "EndeMenue"                              //gibt an f�r was eine
                                                      //Hilfe ben�tigt wird
                                                      //Ausgabe von CMenue
                                                      //z.B. EndeMenue-3
   CMenueUS := "[Einstellungen/Ende]"                 //�berschrift des Menues
   CMenueOZ := 06                                     //Obere Zeile
   CMenueVS := 37                                     //Vordere Spalte
   CMenueHS := 76                                     //Hintere Spalte
   ESCErro := 2                                       //gibt den Wert an, den
                                                      //Menueende annimt, wenn
                                                      //die ESC-Taste gedr�ckt
                                                      //wird
   F3Text := "3  [F3] Versions-Info                 " //F3 Text
   F4Text := ""                                       //F4 Text
   F5Text := "5  [F5] Einstellungen                 " //F5 Text
   F6Text := ""                                       //F6 Text
   F7Text := "7  [F7] Error-Datei anzeigen          " //F7 Text
   F8Text := "8  [F8] Error-Datei l�schen           " //F8 Text
   F9Text := "9  [F9] F+N-Utilities beenden         " //F9 Text
   F0Text := "0 [F10] Zur�ck zur Hauptauswahl       " //F0 Text
   CMenueH()
   DO CASE
      CASE Menueende = 3                              //F3 Befehl
         Version()
      CASE Menueende = 4                              //F4 Befehl
         
      CASE Menueende = 5                              //F5 Befehl
         Einst()
      CASE Menueende = 6                              //F6 Befehl
         
      CASE Menueende = 7                              //F7 Befehl
         thelp := hdatei + "FNUError.TXT"
         ShowFile("FNUError", thelp)
      CASE Menueende = 8                              //F8 Befehl
         FNUErrorl()
      CASE Menueende = 9                              //F9 Befehl
         SETCOLOR(ColorAlt)
         CLS
         QUIT
      CASE Menueende = 0                              //F10 Befehl
         Menueende := 2
   ENDCASE
ENDDO
NachCMenue() //unbedingt erforderlich
