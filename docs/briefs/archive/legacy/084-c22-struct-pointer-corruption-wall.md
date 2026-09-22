### cloud/c22-struct-pointer-corruption-wall

**Goal:** Codify the **struct-pointer + field-access silent-
corruption wall** decomper surfaced across 3 confirmed
instances in brief 081 waves 2 + 3 (PRs #467, #468). Add a
new entry to `codegen-walls.md` (likely `C-22` or `W-?`) so
future decomper iterations recognize the shape before
bisecting through manual byte-diff.

**Context — what the wall looks like:**

Three confirmed datapoints from brief 081 chain:

| Function | Wave | Size | Pattern |
|---|---|---|---|
| `func_020070dc` | W2 | 0x30ish | strlen-style, struct-arg loop |
| `func_02001ef4` | W2 | 0x30ish | bit-field pack on struct member |
| `func_0200a454` | W3 | 0x30ish | 4-iter copy with typedef'd globals |

**Shared signature:**

- Function takes a **typedef'd struct pointer** as argument
- Accesses fields via `->`
- Size in the 0x20-0x38 range (matches brief 081's ≤0x40
  band)
- mwcc 2.0 produces a **function 32 bytes longer than orig**
- Compiles AND links cleanly — caught by post-link
  byte-diff verify gate

**Distinct from prior walls:**

- **NOT** the brief 077 `static` silent-corruption — these
  candidates have no `static` qualifier.
- **NOT** S-1 padding off-by-one — the diff isn't uniform
  offset shift across all `ldr/str`; it's an extra 32-byte
  block in the function prologue/spill region.
- **NOT** C-2a struct-copy — these aren't struct-copy
  patterns; they're struct-pointer + field-access.

**Method (fast fold + investigation):**

### Part 1 — Codify the wall in `codegen-walls.md`

Add new entry near the existing C-N family. Entry shape:

```text
### C-22 (or appropriate sequence) — struct-pointer silent-
corruption on typedef'd struct field access

**Symptom:** mwcc emits a function ~32 bytes longer than
orig. Compiles and links clean; caught only at post-link
byte-verify. Diff isn't a uniform shift — it's an extra
prologue/spill block before the function body proper.

**Trigger:** function takes a typedef'd struct pointer
argument (`typedef struct { ... } foo_t; void f(foo_t *p)`)
and accesses fields via `->`. mwcc 2.0 produces extra
prologue/spill compared to mwcc's expected output for
the equivalent dsd-gap TU.

**Recipe — TBD pending investigation.** Brief 084 part 2
investigates two coercion approaches:
1. `asm void` recipe (like C-12 / C-16) — manual prologue
   control
2. Different struct typedef shape (e.g. without `typedef
   struct foo { ... } foo;` aliasing — try `struct foo
   *p` directly)

**Confirmed instances:**
- brief 081 wave 2: func_020070dc, func_02001ef4
- brief 081 wave 3: func_0200a454
```

### Part 2 — Investigation (per brief 050 / 054 / 070 pattern)

1. **Reproduce on a known-bad candidate** — pick
   `func_02001ef4` (the simplest of the three). Confirm
   the 32-byte size diff reproduces with the current
   driver.

2. **C-variation sweep (6-8 shapes):**
   - Approach A: `asm void` with manual prologue
   - Approach B: `struct foo *p` (no typedef alias)
   - Approach C: pass struct by value (small structs only)
   - Approach D: `__attribute__((noinline))` — defensive
   - Approach E: register hint on struct pointer arg
   - Approach F: const struct pointer

3. **SP sweep on best C variation** — if (1)-(6) all
   produce 32-byte-long output, try `.legacy.c` (1.2/sp2p3)
   routing. If that emits correctly, classify as
   T-N-style routing-tractable; if not, classify as
   E-N-style asm-only or P-N permanent.

4. **Outcome** — update C-22 entry with the confirmed
   recipe (or mark as P-N if no coercion works).

**Non-scope:**

- ❌ Modifying `port_external_source.py` to detect this
  pattern at port time — that's a future tooling brief
  if the wall recurs in cross-project ports too.
- ❌ Other wave-3 findings (the W-shift-signedness single
  datapoint from `func_020198bc` — wait for 2+ more
  confirmations before scoping a separate brief).
- ❌ AGENTS.md / state.md edits beyond the codegen-walls.md
  + research-index regen.

**Success:**

- `codegen-walls.md` entry C-22 (or next available
  letter) shipped with symptom + trigger + recipe (or
  P-N classification).
- ≥ 1 of the 3 confirmed instances recoverable via the
  documented recipe (decomper verifies in a follow-up
  wave or as a quick smoke test).
- Markdown lint clean. tools-index / research-index regen
  current.

**Branch:** `cloud/c22-struct-pointer-corruption-wall`

**Priority:** MEDIUM-HIGH. Unblocks decomper brief 086
(potential single-region cap-raise to ≤0x60 — the new
wall surfaces more often at the larger size band, so
having the recipe documented matters before pushing the
cap).

**After this brief lands:**

1. Brain queues brief 086 (decomper, future) — single-
   region cap-raise to ≤0x60 with C-22 recipe in apply
   list.
2. If the wall classifies as P-N permanent → decomper's
   selection rule excludes the shape; conserves wave-
   iteration time.
