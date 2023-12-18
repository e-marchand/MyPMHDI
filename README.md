# MyPMHDI

 sample form to edit dependencies ⚠️ Not a release feature. Just Proof Of Concept

<img width="621" alt="Screenshot 2023-12-16 at 18 16 22" src="https://github.com/e-marchand/MyPMHDI/assets/129385512/63b38d2c-0ca0-4dc1-8143-1cc77345b5ec">


## as demo

just launch the base, the form will edit this project dependencies.


## as component

download this project in same parent folder of your base

then create into your project a file named `Project/Sources/dependencies.json` with content

```json
{"dependencies": { "MyPMHDI": {}}}
```

and restard your base. You could now launch the form using the shared method ShowPackageManagerForm
