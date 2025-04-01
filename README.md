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
### 0.: Adatbázis létrehozása megadott script alapján
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
### 0.: Adatbázis létrehozása megadott script alapján
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
### 0.: Adatbázis létrehozása megadott script alapján
### 1.: WPF projekt és adatbázis nevének megadása
- Teljes elnevezést kell megadni
### 2.: MainWindow.xaml.cs átalakítások
- Build errort dob, mert általánosan van megfogalmazva az osztály(Class1), ezt átirva le is fordul
### 4.: Feladat alapján GUI és code-behind elkészítése








<!-- 

## 0.: Adatbázis létrehozása a feladatban megadott scripttel  

## 0.1. `start.bat` módosítása  
- `dbneve` átnevezése a feladatban megadott adatbázisnévre  
- `start.bat`:  
  - Telepíti a .NET-es Entity Framework csomagokat  
  - Elvégzi a scaffoldot  

## 1. `start.bat` futtatása  
- **Fontos:** A **SAJÁT PROJEKT mappánkban**, egy szinten a MainWindow.xaml-el kell futtatni  
- **(1.1)** Ha zavaróak a táblák elnevezései, átnevezés az újonnan generált contextben  

## 2. `Database.cs` átmásolása  
- **A saját projektbe**  
- `AppContext` átnevezése az új context nevére  
- **Figyelni kell a namespacekre!!!!**  

## 3. `example.xaml` átmásolása  
- **Namespacek miatt célszerű a fő gridet és tartalmát másolni!**  

## 4. `example.xaml.cs` módosításai  
- A szükséges propertyk átnevezése  
- Megjelenítési útvonal beállítása  
- Binding-ok átnevezése XAML-ben 
- Struktúra megváltoztatása, amennyiben szükséges 

 -->
# Hasznos JSON Konvertáló Eszközök  

## 🔹 [JSON Utils](https://jsonutils.com/)  
- Legjobb **C#-hoz**, de támogatja **JS, PHP, TS**-t is.  

## 🔹 [JSON to Mongoose](https://transform.tools/json-to-mongoose)  
- **MongoDB modellek** generálására.  

## 🔹 [JSON to TypeScript](https://transform.tools/json-to-typescript)  
- A legjobb **TypeScript interfészekhez**.  

## 🔹 [JSON2CSharp](https://json2csharp.com/)  
- Általános JSON konverzió **szinte minden nyelvhez**.