;;
;; https://wiki.jenkins-ci.org/display/JENKINS/Mail+Commander+Plugin
;;

'(developer (send-mail :subject "build testjob" :to "jenkins-mail-commander@foo.com"))
'(jenkins (jenkins-mail-commander (pull-by-pop3 mail)))
;; java -jar jenkins-cli.jar -s http://localhost:8080/ build testjob
'(jenkins (send-mail result))
