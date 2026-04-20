### claude-pc/ov005-finish-trivials

**Goal:** Match the remaining trivial (size=0x4) functions in overlay 5,
mirroring the pattern used for the first four stubs in
`src/overlay005/ov005_stubs.c`. Once those are done, move on to the
easy-tier leaves (size <= 0x20, no outgoing calls) in the same overlay.

**Context:**

- Four trivial stubs already landed on `main` in commit `49fc791`
  (`func_ov005_021aa4a0` .. `func_ov005_021aa4ac`), each a 4-byte
  `bx lr` returning void. That file is the template.
- The symbol analyzer (PR #4, pending merge) classifies 137 trivial
  functions across the whole game and ranks them by risk. Eight more
  live in overlay 5:

  | Addr | Size |
  |---|---|
  | `0x021aaf00` | 0x4 |
  | `0x021aaf04` | 0x4 |
  | `0x021ab3e0` | 0x4 |
  | `0x021ab3e4` | 0x4 |
  | `0x021ad058` | 0x4 |
  | `0x021ad05c` | 0x4 |
  | `0x021b0b28` | 0x4 |
  | `0x021b0b2c` | 0x4 |

  All in overlay 5, which round-trips byte-identically today — low risk.
- Overlay 5's checksum is ✅ OK, so a regression in ov005 is the *only*
  thing that can break our baseline count of 24/27 modules matching.
  Run `./dsd.exe check modules -c config/eur/arm9/config.yaml` before
  and after each batch.

**Scope:**

- `src/overlay005/ov005_stubs.c` — add the 8 new stub functions.
- `config/eur/arm9/overlays/ov005/symbols.txt` — rename only when a
  function is confirmed matched via objdiff. Keep the `func_ov005_` prefix
  unless you know the real name.

**Non-scope:**

- Do **not** attempt `func_ov005_021aaea8` yet. It's 0x58 bytes, medium
  tier, a meaningful jump in difficulty. Save it for after the easy-tier
  pass completes and the surrounding call graph has more named nodes.
- Do not touch other overlays, `libs/`, `tools/`, or `AGENTS.md`.
- Do not skip the objdiff check. A 4-byte function can still mis-match
  if the ABI or return type is wrong.

**Success:**

- `ninja rom && ./dsd.exe check modules -c config/eur/arm9/config.yaml`
  still reports 24/27 OK (overlay 5 still ✅).
- `ninja objdiff` shows each new stub as 100% matched against the
  original `.o`.
- `python tools/progress.py` ticks up by 8 matched functions.
- PR opened with the 8 stubs + short verification note.

**After that chunk lands:**

Switch to easy-tier ov005 leaves. Starting points (all `size <= 0x20`,
expected to be 1-2 line returns of constants or simple register moves):

  - `func_ov005_021ac9c8` (0x8)
  - `func_ov005_021acacc` (0x8)
  - `func_ov005_021acad4` (0x8)
  - `func_ov005_021ad048` (0x10)
  - `func_ov005_021ab0fc` (0xc)

Pick 3-5 per PR. After each PR, re-run the analyzer to refresh the
target list — once-named callees promote medium/hard functions into
easier tiers.

**Branch:** `claude-pc/ov005-finish-trivials`
