[//]: # (markdownlint-disable MD013 MD041)

# Brief 379 — stand up the permuter on WSL (new lane)

**Brief:** 379 (decomper). The overlay `.s` reg-alloc tier is thinning (brief
377), so pivot to the permuter for the commutative/peephole tier that `.s` can't
recover as C. The permuter needs Linux `fork`; WSL is the path (the brief-369
Windows spike confirmed bootstrap works, only the native-Windows run-mode was
blocked). Step 1: WSL environment. Step 2: pilot the worklist TIER-1
(commutative-operand + peephole-split, brief-363-proven) and ship the C matches.

## VERDICT

- **The permuter RUNS on WSL — proven end-to-end.** With `-j 4` it executed
  **3244 iterations in 25 s (~130 iter/s aggregate)**, mutating → compiling (via
  `wibo` `mwccarm.exe`) → scoring (via `arm-none-eabi-objdump`) → annealing, and
  repeatedly reaching `score = 0`. **No `spawn`/pickle crash** — the Linux `fork`
  multiprocessing that the brief-369 Windows spike could not test **works**.
  This was the whole reason for WSL, and it is resolved.
- **Native Linux build is byte-identical.** `configure.py eur && ninja sha1` →
  `gx-spirit-caller_eur.nds: OK` under WSL2 (wibo runner). The toolchain
  (`dsd`/`objdiff`/`mwccarm`/`wibo`/binutils) auto-downloads on Linux.
- **Recoveries this session: 0 (none shipped).** Not a permuter problem — the
  permuter works. The gap is the **near-miss-C input pipeline**: the worklist
  TIER-1 functions are uncarved (no `.c`), and `m2c` (the near-miss generator)
  is not vendored. Feeding the permiter near-misses is the next increment; the
  lane itself is GO.

## Step 1 — environment (done, reproducible)

| step | result |
|---|---|
| WSL2 + Ubuntu | installed live on Win11 26200 (no reboot needed); user-level |
| apt deps | `ninja-build python3-pip python3-venv build-essential unzip` (one sudo) |
| repo | shallow clone of `main` into WSL-native ext4 (`~/gxsc`); baseroms copied from `/mnt/c` (EUR sha1 verified) |
| `ninja sha1` (eur) | **OK — byte-identical** |
| permuter bootstrap | clone decomp-permuter @ `efc5c5e7d985` + brief-096 patches + `toml`/`Levenshtein` (PEP 668 → `.venv_permuter/`) — **works** |
| arm-none-eabi binutils | `download_tool.py arm-binutils` (after the `.tar.gz` fix below) → objdump 2.45.1 runs |

## Step 2 — permuter run (validated on a matched function)

Ran the full pipeline on `func_ov011_021caafc` (already matched, used as a
machinery probe): `dsd dis` → bridge name → `permute.py --run --threads 4`. The
permuter `permuter.py … -j 4` launched, `import.py` produced a clean `compile.sh`
(base.c compiles, `rc=0`), and the annealing loop ran at ~130 iter/s reaching
`score = 0`. **Full loop confirmed on WSL.** A *new* recovery needs a near-miss
seed (below).

## Tooling fix landed in this PR

**`download_tool.py arm-binutils` was broken on Linux/macOS.** It assumed `.zip`
for every platform, but xPack ships **`.tar.gz`** on Linux/macOS (only Windows is
`.zip`) → `BadZipFile`. Fixed: pick the extension per-platform and extract via
`tarfile` (Linux/macOS) or `zipfile` (Windows), same selective filter
(objdump + as + `lib/`). Verified on WSL: extracts 5344 files, objdump runs.

## WSL friction (the brief asked — full list)

1. **WSL process lifecycle (biggest).** The distro tears down when the launching
   process exits, so any backgrounded/`nohup`/`setsid` WSL command dies unless a
   **keepalive** process holds the session open. Recipe: start a tracked
   `wsl … 'sleep 3000'` background task, run real work against the live session,
   never kill the keepalive mid-flight. (Three clone attempts died to this before
   the keepalive recipe.)
2. **`gh auth token` has a trailing newline.** Piped into a file it's 41 bytes
   (40-char token + `\n`); the newline corrupted git auth (`could not read
   Username`, leaving a 112 KB broken partial clone). Strip whitespace.
3. **wibo build-ordering.** A fresh Linux checkout fails the first compile with
   `./wibo: not found` — the `mwcc` rules use `./wibo` but don't declare it as a
   prerequisite, so `ninja sha1` runs compiles before fetching it. Workaround:
   `ninja ./wibo` first. (Build-graph fix: add `./wibo` as an order-only dep of
   the compile rules on non-Windows.)
4. **`download_tool arm-binutils` `.tar.gz`** — fixed here.
5. **dis-name bridge.** `permute.py`'s disasm resolver rglobs `func_<addr>.s`,
   but `dsd dis` emits `func_<module>_<addr>.s` → not found. Workaround: `cp` to
   the flat `build/<ver>/disasm/<mod>_<addr>.s`. (Resolver fix: glob
   `*{addr:08x}.s`.)
6. **import.py verify-compile.** `import.py`'s internal base.c compile-check
   mangles the project's `&&`-chained `transform_dep` ninja command
   (`-c '&&' python transform_dep …`) and warns "failed to compile" — but the
   `compile.sh` it *writes* for the permuter is clean, so the run still works.
   The permute.py patch-5 `&&`-strip is not wired into import.py's verify path;
   cosmetic but worth fixing.
7. **PEP 668 + subprocess.** pip deps land in `.venv_permuter/`, but the permuter
   *worker subprocess* needs them importable — install
   `--break-system-packages toml Levenshtein` (or put the venv on the worker's
   path) so the forked workers see them.

## Effort + recommendation

The lane is a **GO** — the one-time WSL setup is paid and reproducible, and the
permuter runs with working `-j`. The remaining work to land the brief's recoveries
is the **near-miss-C pipeline**, not the permuter:

- **Next increment:** vendor `m2c` (the asm→C near-miss generator;
  `m2c_feed.py` already prepares the `.s`). Then the loop is: pick a TIER-1
  commutative/peephole target → `m2c` a near-miss `.c` → carve TU → `dsd dis` →
  `permute.py --run -j N` → ship the `score=0` C → 3-region `ninja sha1`.
- **Payoff:** this unlocks the commutative/peephole HIGH tier (brief-363 proven)
  **and** the ~20-func crack-once-propagate families (dispatcher ×4,
  discriminant ×6, post-blx ×3, BGCNT ×4) that the `.s` lane structurally can't
  reach.
- The small friction fixes (wibo order-only dep, dis-resolver glob, import.py
  patch-5 wiring) are each one-liners and worth landing to make the lane turnkey
  for the next session.

The download_tool `.tar.gz` fix is committed here; the rest of the environment is
recorded above for reproduction.
