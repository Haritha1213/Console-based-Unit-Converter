#! /bin/bash
#Menu Driven Conversion System
#temperature   #length   #area

echo "------------------Unit Converter-----------------"

meter_convert() {
      case $1 in
              1)
		      con_fact=$(echo "3.844*10^18" | bc)
		      units="Lunar Distance"
		      sym=LD
		      ;;
	      2)
		      con_fact=$(echo "1.496*10^21" | bc)
		      units="Astronomical Unit"
		      sym=AU
		      ;;
	      3)
		      con_fact=$(echo "9.461*10^15" | bc)
		      units="Light Year"
		      sym=ly
		      ;;
	      4)
		      con_fact=$(echo "1000" | bc)
		      units="Kilometer"
		      sym=km
		      ;;
	      5)
		      con_fact=$(echo "1" | bc)
		      units="Meter"
		      sym=m
		      ;;
	      6)
		      con_fact=$(echo "0.01" | bc)
		      units="Centimeter"
		      sym=cm
		      ;;
	      7)
		      con_fact=$(echo "0.001" | bc)
		      units="Millimeter"
		      sym=mm
		      ;;
	      8)
		      con_fact=$(echo "1*10^-6" | bc)
		      units="Micrometer"
		      sym=um
		      ;;
	      9)
		      con_fact=$(echo "1*10^-9" | bc)
		      units="Nanometer"
		      sym=nm
		      ;;
	     10)
		     con_fact=$(echo "0.3048" | bc)
		      units="Foot"
		      sym=ft
		     ;;
	     11)
		     con_fact=$(echo "1609.34" | bc)
		      units="Mile"
		      sym=mi
		     ;;
	     12)
		     con_fact=$(echo "0.0254" | bc)
		      units="Inch"
		      sym=in
		     ;;
	     13)
		     con_fact=$(echo "1852" | bc)
		      units="Nautical Mile"
		      sym=nmi
		     ;;

esac
}


converter() {
      case $1 in
	      1)
		      echo "-------------Temperature--------------"
		      echo -e "1. Celsius\n2. Kelvin\n3. Farenheit"
		      read -p "Conversion From: " fromtemp
		      read -p "Conversion to: " totemp
		       
		      if [ $fromtemp = 1 ]; then
			      read -p "Enter temperature in Celsius: " temp
			      if [ $totemp = 2 ]; then
				      echo "Celsius to Kelvin"
				      conv=$(echo 273.15 + $temp | bc)
				      echo "Temperatur in Celsius is: " $temp " C"
				      echo "Temperature in Kelvin is: " $conv " K"

			      elif [ $totemp = 3 ]; then
				      echo "Celsius to Fareheit"
				      conv=$(echo $temp * 1.8 + 32 | bc)
				      echo "Temperature in Celsius is: " $temp " C"
				      echo "Temperature in Farenheit is: " $conv " F"
				      
			     else
				     echo "Invalid option"
		
		 	      fi

	              elif [ $fromtemp = 2 ]; then
			      read -p "Enter temperature in Kelvin: " temp
			      if [ $totemp = 1 ]; then
				      echo "Kelvin to Celsius" 
				      conv=$(echo $temp - 273.15 | bc)
				      echo "Temperature in Kelvin is: " $temp " K"
				      echo "Temperatur in Celsius is: " $conv " C"
			      elif [ $totemp = 3 ]; then
				      echo "Kelvin to Farenheit: "
				      conv=$(echo "($temp - 273.15) * 1.8 + 32" | bc)
				      echo "Temperature in Kelvin: " $temp " K"
				      echo "Temperature in Farenheit is: " $conv " F"
			      else
				      echo "Invalid option"
			      fi

		       elif [ $fromtemp = 3 ]; then
			       read -p "Enter temperature in Farenheit: " temp
			       if [ $totemp = 1 ]; then
				       echo "Farenheit to Celsius"
				       conv=$(echo "($temp - 32) / 1.8" | bc )
				       echo "Temperature in Farenheit is: " $temp " F"
				       echo "Temperature in Celsius is: " $conv " C"
				elif [ $totemp = 2 ]; then
					echo "Farenheit to Kelvin"
					conv=$(echo "($temp - 32) / 1.8 + 273.15" | bc )
				       echo "Temperature in Farenheit is: " $temp " F"
				       echo "Temperature in Kelvin is: " $conv " K"
			      else
				      echo "Invalid option"
			      fi

		     fi
		     ;;

	     2)
		      
		      echo "-------------Length--------------"
		      echo -e "1. Lunar distance (LD)\n2. Astronomical Unit (AU)\n3. Light Year (ly)\n4. Kilometer (km)\n5. Meter (m)\n6. Centimeter (cm)\n7. Millimeter (mm)\n8. Micrometer (um)\n9. Nanometer (nm)\n10. Foot (ft)\n11. Mile (mi)\n12. Inch (in)\n13. Nautical mile(nmi)"
		      read -p "Conversion From: " fromlen
		      read -p "Conversion to: " tolen

		      meter_convert $fromlen
		      meter_fact=$(echo $con_fact | bc)
		      fromunits=$units
		      fromsym=$sym
                      read -p "Enter length in $fromunits: " len
		      to_meter=$(echo "$meter_fact*$len" | bc)
                      
		      meter_convert $tolen
		      reverse_fact=$(echo $con_fact | bc)
		      tounits=$units
		      tosym=$sym
		      res=$(echo " scale=10; $to_meter/$reverse_fact" | bc)
		      echo "The given lenth in $fromunits is = $len $fromsym"
		      echo "Length in $tounits is = $res $tosym"
                      
           esac
		     }

echo -e "1. Temperature\n2. Length\n3.Area"
read -p "Enter your choice: " choice

converter $choice
