#cloud-config

groups:
  - admingroup: [root, sys]
  - users

users:
  - name: user
    passwd: $6$rounds=4096$t3Y8It.dD$iMWPkDbp3s9AUTCLoHaMFahVaBeD/OcwM1AK/yhFMPexnr5q5zj0c9O8jKRMT5x0PselZumaOCHOG835dJkFi.
    lock_passwd: false
    group: users
    shell: /bin/bash

#  Change some default passwords
chpasswd:
  list: |
    root:$6$rounds=4096$bhckmTH.s0I$ExSX3j9nRhlq898NGeAZUBhqhOtQUUYKK5sWv8B2gv4nyTU3E5GjX2rcPWiKnePLDQca9vg3yjI8hA0CF1lwO/
    ubuntu:$6$rounds=4096$hm3tzQY0VbnrEtp$kmOOCAwN7GVd.y9y9t0aNpiv3v1PYeFFuVYOn6Oeu1P2WkQ/XOFxQzJE5eVoD.26s3bp1typY.tT/z/sTdotb/
  expire: False
