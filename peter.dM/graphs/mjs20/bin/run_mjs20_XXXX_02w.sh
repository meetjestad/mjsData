echo "$0 `date`: start"
echo ""

cd `dirname $0` 
HIER=`pwd`
IK=`basename $0 .sh`


#for SH in run_mjs20_????_02w.sh run_mjs20_????_?_02w.sh
for SH in run_mjs20_????_02w.sh 
do
    [ `basename $SH .sh` != $IK ] && {
        [ -x $SH ] && {
            ls -l $SH | sed 's/^/    /'
            ./$SH | sed 's/^/    /'
            sleep 2
        }
    }
done

echo "$0 `date`: einde"

echo ""
echo ""
echo ""
echo ""
