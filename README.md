# ruby-fib-containers

Usage:
```
$ docker build -t ruby-fib .
  ...

$ docker network create mynet
  ...

$ docker-compose up -d
  Creating ruby-fib_fib2_1 ... done
  Creating ruby-fib_fib1_1 ... done

$ nc localhost 50000
  0 1
  ^C

$ docker-compose logs
  Attaching to ruby-fib_fib1_1, ruby-fib_fib2_1
  fib1_1  | 0
  fib1_1  | 1
  fib1_1  | 1
  fib1_1  | 2
  fib1_1  | 3
  fib1_1  | 5
  fib1_1  | 8
  fib1_1  | 13
  fib2_1  | 1
  fib2_1  | 1
  fib2_1  | 2
  fib2_1  | 3
  fib2_1  | 5
  fib2_1  | 8
  fib2_1  | 13
  fib2_1  | 21

$ docker-compose down
  Stopping ruby-fib_fib1_1 ... done
  Stopping ruby-fib_fib2_1 ... done
  Removing ruby-fib_fib1_1 ... done
  Removing ruby-fib_fib2_1 ... done
  Network mynet is external, skipping
```
