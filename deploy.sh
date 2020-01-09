openssl aes-256-cbc -K $encrypted_0c35eebf403c_key -iv $encrypted_0c35eebf403c_iv in secrets.tar.enc -out secrets.tar -d

tar xvf secrets.tar

# docker build -t gcr.io/charged-formula-262616/web-client:latest -t gcr.io/charged-formula-262616/web-client:$SHA  -f ./client/Dockerfile ./client
# docker build -t gcr.io/charged-formula-262616/web-nginx:latest -t gcr.io/charged-formula-262616/web-nginx:$SHA -f ./nginx/Dockerfile ./nginx
# docker build -t gcr.io/charged-formula-262616/web-server:latest -t gcr.io/charged-formula-262616/web-server:$SHA -f ./server/Dockerfile ./server

# docker push gcr.io/charged-formula-262616/web-client
# docker push gcr.io/charged-formula-262616/web-nginx
# docker push gcr.io/charged-formula-262616/web-server

#  curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-274.0.1-linux-x86_64.tar.gz

#  tar zxvf google-cloud-sdk-274.0.1-linux-x86_64.tar.gz google-cloud-sdk

#  ./google-cloud-sdk/install.sh

#  sudo docker container stop $(docker container ls -aq)
# echo "1 " | gcloud init 

# source /home/travis-ci/google-cloud-sdk/path.bash.inc

# gcloud compute instances set-service-account 6621010990308869636 --scopes=storage-rw
# gcloud components install docker-credential-gcr

# sudo docker-credential-gcloud list

ls

ssh -i ./deploy_key_open travis-ci@104.196.226.118 << EOF

 echo $USER

 gcloud auth configure-docker

 sudo docker pull gcr.io/charged-formula-262616/web-nginx
 
 sudo docker pull gcr.io/charged-formula-262616/web-client
 
 sudo docker pull gcr.io/charged-formula-262616/web-server

 sudo docker run --rm -d -p 3000:3000 gcr.io/charged-formula-262616/web-client

 sudo docker run --rm -d -p 80:80 -p 443:443 gcr.io/charged-formula-262616/web-nginx

 sudo docker run --rm -d -p 5000:5000 gcr.io/charged-formula-262616/web-server

 sudo docker run --rm -d -v /database_data:/var/lib/postgresql/data -e POSTGRES_USER -e POSTGRES_PASSWORD -e POSTGRES_DB postgres 

EOF


