# Домашнее задание к занятию "5.4. Практические навыки работы с Docker"

## Задача 1 

Перерешите предложенный докер-файл с использованием centos или oracle linux, как базового образа. Необходимо воспроизвести всю функциональность исходного образа 

FROM ubuntu:latest

RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository ppa:vincent-c/ponysay && apt-get update
RUN apt-get install -y ponysay

ENTRYPOINT ["/usr/bin/ponysay"]
CMD ["Hey, netology”]

## Задача 2 

Реализуйте два манифеста - докер файла, cоберите и опубликуйте образы в созданном репозитории докерхаб для Jenkins сервера https://www.jenkins.io/download/

Первый образ:
- Используйте amazon corretto, как базовый образ
- Используйте соответсвующие инструкции по установке для вашей платформы описанные в https://www.jenkins.io/download/ как основу для RUN директив в докер файле
- Используйте тэг ver1 

Второй образ:
- Используйте ubuntu:latest, как базовый образ
- Для запуска Jenkins в данном случае скачайте и используйте war файл со страницы https://www.jenkins.io/download/
- Используйте ADD, RUN и/или другие необходимые дерективы в манифесте для устновки пререквизитов для запуска бинирного файла war
- Используйте тэг ver2 
