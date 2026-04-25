# Aquarium Manager 🐠

Eine Flutter-App zum Erstellen und Verwalten von Aquarien – gebaut als technische Aufgabe für **ATI Aquaristik**.

---

## So startest du die App

**Voraussetzungen:**
- Flutter SDK (3.2+)
- Chrome Browser

**Starten:**

```bash
git clone https://github.com/itsbmed/aquarium-manager.git
cd aquarium-manager
flutter pub get
flutter run -d chrome
```

---

## Was kann die App?

- Name für das Aquarium eingeben
- Maße eingeben (Länge, Breite, Höhe in cm)
- Volumen wird automatisch in Liter berechnet
- Korallentyp auswählen (SPS, LPS, Mixed)
- Eingabevalidierung (keine negativen Werte, keine leeren Felder)
- **Bonus:** Mehrere Aquarien in einer Liste anzeigen (ohne Persistenz)

---

## Projektstruktur
lib/
├── main.dart              # Einstiegspunkt + Navigation
├── app_colors.dart        # Farbpalette der App
└── screens/
├── aquarium_form.dart  # Formular zum Erstellen
└── aquarium_list.dart  # Listenansicht

---

## Architektur

Die App ist einfach und übersichtlich aufgebaut:

- **main.dart** verwaltet die Tab-Navigation und die Aquarienliste im Speicher
- **aquarium_form.dart** enthält das Formular mit Validierung und Volumenberechnung
- **aquarium_list.dart** zeigt die erstellten Aquarien als Karten an

Das Volumen wird bei jeder Eingabe in Echtzeit berechnet:
**(Länge × Breite × Höhe) / 1000 = Liter**

---

## Entscheidungen

- **Flutter** gewählt, weil es in der Stellenausschreibung erwähnt wurde
- **Einfache Struktur** – kein Over-Engineering, der Code soll lesbar und nachvollziehbar sein
- **Eigenes Design** – UI inspiriert von ATI Aquaristik

---

Gebaut mit Flutter 🩵