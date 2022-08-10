echo "`date`   $0: gestart"

cd `dirname $0`
HIER=`pwd`
IK=`basename $0 .sh`
LMN_STATION=`echo $IK | awk -F_ '{ print $3 }'`
PER=`echo $IK | awk -F_ '{ print $4 }'`
#echo "    IK=$IK LMN_STATION=$LMN_STATION PER=$PER"

./lmn_pm_${LMN_STATION}_$PER.sh | sed 's/^/    /'
ls -l ../lst/lmn_pm_${LMN_STATION}_raw_$PER.lst | sed 's/^/    /'

GEVONDEN="`egrep -v '^-- ' ../lst/lmn_pm_${LMN_STATION}_raw_$PER.lst`"
[ -z "$GEVONDEN" ] && {
    echo "`date`   $0: niets gevonden"
} || {
    echo "    `ls -l ../php/lmn_pm.php` $LMN_STATION $PER"
    php ../php/lmn_pm.php $LMN_STATION $PER
    echo "    `ls -l ../lst/lmn_pm_${LMN_STATION}_cal_$PER.lst`"
    echo "    `ls -l ../lst/lmn_pm_${LMN_STATION}_int_$PER.lst`"

    ls -l ../plt/lmn_pm_${LMN_STATION}_$PER.plt | sed 's/^/    /'
    ls -l ../../pm/lst/mjs_pm_0719_cal_$PER.lst | sed 's/^/    /'
    AANTAL=`cat ../../pm/lst/mjs_pm_0719_cal_$PER.lst | awk '{ print $3 }' | sort | uniq | wc -l`
    [ $AANTAL -lt 2 ] && {
        echo "geen bruikbare gegevens; geen plot"
        echo "# geen bruikbare gegevens; geen plot" >> ../../pm/lst/mjs_pm_0719_cal_$PER.lst
    } || {
        ../plt/lmn_pm_${LMN_STATION}_$PER.plt
        ls -l ../png/lmn_pm_${LMN_STATION}_$PER.png | sed 's/^/    /'
    }
    echo ""

    ./lmn_paste_${LMN_STATION}_${PER}.sh | sed 's/^/    /'
    ls -l ../lst/lmn_pm_${LMN_STATION}_pas_$PER.lst | sed 's/^/    /'
    PDDC="`date '+%H %M' | awk '{ printf("%02d%02d", $1, $2) }'`"
    cp -p ../lst/lmn_pm_${LMN_STATION}_pas_$PER.lst ../lst/lmn_pm_${LMN_STATION}_pas_${PER}_$PDDC.lst
    echo "        copied: `ls -l ../lst/lmn_pm_${LMN_STATION}_pas_${PER}_$PDDC.lst`"
    AANTAL1=`grep -v '^#' ../lst/lmn_pm_${LMN_STATION}_pas_$PER.lst | awk '{ print $3 }' | grep -v '?' | sort | uniq | wc -l`
    echo "    AANTAL1=$AANTAL1"
    [ $AANTAL1 -lt 2 ] && {
        echo "geen bruikbare gegevens; geen sc plot"
        echo "# geen bruikbare gegevens; geen sc plot" >> ../lst/lmn_pm_${LMN_STATION}_pas_$PER.lst
    } || {
        ls -l ../plt/lmn_pm_${LMN_STATION}_sc_$PER.plt | sed 's/^/    /'
        ../plt/lmn_pm_${LMN_STATION}_sc_$PER.plt
        ls -l ../png/lmn_pm_${LMN_STATION}_sc_$PER.png | sed 's/^/    /'
    }

    echo "`date`   $0: gestopt"
}
echo ""

