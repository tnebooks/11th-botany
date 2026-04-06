## 11th Botany

## Dev

```sh
git clone https://github.com/csebooks/hugo-book themes/hugo-book
hugo server  --themesDir ../ --disableFastRender
```

## Qustion Loader

in Linux

```bash
export QUESTIONS_FOLDER="$PWD/questions"
export PUBLIC_FOLDER="$PWD/public" 
npm run watch --prefix ../hugo-book
```

in Windows `Cmd`

```bash
set QUESTIONS_FOLDER=%cd%\questions
set PUBLIC_FOLDER=%cd%\public
cd themes\hugo-book
npm i
npm run watch
```
