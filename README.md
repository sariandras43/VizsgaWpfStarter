# Konzolos és asztali alkalmazás starter

## Lehetséges hibák:
# EF Tools --> Javítva!
- Nem látja a CMD a `dotnet ef` globálisan telepített parancsot
- Megoldás : ki kell törölni az létrehozni kívánt projektet, újranyitni a CMD-t, majd újból megcsinálni

## Első módszer: start_with_create_all.bat
### Tudnivalók
- Létrehozza a konzolos és WPF alkalmazást, egy solution-ön belül, a script mappájába
### Előfeltételek:
- XAMPP vagy valamilyen mysql szervernek a futása a 3306-os porton
- Létező adatbázis
- Database.cs, example.xaml, example.xaml.cs fájloknak a script mellett kell lenniük
### 0.: Adatbázis létrehozása megadott script alapján, dotnet-ef tool telepítése
- `dotnet tool install --global dotnet-ef --version 8.0.11` parancs futtatása vagy az install_dotnet_ef_tools.bat futtatása
### 1.: Konzolos projekt és adatbázis nevének megadása
### 2.: MainWindow.xaml.cs átalakítások
- Build errort dob, mert általánosan van megfogalmazva az osztály(Class1), ezt átirva le is fordul
### 4.: Feladat alapján GUI és code-behind elkészítése


## Második módszer: start_with_create.bat
### Tudnivalók
- Létrehozza a WPF alkalmazást a script mappájába
### Előfeltételek:
- XAMPP vagy valamilyen mysql szervernek a futása a 3306-os porton
- Létező adatbázis
- Database.cs, example.xaml, example.xaml.cs fájloknak a script mellett kell lenniük
### 0.: Adatbázis létrehozása megadott script alapján, dotnet-ef tool telepítése
- `dotnet tool install --global dotnet-ef --version 8.0.11` parancs futtatása vagy az install_dotnet_ef_tools.bat futtatása
### 1.: WPF projekt és adatbázis nevének megadása
- Teljes elnevezést kell megadni
### 2.: MainWindow.xaml.cs átalakítások
- Build errort dob, mert általánosan van megfogalmazva az osztály(Class1), ezt átirva le is fordul
### 4.: Feladat alapján GUI és code-behind elkészítése


## Harmadik módszer: start.bat
### Tudnivalók
- Telepíti a EF-et és a függőségeit, megcsinálja a modelleket és context-et a Data mappába
### Előfeltételek:
- XAMPP vagy valamilyen mysql szervernek a futása a 3306-os porton
- Létező adatbázis
- A scriptnek a WPF projekt mappájában, a .csproj mellett kell lennie
### 0.: Adatbázis létrehozása megadott script alapján, dotnet-ef tool telepítése
- `dotnet tool install --global dotnet-ef --version 8.0.11` parancs futtatása vagy az install_dotnet_ef_tools.bat futtatása
### 1.: WPF projekt és adatbázis nevének megadása
- Teljes elnevezést kell megadni
### 2.: MainWindow.xaml.cs átalakítások
- Build errort dob, mert általánosan van megfogalmazva az osztály(Class1), ezt átirva le is fordul
### 4.: Feladat alapján GUI és code-behind elkészítése

# Hasznos JSON Konvertáló Eszközök  

## 🔹 [JSON Utils](https://jsonutils.com/)  
- Legjobb **C#-hoz**, de támogatja **JS, PHP, TS**-t is.  

## 🔹 [JSON to Mongoose](https://transform.tools/json-to-mongoose)  
- **MongoDB modellek** generálására.  

## 🔹 [JSON to TypeScript](https://transform.tools/json-to-typescript)  
- A legjobb **TypeScript interfészekhez**.  

## 🔹 [JSON2CSharp](https://json2csharp.com/)  
- Általános JSON konverzió **szinte minden nyelvhez**.