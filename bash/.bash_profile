# ------------------------------------------------------------------  电脑环境  ----------------------------------------------#
# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/bash_profile.pre.bash"
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export PATH=$PATH:${JAVA_HOME}/bin

ANACONDA_PATH=/Users/y/anaconda3
export PATH=$PATH:${ANACONDA_PATH}/bin

# tomcat
tomcat_path=/usr/y/Library/apache-tomcat-8.5.55/bin

node_path=/usr/local/Cellar/node@14/14.19.1
# node_path=/usr/local/Cellar/node@12/12.22.1
export PATH=$PATH:${node_path}/bin

sql_path=/usr/local/Cellar/mysql@5.6/5.6.51
# mysql
export PATH=$PATH:${sql_path}/bin

# android
ANDROID_HOME=/Users/y/Library/Android/sdk
export PATH=$PATH:${ANDROID_HOME}/platform-tools
export PATH=$PATH:${ANDROID_HOME}/tools
export PATH=$PATH:${ANDROID_HOME}/ndk/16.1.4479499

# gradle
GRADLE_HOME=/Users/y/Library/gradle/gradle-6.5.1
export PATH=$PATH:${GRADLE_HOME}/bin

# caffe
CAFFE_HOME=/Users/y/Documents/Cache/AndroidCodeAndApp/NDKLib/Caffe/caffe/python
export PATH=$PATH:${CAFFE_HOME}

# Maven
MAVEN_HOME=/Users/y/Library/apache-maven-3.6.3
export PATH=$PATH:${MAVEN_HOME}/bin

# Make
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"

# 真彩色配置
# export TERM=screen-256color

# ------------------------------------------------------------------  网络环境  ----------------------------------------------#
# export http_proxy="http://127.0.0.1:1087"
# export https_proxy="http://127.0.0.1:1087"

# ------------------------------------------------------------------  conda环境  ----------------------------------------------#
# added by Anaconda3 5.3.1 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/y/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/y/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/y/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/y/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
. "$HOME/.cargo/env"


# ------------------------------------------------------------------  fig环境  ----------------------------------------------#
# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/bash_profile.post.bash"
