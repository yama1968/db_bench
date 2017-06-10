#

docker run -i -d -p 5432:5432 -p 2022:22 -v /home:/mnt/home -v /home4:/mnt/home4 pivotaldata/gpdb-base
