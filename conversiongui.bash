#! /bin/bash
#Menu Driven Conversion System
#temperature   #length   #area

meter_convert() {
      case $1 in
              "LUNAR_DISTANCE")
		      con_fact=$(echo "3.844*10^8" | bc)
		      units="LUNAR DISTANCE"
		      sym=ld
		      ;;
	      "ASTRONOMICAL_UNIT")
		      con_fact=$(echo "1.496*10^21" | bc)
		      units="ASTRONOMICAL UNIT"
		      sym=au
		      ;;
	      "LIGHT_YEAR")
		      con_fact=$(echo "9.461*10^15" | bc)
		      units="LIGHT YEAR"
		      sym=ly
		      ;;
	      "KILOMETER")
		      con_fact=$(echo "1000" | bc)
		      units="KILOMETER"
		      sym=km
		      ;;
	      "METER")
		      con_fact=$(echo "1" | bc)
		      units="METER"
		      sym=m
		      ;;
	      "CENTIMETER")
		      con_fact=$(echo "0.01" | bc)
		      units="CENTIMETER"
		      sym=cm
		      ;;
	      "MILLIMETER")
		      con_fact=$(echo "0.001" | bc)
		      units="MILLIMETER"
		      sym=mm
		      ;;
	      "MICROMETER")
		      con_fact=$(echo "1*10^-6" | bc)
		      units="MICROMETER"
		      sym=um
		      ;;
	      "NANOMETER")
		      con_fact=$(echo "1*10^-9" | bc)
		      units="NANOMETER"
		      sym=nm
		      ;;
	     "FOOT")
		     con_fact=$(echo "0.3048" | bc)
		      units="FOOT"
		      sym=ft
		     ;;
	     "MILE")
		     con_fact=$(echo "1609.34" | bc)
		      units="MILE"
		      sym=mi
		     ;;
	     "INCH")
		     con_fact=$(echo "0.0254" | bc)
		      units="INCH"
		      sym=in
		     ;;
	     "NAUTICAL_MILE")
		     con_fact=$(echo "1852" | bc)
		      units="NAUTICAL MILE"
		      sym=nmi
		     ;;

esac
}

area_conv(){
    case $1 in
	    "SQUARE_METER")
		    con_fact=$(echo "1" | bc)
		    units="SQUARE METER"
		    sym="m^2"
		    ;;
           "SQUARE_DECIMETER")
		   con_fact=$(echo "0.01" | bc)
		   units="SQUARE DECIMETER"
		   sym="dm^2"
		   ;;
           "SQUARE_CENTIMETER")
		   con_fact=$(echo "0.0001" | bc)
		   units="SQUARE CENTIMETER"
		   sym="cm^2"
		   ;;
           "SQUARE_KILOMETER")
		   con_fact=$(echo "1000000" | bc)
		   units="SQUARE KILOMETER"
		   sym="km^2"
		   ;;
           "SQUARE_MILLIMETER")
		   con_fact=$(echo "0.000001" | bc)
		   units="SQUARE MILLIMETER"
		   sym="mm^2"
		   ;;
           "HECTARE")
		   con_fact=$(echo "10000" | bc)
		   units="HECTARE"
		   sym="ha"
		   ;;
   esac
}


converter() {
      case $1 in
	      "TEMPERATURE")
		      fromtemp=$(zenity --list --title "UNIT CONVERSION SYSTEM" --text "TEMPERATURE CONVERSION " --column "FROM" "CELSIUS" "KELVIN" "FARENHEIT")
		      if [ $? -eq 1 ]; then
                      menu
                      fi

		      totemp=$(zenity --list --title "UNIT CONVERSION SYSTEM" --text "TEMPERATURE CONVERSION " --column "TO" "CELSIUS" "KELVIN" "FARENHEIT")
		     if [ $? -eq 1 ]; then
                      menu
                      fi
 
		    		       
		      if [ $fromtemp == "CELSIUS" ]; then
			      temp=$(zenity --entry --title "UNIT CONVERSION SYSTEM" --text "ENTER TEMPERATURE IN CELSIUS") 
	         		  if [ $? -eq 1 ]; then
                                   menu
                                   fi

			           if [ $totemp == "KELVIN" ]; then
				      conv=$(echo 273.15 + $temp | bc)
				      zenity --info --width 400 --height 100 --title "CELSIUS TO KELVIN CONVERSION" --text "TEMPERATURE IN CELCIUS IS: $temp C\nTEMPERATURE IN KELVIN IS: $conv K"
				  
             
	        	          elif [ $totemp == "FARENHEIT" ]; then
				      conv=$(echo "($temp * 1.8) + 32" | bc)
				      zenity --info --width 400 --height 100 --title "CELSIUS TO FARENHEIT CONVERSION" --text "TEMPERATURE IN CELCIUS IS: $temp C\nTEMPERATURE IN FARENHEIT IS: $conv F"
				       	
		       fi

	              elif [ $fromtemp == "KELVIN" ]; then
			      
			      temp=$(zenity --entry --title "UNIT CONVERSION SYSTEM" --text "ENTER TEMPERATURE IN KELVIN") 
			     if [ $? -eq 1 ]; then
                                   menu
                                   fi

			      if [ $totemp == "CELSIUS" ]; then 
				      conv=$(echo "$temp - 273.15" | bc)

				      zenity --info --width 400 --height 100 --title "KELVIN TO CELSIUS CONVERSION" --text "TEMPERATURE IN KELVIN IS: $temp K\nTEMPERATURE IN CELSIUS IS: $conv C"

			      elif [ $totemp == "FARENHEIT" ]; then
				      conv=$(echo "($temp - 273.15) * 1.8 + 32" | bc)

				      zenity --info --width 400 --height 100 --title "KELVIN TO FARENHEIT CONVERSION" --text "TEMPERATURE IN KELVIN IS: $temp K\nTEMPERATURE IN FARENHEIT IS: $conv F"
			      
			      fi

		       elif [ $fromtemp == "FARENHEIT" ]; then
			       
			      temp=$(zenity --entry --title "UNIT CONVERSION SYSTEM" --text "ENTER TEMPERATURE IN FARENHEIT") 
                              if [ $? -eq 1 ]; then
                                   menu
                                   fi

			      if [ $totemp == "CELSIUS" ]; then
				       conv=$(echo "($temp - 32) / 1.8" | bc )
				      zenity --info --width 400 --height 100 --title "FARENHEIT TO CELSIUS CONVERSION" --text "TEMPERATURE IN FARENHEIT IS: $temp F\nTEMPERATURE IN CELSIUS IS: $conv C"
				elif [ $totemp == "KELVIN" ]; then
					conv=$(echo "($temp - 32) / 1.8 + 273.15" | bc ) 
				      zenity --info --width 400 --height 100 --title  "FARENHEIT TO KELVIN CONVERSION" --text "TEMPERATURE IN FARENHEIT IS: $temp F\nTEMPERATURE IN KELVIN IS: $conv K"
			     
			      fi

		     fi
		     ;;

	     "LENGTH")

		      fromlen=$(zenity --list --width 500 --height 400 --title "UNIT CONVERSION SYSTEM" --text "LENGTH CONVERSION" --column "FROM" "LUNAR_DISTANCE" "ASTRONOMICAL_UNIT" "LIGHT_YEAR" "KILOMETER" "METER" "CENTIMETER" "MILLIMETER" "MICROMETER" "NANOMETER" "FOOT" "MILE" "INCH" "NAUTICAL_MILE") 
                         if [ $? -eq 1 ]; then
                                   menu
                                   fi

		      tolen=$(zenity --list --width 500 --height 400 --title "UNIT CONVERSION SYSTEM" --text "LENGTH CONVERSION" --column "FROM" "LUNAR_DISTANCE" "ASTRONOMICAL_UNIT" "LIGHT_YEAR" "KILOMETER" "METER" "CENTIMETER" "MILLIMETER" "MICROMETER" "NANOMETER" "FOOT" "MILE" "INCH" "NAUTICAL_MILE") 
                         if [ $? -eq 1 ]; then
                                   menu
                                   fi

		      meter_convert $fromlen
		      meter_fact=$(echo $con_fact | bc)
		      fromunits=$units
		      fromsym=$sym


	              len=$(zenity --entry --title "UNIT CONVERSION SYSTEM" --text "ENTER LENGTH IN $fromunits") 
                        
		                   if [ $? -eq 1 ]; then
                                   menu
                                   fi
                      
		      meter_convert $tolen
                      reverse_fact=$(echo $con_fact | bc)
                      tounits=$units
                      tosym=$sym

		      to_meter=$(echo "$meter_fact*$len" | bc)
		      res=$(echo " scale=5; $to_meter/$reverse_fact" | bc)
		      
		      zenity --info --width 400 --height 100 --title  "LENGTH CONVERSION" --text "LENGTH IN $fromunits IS: $len $fromsym\nLENGTH IN $tounits IS: $res $tosym"
                      ;;

		"AREA")
	
		      from_area=$(zenity --list --title "UNIT CONVERSION SYSTEM" --text "AREA CONVERSION " --column "FROM" "SQUARE_METER" "SQUARE_DECIMETER" "SQUARE_CENTIMETER" "SQUARE_KILOMETER" "SQUARE_MILLIMETER" "HECTARE")
		      if [ $? -eq 1 ]; then
                                   menu
                                   fi

		      to_area=$(zenity --list --title "UNIT CONVERSION SYSTEM" --text "AREA CONVERSION " --column "FROM" "SQUARE_METER" "SQUARE_DECIMETER" "SQUARE_CENTIMETER" "SQUARE_KILOMETER" "SQUARE_MILLIMETER" "HECTARE")
		     if [ $? -eq 1 ]; then
                                   menu
                                   fi


                      area_conv $from_area
		      meter_fact=$(echo $con_fact | bc)
		      fromUnits=$units
		      fromSym=$sym

	              area=$(zenity --entry --title "UNIT CONVERSION SYSTEM" --text "ENTER AREA IN $fromUnits")
                      if [ $? -eq 1 ]; then
                                   menu
                                   fi

		      to_meter2=$(echo "$meter_fact*$area" | bc)

		      area_conv $to_area
		      reverse_fact=$(echo $con_fact | bc)
		      toUnits=$units
		      toSym=$sym
		      res=$(echo "scale=5; $to_meter2/$reverse_fact" | bc)
		      
		      zenity --info --width 400 --height 100 --title  "AREA CONVERSION" --text "AREA IN $fromUnits IS: $area $fromSym\nAREA IN $toUnits IS: $res $toSym"
      		       ;;

	      "EXIT")
                       exit
                       ;;		       

	      *)
	              echo "Invalid Option"	      
                      
           esac
		     }
		     
menu(){		     
while [ 1 ]; do
choice=$(zenity --list --width 500 --height 400 --title "UNIT CONVERSION SYSTEM" --text " " --column "SELECT AN OPTION" "TEMPERATURE" "LENGTH" "AREA" "EXIT")
                                  if [ $? -eq 1 ]; then
                                   exit
                                   fi


converter $choice
done
}
menu
