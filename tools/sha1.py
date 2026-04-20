#!/usr/bin/env python3

from pathlib import Path
import argparse
import hashlib
import sys


def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)


parser = argparse.ArgumentParser(description="Computes and verifies a SHA1 checksum")
parser.add_argument('file', help="Input file to verify")
parser.add_argument('-c', type=str, dest='checksum_file', required=True, help='Checksum file (one line: "<sha1>  <filename>")')
args = parser.parse_args()

file_path = Path(args.file)
checksum_path = Path(args.checksum_file)

with checksum_path.open('r') as file:
    target_sha1, _ = file.readline().split(' ', 1)
    target_sha1 = target_sha1.strip().lower()

if target_sha1 == "0" * 40 or not target_sha1:
    eprint(f"{checksum_path}: no expected hash set — fill it in after a verified first build")
    exit(1)

with file_path.open('rb') as file:
    file_sha1 = hashlib.sha1(file.read()).hexdigest()

if target_sha1 != file_sha1:
    eprint(f"{file_path}: FAILED")
    eprint(f"  expected: {target_sha1}")
    eprint(f"  actual:   {file_sha1}")
    exit(1)
else:
    eprint(f"{file_path}: OK")
