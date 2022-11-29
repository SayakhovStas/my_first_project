tmp_170str=$(curl http://192.168.35.67/issues/$1?key=64f3ecb05e981d2ed83b85d514828ba1ade40519 | sed -e '170!D; s/[a-z<>="":-\_\\\=\/]//g; s/7 //')

x='1 2 3 4 5 6 8'
for i in $x
do
tmp_170str=$(echo $tmp_170str | sed -e 's/ '$i' /;/')
done

op=$(echo $tmp_170str | cut -d';' -f 1 | sed 's/Подразделение //')
fio=$(echo $tmp_170str | cut -d';' -f 2 | sed 's/ФИО сотрудника //')
dr=$(echo $tmp_170str | cut -d';' -f 3 | sed -e 's/Дата рождения //; s/\(..\)\(..\)\(....\)$/\1.\2.\3/')
tel=$(echo $tmp_170str | cut -d';' -f 4 | sed -e 's/Номер телефона //; s/+//; s/^./+7/')
trud=$(echo $tmp_170str | cut -d';' -f 5 | sed 's/Дата трудоустройства //')
nomdov=$(echo $tmp_170str | cut -d';' -f 6 | sed 's/Номер доверенности //')
datadov=$(echo $tmp_170str | cut -d';' -f 7 | sed -e 's/Дата доверенности //; s/\(..\)\(..\)\(....\)$/\1.\2.\3/')
inn=$(echo $tmp_170str | cut -d';' -f 8 | sed 's/Вводить без пробелов -ИНН сотрудника //' )
pass=$(curl http://192.168.35.17:8080/generatepass.php | sed '1!D'| cut -c-8)

data=$op"\t"$dr"\t"$fio"\t$pass\t"$nomdov" от "$datadov"\t"$tel"\t"$inn
if [ -n "$2" ]
then
echo -e $data >> ksup_issue.txt
else
echo -e $data > ksup_issue.txt
fi