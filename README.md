# Adatbázis és Projekt Beállítása  

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

## Hasznos JSON Konvertáló Eszközök  

### 🔹 [JSON Utils](https://jsonutils.com/)  
- Legjobb **C#-hoz**, de támogatja **JS, PHP, TS**-t is.  

### 🔹 [JSON to Mongoose](https://transform.tools/json-to-mongoose)  
- **MongoDB modellek** generálására.  

### 🔹 [JSON to TypeScript](https://transform.tools/json-to-typescript)  
- A legjobb **TypeScript interfészekhez**.  

### 🔹 [JSON2CSharp](https://json2csharp.com/)  
- Általános JSON konverzió **szinte minden nyelvhez**.