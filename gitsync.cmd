set DATESTAMP=%DATE:~10,4%_%DATE:~4,2%_%DATE:~7,2%
set TIMESTAMP=%TIME:~0,2%_%TIME:~3,2%_%TIME:~6,2%
set DATEANDTIME=%DATESTAMP%_%TIMESTAMP%
cd "C:\Users\Fernando\Documents\Visual Studio 2013\Projects\BitOP"
git add .
git commit -am "%DATEANDTIME%"
git push origin master
git pull origin master
pause
