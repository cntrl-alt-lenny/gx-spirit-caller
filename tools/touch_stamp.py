#!/usr/bin/env python3
"""Touch a Ninja stamp output after a side-effecting rule succeeds."""
from __future__ import annotations

import argparse
from pathlib import Path


def main(argv: list[str]) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("path", type=Path)
    args = parser.parse_args(argv[1:])
    args.path.parent.mkdir(parents=True, exist_ok=True)
    args.path.touch()
    return 0


if __name__ == "__main__":
    import sys

    raise SystemExit(main(sys.argv))
