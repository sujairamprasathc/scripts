#!/usr/bin/env python3
import secrets
import string
n = int(input('Password max length:'))
print(''.join(secrets.choice(string.ascii_letters + string.digits + string.punctuation) for _ in range(n)))
