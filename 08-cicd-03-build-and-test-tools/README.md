# Домашние задания по лекции 8.3 «Инфраструктура тестирования, сборки и доставки ПО»

## Задача 1 

Запустите sonatype nexus, используя [docker образ](https://hub.docker.com/r/sonatype/nexus3/).

Cоздайте 3 типа репозиториев и загрузите в каждый артефакты, в соответствии с таблицей:

|Тип артефактов|Именование в nexus|Где взять артефакты|Срок жизни артефактов|
|---------------|------------------|--------------------|----------------------|
|[Java приложения](https://blog.sonatype.com/using-nexus-3-as-your-repository-part-1-maven-artifacts)| maven2           | [любые jar файлы на ваш выбор](https://mvnrepository.com/open-source)| 76 дней|
|[Docker images](https://blog.sonatype.com/using-nexus-3-as-your-repository-part-3-docker-images)  | docker           |  [разные версии alpine](https://hub.docker.com/_/alpine)                  | 5 дней |
|Документация | raw        | [ознакомьтесь с основополагающим трудом по CI и залейте его текст в репозиторий](https://www.martinfowler.com/articles/continuousIntegration.html)                   | 18 дней | 

Приведите скриншоты наполнения репозиториев Nexus.

Ознакомьтесь с [документацией](https://help.sonatype.com/repomanager3/backup-and-restore) по резервному копированию и восстановлению.

Создайте background task для проведения бэкапа бд Nexus (Admin - Export databases for backup), в соответствии со спецификацией:
- ежедневное выполнение
- выполнять в 00:00
- присылать нотификацию в любом **случае**
- нотификацию отправлять на почту example@example.exmpl
- данные бэкапа выгружать в /opt

Запустите данный task в ручном режиме и проверьте результат.

В случае, если результат Error - проверьте логи контейнера и **опишите вкратце** причину отказа в бэкапе.

## Задача 2 

Запустите sonatype artifactory, используя [docker образ](https://hub.docker.com/r/mattgruter/artifactory/).

Создайте gradle репозиторий в artifactory (перейдите на вкладку 'Admin' -> 'Repositories' -> 'New').
 
Протестируйте [предоставленный проект](https://github.com/netology-code/virt-homeworks/tree/master/08-cicd-03-build-and-test-tools/gradle_project) с помощью sonar cloud:
- склонируйте себе код проекта
- [установите gradle](https://gradle.org/install/)
- зарегистрируйтесь в [sonar cloud](https://sonarcloud.io/), используя github авторизацию
- [создайте в sonar cloud новый пустой проект](https://sonarcloud.io/projects/create)
    - Project key: test-gradle-project
- в проекте выберите 'Manually'
- выберите Gradle и следуйте открывшимся рекомендациям

P.S.: запуск процесса сканирования - `gradle sonarqube`

Приведите скриншот страницы `code smells` из результата анализа проекта.

Соберите предоставленный проект с помощью команды `gradle build`.

Опубликуйте полученный результат (jar лежит в gradle_project/build/libs) в созданном вами репозитории Artifactory (используя вкладку `Deploy`).

Приведите скриншот загруженного артефакта в вашем репозитории Artifactory (используя вкладку `Artifacts`)
