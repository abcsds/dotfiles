cd ~/github
for D in `ls`
do
	echo $D;
	cd ~/github/$D;
	lolcommits -e;
done
