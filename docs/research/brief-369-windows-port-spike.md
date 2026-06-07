[//]: # (markdownlint-disable MD013 MD041)

# Brief 369 — port the "Mac-only" lane to Windows (tooling spike)

**Brief:** 369 (decomper). The "Mac-only" lane (`.s` generator + permuter) is a
script-setup artifact: the runners hardcode `wine` and assume `arm-none-eabi`
binutils, but `mwccarm.exe` / `mwasmarm.exe` already run natively on Windows
(the build does it). Spike: install binutils + de-wine, prove the `.s` lane, spike
the permuter, report the true size. Gate: 3-region `ninja sha1` must still PASS.

## VERDICT

- **`.s` / GLOBAL_ASM lane on Windows: YES — works, proven, landed.**
- **Permuter on Windows: bootstrap WORKS; run-mode BLOCKED by decomp-permuter's
  own Windows-path handling** (not by our wine/binutils setup). Needs a small
  series of vendored-`import.py` patches, then the multiprocessing/pycparser
  question (upstream recommends WSL). Not landed — reported with effort below.
- **3-region `ninja sha1`: PASS** (USA / JPN / EUR all `OK`) — the tooling
  changes are orthogonal to the build graph.

## What landed (this PR)

1. **`get_platform.exe_launch_prefix()`** — `[]` on Windows (run the PE natively),
   `["wine"]` elsewhere. Single source of truth, reuses `get_platform()`.
2. **`asm_escape.py` de-wined** — `compile_c` / `assemble` use the prefix
   instead of a hardcoded `wine`. Also made `_MWCC` / `_MWASM` absolute (the
   bare relative `.exe` path doesn't resolve under native `CreateProcess` once
   `wine` is no longer the launcher doing the lookup).
3. **`download_tool.py arm-binutils`** — reproducible fetch of
   `arm-none-eabi-objdump` + `arm-none-eabi-as` from the xPack
   `arm-none-eabi-gcc` GitHub release, selectively extracting just those two
   binaries (+ Windows DLL deps / unix `lib/`) into `tools/arm-none-eabi/bin`.
   Gitignored, downloaded on demand (like `mwccarm`).

`permute.py` needed **no** de-wine change: its compile command is the
ninja-scraped `compile.sh`, and `configure.py` already sets `WINE=""` on
Windows, so the scraped command is native.

## Step 3 proof — the `.s` lane is Windows-capable

```
$ PATH=tools/arm-none-eabi/bin:$PATH python tools/asm_escape.py \
      --whole-function func_ov002_021e2cd4 --version eur
func_ov002_021e2cd4: ✅ whole-function .s byte-identical vs delinked .o (19 words)
```

Full native pipeline: `arm-none-eabi-objdump` disasm → emit `.s` (project
syntax) → `mwasmarm.exe` assemble (no wine) → `arm-none-eabi-objdump`
byte-compare → **byte-identical** vs the delinked original. The emitted `.s`
matches the committed ov002 `.s` format (`.text`/`.extern`/`.global`/`.arm`).
3-region `ninja sha1` stays green (build untouched). **The GLOBAL_ASM endgame is
no longer Mac-only.**

## Step 4 — permuter spike

**Bootstrap: WORKS.** `ensure_permuter_installed` cloned decomp-permuter to
`tools/_vendor/`, checked out the pinned commit, applied the brief-096 patches;
`install_permuter_deps` pip-installed `toml` + `Levenshtein` against the host
Python (no PEP 668 venv fallback needed; pynacl is skipped — single-host `-j`).

**Run-mode: blocked, in decomp-permuter's `import.py`, on Windows paths:**

1. `import.py` scrapes `ninja -t commands` for the compile line, then
   `shlex.split(line)` in **POSIX mode treats `\` as an escape** — so
   `src\main\func.c` → `srcmainfunc.c` and the `rel_c_file in parts` check fails
   ("Found one possible candidate, but didn't match"). Confirmed:
   `shlex.split(r'cc src\main\func.c -o out')` → `['cc','srcmainfunc.c','-o','out']`.
2. With a test-only forward-slash patch past (1), the next wall is
   `FileNotFoundError [WinError 2]` when `import.py` *executes* the scraped
   compile command — the ninja command's `".\tools\…\mwccarm.exe"` (relative,
   `.\`-prefixed) doesn't resolve under native `CreateProcess` (same class of
   bug we fixed in `asm_escape` by going absolute).
3. Not yet reached: the multiprocessing pool. `permute.py` already prints an
   upstream warning that native Windows may **stall on pycparser pickle errors**
   in `-j` mode (Windows uses `spawn`, not `fork`; decomp-permuter pickles
   pycparser ASTs across workers). Upstream README recommends WSL.

These are decomp-permuter / vendored-tool issues, **not** our wine/binutils
setup — that part works (binutils run, the de-wined compile is native).

## Effort estimate

| lane | status | remaining |
|---|---|---|
| `.s` / GLOBAL_ASM | **DONE** | none — landed + proven |
| binutils install | **DONE** | none — `download_tool.py arm-binutils` |
| permuter bootstrap | **DONE** | none — clone + deps work |
| permuter run-mode (native Win) | needs work | (a) `patch_permuter_vendor` patches to `import.py`: forward-slash paths before the `shlex` match **and** absolutise/normalise the scraped compiler path; ~½ day. (b) then validate the `-j` multiprocessing / pycparser-pickle path — **unknown**, may need `spawn`-safety fixes; upstream punts to WSL. |
| permuter via WSL | available now | the `.s` lane + binutils also work in WSL, and WSL gives `fork` — the low-risk path if native-Windows multiprocessing proves stubborn. |

**Recommendation:** land the `.s`-lane win now (this PR) — it makes the
GLOBAL_ASM ship-path device-independent immediately. For the permuter, the
cheap next step is the two `import.py` path patches; if the multiprocessing
path then misbehaves, fall back to WSL rather than fighting `spawn`-pickling.
