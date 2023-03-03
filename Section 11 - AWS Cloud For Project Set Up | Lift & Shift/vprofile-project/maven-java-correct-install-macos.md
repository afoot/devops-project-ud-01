Hi everyone!

I have macOS Ventura on m1.

I was able to solve the problem with wrong java version for maven with this guide.

Post it in case someone will have the same problem.

1. Install java 8 with this command from Imran's guide:

brew install --cask homebrew/cask-versions/adoptopenjdk8 

2. Verify java installation with java -version 

Output will be like this:

% java -version
openjdk version "1.8.0_292"
OpenJDK Runtime Environment (AdoptOpenJDK)(build 1.8.0_292-b10)
OpenJDK 64-Bit Server VM (AdoptOpenJDK)(build 25.292-b10, mixed mode)

3. Go to the Maven Download site: https://maven.apache.org/download.cgi Download the “Binary tar.gz archive” file anywhere you want. For example in your user Downloads directory ~/Downloads .

For me the version of maven was apache-maven-3.9.0-bin.tar.gz

4. After downloading, extract it using the below command:

% tar -xvf apache-maven-3.9.0-bin.tar.gz

The binaries will be extracted in the “apache-maven-3.9.0” directory.

5. Set Maven Environment Variables - M2_HOME and Path

Edit your .zprofile file or .bash_profile file in case you are using bash.

vim ~/.zprofile

Add this in the end of the file:

Don't forget to change username on your username and change maven version if you install another one.

export M2_HOME="/Users/username/Downloads/apache-maven-3.9.0"
PATH="${M2_HOME}/bin:${PATH}"
export PATH

Paths with ~ won't work here, don't use it.

6. Source .zprofile or open new terminal tab.

source ~/.zprofile 

7. Verify maven installation with mvn -version

% mvn -version
Apache Maven 3.9.0 (9b58d2bad23a66be161c4664ef21ce219c2c8584)
Maven home: /Users/username/Documents/code/apps/apache-maven-3.9.0
Java version: 1.8.0_292, vendor: AdoptOpenJDK, runtime: /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/jre
Default locale: en_US, platform encoding: UTF-8
OS name: "mac os x", version: "10.16", arch: "x86_64", family: "mac"