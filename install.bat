@echo off

:: Проверяем, установлена ли Miniconda
IF NOT EXIST "%USERPROFILE%\miniconda3" (
    echo Устанавливаем Miniconda...
    curl -o miniconda.exe https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe
    start /wait "" miniconda.exe /InstallationType=JustMe /RegisterPython=0 /S /D=%USERPROFILE%\miniconda3
) ELSE (
    echo Miniconda уже установлена.
)

:: Подключаем conda
call %USERPROFILE%\miniconda3\Scripts\activate.bat

:: Проверяем наличие среды py37
conda env list | findstr "py37"
IF %ERRORLEVEL% NEQ 0 (
    echo Создаём среду py37...
    conda create -y -n py37 python=3.7
) ELSE (
    echo Среда py37 уже существует.
)

echo Готово!