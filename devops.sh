#从代码库拉取最新代码
#脚本前提：
#1.已经使用git clone 拉取项目到本地1
#2.默认安装了maven环境，且已经配置了环境变量
#3.默认安装了docker环境
#4.默认完成了Dockerfile（随包附送样例）

#从远程代码库拉取代码，请根据实际情况，替换下面的分支{origin newBranch}
git pull origin master

#将项目带包
mvn clean package -Dmaven.test.skip=true

#停止上个版本的容器，{devops}根据自己的容器名字替换
docker stop image_dataset_api

#去除该容器,{devops}根据自己的容器名字替换
docker rm image_dataset_api

#清除上个版本的镜像,{mason/devops}根据自己的镜像名替换
docker rmi img:dataset

#将项目新版本做成docker镜像，{mason/devops}根据自己的镜像名替换
docker build -t img:dataset .

#运行该镜像，生成容器。也可以考虑使用创建子网，在使用内网Ip的时候请提前创建内网网段

docker run  -d --name image_dataset_api -v /home/imageFile:/home/imageFile -v /home/image_zip:/home/image_zip -v /home/static:/home/static -p 8080:8080 -p 443:443 img:dataset

