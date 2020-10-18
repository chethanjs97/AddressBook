#!/bin/bash -x
firstc=0
lastc=0
emailc=0
mobc=0
distc=0
statec=0
pinc=0
edit=0
del=0
end=0
function useradd(){

	 read -p "enter the first name " n
           patn='^[a-zA-Z]{3,}$'
		if [[ $n =~ $patn ]]
		then
		first[$firstc]=$n
                ((firstc++))
		else
			echo "enter valid name"
		fi
          read -p "enter the last name " m
          if [[ $m =~ $patn ]]
	   then
		last[$lastc]=$m
                ((lastc++))
	   else echo "enter valid name"
	  fi

	read -p "enter the email " e
         pate='^[a-zA-Z0-9]{3,}[@][a-zA-Z]{3,}[.][a-z]{2,}$'
		if [[ $e =~ $pate ]]
		then
		email[$emailc]=$e
                ((emailc++))
		else echo "enter vaild email"
		fi

	read -p "enter the mobile no " mob
        patm='^(91[ ])*[0-9]{10}$'
		if [[ $mob =~ $patm ]]
		then
		mobile[$mobc]=$mob
                ((mobc++))
		else echo "enter vaild mobile no"
		fi

	read -p "enter the disc " dic
        if [[ $dic =~ $patn ]]
	then
		dist[$distc]=$dic
                ((distc++))
	else echo "enter valid district"
	fi


	read -p "enter the state " sta
        if [[ $sta =~ $patn ]]
	then
		state[$statec]=$sta
                ((statec++))
	else echo "enter the valid state"
	fi


	read -p "enter the pincode " p
        patp='^[0-9]{6}$'
	if [[ $p =~ $patp ]]
	then
		pin[$pinc]=$p
                ((pinc++))
	else echo "enter valid pin"
	fi
}
function userEdit(){
 for ((i=0;i<${#first[@]};i++))
                do
                        if [[ ${first[$i]} == $1 ]]
                        then
                                edit=$i
                        fi
                done


                read -p "enter the new email " nemail
                pate='^[a-zA-Z0-9]{3,}[@][a-zA-Z]{3,}[.][a-z]{2,}$'
		if [[ $nemail =~ $pate ]]
		then
			email[$edit]=$nemail
		else echo "enter vaild email"
		fi


                read -p "enter the new phone no " nmob
                patm='^[0-9]{10}$'
		if [[ $nmob =~ $patm ]]
		then
			mobile[$edit]=$nmob
                else
			echo "enter vaild mobile number"
		fi


		read -p "enter the new dic " ndic
                patd='^[a-zA-Z]{3,}$'
		if [[ $ndic =~ $patd ]]
		then
		dist[$edit]=$ndic
                else
			echo "enter valid dictrict name"
		fi


		read -p "enter the new state " nsta
                if [[ $sta =~ $patd ]]
		then
			state[$edit]=$nsta
		else echo "enter the valid state name"
		fi


                read -p "enter the new pincode " np
                patp='^[0-9]{6}$'
		if [[ $np =~ $patp ]]
		then
			pin[$edit]=$np
		else echo "enter valid pincode"
		fi
}
function userDelete(){
 for ((i=0;i<${#first[@]};i++))
                do
                        if [[ ${first[$i]} == $1 ]]
                        then
                                del=$i
                        else
				echo "name not found"
			fi
                done
                unset first[$del]
                unset last[$del]
                unset email[$del]
                unset mobile[$del]
                unset dist[$del]
                unset state[$del]
                unset pin[$del]
}
function userSearch(){
for ((i=0;i<${#first[@]};i++))
                do
                        if [[ ${first[$i]} == $1 ]]
                        then
                                search=$i
                        else
                                echo "name not valid"

                        fi
                done
                echo "the first name is ${first[$search]}"
                echo "the last name is ${last[$search]}"
                echo "the email is ${email[$search]}"
                echo "the mobile no is ${mobile[$search]}"
                echo "the dist name is ${dist[$search]}"
                echo "The state is ${state[$search]}"
                echo "The pincode is ${pin[$search]}"
}
until [ $end -eq 1 ]
do
read -p "select the option 1)add 2)edit 3)delet  4)search " op
case $op in
	1) useradd;;
	2)	read -p "enter the name you wnat to edit " ename
		userEdit $ename
		;;
	3)
		 read -p "enter the name you want to delet " dname
                userDelete $dname
		;;
	4)
		 read -p "enter the name you want to search " sname
                userSearch $sname
		;;
	*) echo "are you mad choose valid option"
	;;

esac
echo ${first[@]}
echo ${last[@]}
echo ${email[@]}
echo ${mobile[@]}
echo ${dist[@]}
echo ${state[@]}
echo ${pin[@]}
read -p "select 1)end 2)continew " rep
if [ $rep -eq 1 ]
then
	((end++))
fi
done
