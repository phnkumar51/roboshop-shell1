systemd_setup(){
  print_head Copy SystemD service files
  cp $component.service /etc/systemd/system/$component.service &>>$log_file


 print_head Enable and Restart the Service
  systemctl daemon-reload &>>$log_file

  systemctl enable $component &>>$log_file

  systemctl restart $component &>>$log_file

}

artifact_download(){
  print_head add an application user
  useradd roboshop &>>$log_file

  print_head remove the exisiting content
  rm -rf /app &>>$log_file

  print_head Create an application directory
  mkdir /app &>>$log_file

  print_head Download the content
  curl -L -o /tmp/$component.zip https://roboshop-artifacts.s3.amazonaws.com/$component-v3.zip &>>$log_file
  cd /app

  print_head Extract the files
  unzip /tmp/$component.zip &>>$log_file

}

nodejs(){
  print_head Disable nodejs
  dnf module disable nodejs -y &>>$log_file

  print_head enable and Install nodejs 20
  dnf module enable nodejs:20 -y &>>$log_file

  dnf install nodejs -y &>>$log_file

  useradd roboshop
  cp $component.service /etc/systemd/system/$component.service &>>$log_file

  artifact_download
  cd /app

  print_head Install Nodejs dependencies
  npm install &>>$log_file
  systemd_setup
}

maven_app_setup(){
  print_head Install Java Maven services
  dnf install maven -y &>>$log_file

  artifact_download
  cd /app &>>$log_file

  print_head Install Dependencies
  mvn clean package &>>$log_file
  mv target/$component-1.0.jar $component.jar &>>$log_file
  systemd_setup
}

python_app_setup(){
  print_head Install Python
  dnf install python3 gcc python3-devel -y &>>$log_file

  artifact_download
  cd /app

  print_head Download Python Dependecies
  pip3 install -r requirements.txt &>>$log_file

  systemd_setup
}

print_head(){
  echo -e "\e[36m$*\e[0m"
  echo "################################" &>>$log_file
  echo -e "\e[36m$*\e[0m" &>>$log_file
  echo "################################" &>>$log_file
}

log_file=/tmp/roboshop.log
rm -f $log_file
