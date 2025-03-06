#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ VALENTINO'S SALON ~~~~~\n"

MAIN_MENU() {

  #If something happens
  if [[ $1 ]]
  then 
    #Print it
    echo -e "$1"
  fi

  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id;")
  echo -e "Welcome to My Salon, how can I help you?\n"
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do 
    echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_TO_SELECT

  #If the selected service is not a number:
  if [[ ! $SERVICE_ID_TO_SELECT =~ ^[0-9]+$ ]] 
  then
    #Send to main menu
    MAIN_MENU "That is not a valid service number."

  else 
    #Get the selected service:
    SELECTED_SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_TO_SELECT;")
    #If does not exist:
    if [[ -z $SELECTED_SERVICE_NAME ]]
    then
      #Send to main menu
      MAIN_MENU "I could not find that service."
    else
      MAKE_THE_APPOINTMENT
    fi
  fi
}

MAKE_THE_APPOINTMENT() {
  echo -e "\nWhat's your phone number?"
  read PHONE_NUMBER

  #get customer info
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$PHONE_NUMBER'")
  #if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    #get new customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    #insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$PHONE_NUMBER', '$CUSTOMER_NAME')")
  fi
  #get time of the appointment
  echo -e "\nWhat time would you like your $SELECTED_SERVICE_NAME, $CUSTOMER_NAME?"
  read APPOINTMENT_TIME
  #get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$PHONE_NUMBER'")
  #insert the appointment
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID_TO_SELECT', '$APPOINTMENT_TIME');")
  #send to main menu
}


MAIN_MENU