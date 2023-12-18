# PackageManagerJSONEditor

Sample form to edit dependencies JSON files

> [!WARNING]  
> Not a released feature.

<img width="621" alt="Screenshot 2023-12-16 at 18 16 22" src="https://github.com/e-marchand/MyPMHDI/assets/129385512/63b38d2c-0ca0-4dc1-8143-1cc77345b5ec">

## as demo

Just launch the base, the form will be launch to edit this project dependencies.

## as component

download this project in same parent folder of your base

then create into your project a file named `Project/Sources/dependencies.json` with this content:

```json
{"dependencies": { "PackageManagerJSONEditor": {}}}
```

And open your base (or restart if already started).

> [!TIP]  
> You could execute this code in your base too, to create the file
```4d
Folder(fk database folder).file("Project/Sources/dependencies.json").setText(JSON Stringify({dependencies: {PackageManagerJSONEditor: {}}}))
```

You could now launch the form to edit your project dependencies using the shared method `ShowPackageManagerForm`

> [!NOTE]  
> The created environment is created by default in the database folder ([code here](https://github.com/e-marchand/PackageManagerJSONEditor/blob/main/Project/Sources/Methods/GetEnvFile.4dm#L17)). Maybe it could be better to create it in parent folder to share with other components.

## TODO

- [ ] [all added folders to environment are added using absolute path, maybe add it as relative path if inside base and maybe also if in parent folder](https://github.com/e-marchand/PackageManagerJSONEditor/blob/main/Project/Sources/Methods/AddDependencyPathToEnv.4dm#L22)
