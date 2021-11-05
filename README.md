# Bash number generator

This bash script is meant to print out numbers from 1 to 10 in a random order. The parameters `lower_limit` and `upper_limit` are hard coded respectively to 1 and 10. Tests have been executed using BATS (https://github.com/bats-core/bats-core).

## Build instructions

The script `random_numbers.sh` can be executed on Unix machines. The tests requires the installation of BATS:

- OSX: `brew install bats`
- Linux: `apt-get install bats`

## Usage

The script requires nothing but to be executed, it prints out the serie of numbers from 1 to 10 in a random order, and it writes 3 txt files for testing purposes:

- `numbers.txt`, that will store the sorted array;
- `shuffled_numbers.txt`, with the shuffled array;
- `array_size.txt`, that will store the size of the array.

After the installation of BATS, the tests can be executed with the command `bats random_numbers.bats`

## Description

The script generates a sorted array and fail if it is not of the required size, then it creates the first txt file. After that, the array gets shuffled and written to the second file, alongside with its size in the third file, if there was no issue with the shuffling.

The test cases check the following:

- the execution status of the script, if it is `0` there were no mistakes;
- the equivalence between the sorted array and the hard coded variable `upper_limit`;
- the sorted array consistency with the string `"1 2 3 4 5 6 7 8 9 10"`;
- the shuffled array equivalence with the sorted one, removing all the elements from the former and checking with a regular expression that it does not contains numbers anymore.

## Known limitations/bugs

The script is hard coded to output the numbers from 1 to 10. In order to make it output numbers from 1 to *n*,the `upper_limit` could easily become an input parameter but this would require refactoring also in the tests, because as of now also the tests follow the assumption that the script will generate numbers from 1 to 10 (i.e. see third test case).


# SSL Offloading scenario

We assume to have to monitor the following machine that performs SSL offloading and proxy for our servers:

- 4 times Intel(R) Xeon(R) CPU E7-4830 v4 @ 2.00GHz
- 64GB of ram
- 2 tb HDD disk space
- 2 x 10Gbit/s nics

The most important metric to monitor is the CPU utilisation, as the SSL offloading is mostly CPU intensive, nonetheless we want to monitor RAM and disk utilisation in order not to have a failure. Finally, we need to recurrently monitor the connectivity of the machine with a ping and the status of the service with a heartbeat.

The monitoring could be made by another server, possibly placed in the LAN that the machine proxies, installing one of the monitoring tools present in the market and setting up the connectivity between the two.
