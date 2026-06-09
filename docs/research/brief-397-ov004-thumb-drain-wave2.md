[//]: # (markdownlint-disable MD013 MD041)

# Brief 397 — ov004 Thumb-cohort drain, wave 2 (the harder ≥0x5c tier)

**Brief:** 397 (decomper). Wave 2 of the lane brief 393 opened. Wave 1 (brief 395,
PR #922) drained the small/clean Thumb tier (14 `.thumb.c`). ~27 call-having Thumb
funcs remained, trending harder: multi-stack-arg builders, medium crypto, and the
3 wave-1 deferrals. No harness change — plain `.thumb.c` + `#pragma thumb on`.
Yield expected lower than wave 1; target ~6-10. Branch `decomper/ov004-thumb-w2`.

## Headline — 8 byte-identical Thumb `.c` (+1 deferral recovered), 3-region sha1 OK

**8 matched, EUR/USA/JPN `ninja sha1` = OK, carve-size audit clean (8 sizes exact,
0 overlaps).** Upper half of the 6-10 target. One of the 8 is a recovered wave-1
deferral (`021dbdf4`). The harder tier yielded well because it is mostly *composed*
of the wave-1 primitives — builders and RC4 orchestrators that chain the helpers
already matched.

## The 8

| addr | size | what |
|---|---|---|
| `021dbdf4` | 0x4c | fixed-point 64-bit accumulate (wave-1 deferral, recovered) |
| `021dc418` | 0x5c | multi-stack-arg builder (7-arg `func_ov004_021dc2cc`) |
| `021dc3b8` | 0x5e | 7-arg header builder |
| `021dc350` | 0x68 | 8-byte struct builder → forwarder (`021dbddc`) |
| `021dc500` | 0x70 | 6-call top builder (consts `0x5dc`/`0x3000`) |
| `021dc2cc` | 0x84 | RC4 decrypt orchestrator |
| `021dc020` | 0x8a | crypto orchestrator (chains `021dbfd4`/`dbfa8`/`dbf6c`) |
| `021dc238` | 0x94 | RC4 decrypt-and-verify orchestrator |

## Recipes banked (the new ones this wave)

- **64-bit accumulate** (`021dbdf4`): write `long long s = 0; s += (long long)q1;
  s += (long long)q2;` — the running `s` is kept in a `{hi:lo}` register pair across
  the second call (orig `movs r4,#0; adds r6,r4,r0; adcs r4,r1; …`). A one-shot
  `s = (ll)q1 + (ll)q2` defers the sign-extension and diverges.
- **Struct copy to batch loads** (`021dbdf4`): `Pair local = *(Pair*)arg1;` (named
  2-int struct) emits load-load-store-store (a block move); `a[0]=b[0]; a[1]=b[1];`
  on `int*`s emits the conservative load-store-load-store (mwcc fears aliasing).
- **The shared pool constant** (`021dbdf4`): two `x * 0x01FF6210` multiplies CSE to
  one pool word but two `ldr` loads — write the literal twice. (objdump halfword
  display is per-hw LE: a word printed `6210 01ff` is bytes `10 62 ff 01` =
  `0x01ff6210`.)
- **Multi-stack-arg pass-through builders** (`021dc418`/`021dc350`/`021dc500`): the
  5th-7th params land at caller `sp[N]`; mwcc spills the outgoing stack args of a
  7-arg sink to `sp[0]`/`sp[4]`/`sp[8]` and keeps r0-r3 unmoved. A struct field read
  with different signedness per use is real: `a3[0]` reads `ldrsh` for two calls but
  `ldrh` for one → `(unsigned short)a3[0]` only on that one (`021dc418`).
- **Signed-byte stack params** (`021dc3b8`): a stack param read `ldrsb` is a
  `signed char` param (the caller still passes a word; per-TU prototypes differ).
- **S-box-in-`state[2]`** (`021dc2cc`/`021dc238`): the RC4 orchestrators allocate the
  S-box and store it straight into the state struct's field — `state[2] =
  (int)alloc;` — so the `state[2]` slot *is* the alloc; free `(void*)state[2]`.
- **cmp-operand order via a temp** (`021dc238`): `int crc = f(); if (crc != x)` emits
  `cmp r0, rX` (result first); the inline `if (f() != x)` emits `cmp rX, r0`.

## Deferred / walled

- **`021dcd1c`** (0x48, wave-1 deferral) — param ambiguity *resolved* (it is
  `f(int a0, uchar *a1)`; the not-found branch compares `a0 == 0x1000`; one caller
  `0x021dcdae`), but the body is a firm **found/i register-numbering** swap (31/31,
  unsteerable by declaration order). The reg-mirror class → `.s`/permuter.
- **`021dd2c8`** (0x88) — record-scan counter; 63/63 but a **count/rec8 register +
  two stack-slot** allocation swap. Same class → `.s`/permuter.
- **`021dc1cc`** (0x6c, RC4 KSA) — the brief's `.s` target (spill-choice reg-alloc,
  53v50). **Tooling gap:** `asm_escape --whole-function` can't parse a Thumb gap
  object (`no disassembly in _dsd_gap@…` — it resolves ARM per-function symbols, not
  Thumb). The `.s` route for these Thumb reg-walls needs an asm_escape Thumb fix or
  the scaffolder's `.s` lane. Did **not** grind it as C (per the brief). It still
  links from the gap, so `021dc2cc`/`021dc238` (which call it) match cleanly.
- **`021dca68`** (0x162) — switch with a **PC-relative jump table** (`add rN,pc;
  ldrh; bx rN`) → the jump-table wall class.
- **`021dd374`** (0x210, 30 calls), **`021dd648`** (0xaec, 133 calls) — RE-tier,
  untouched.

## Vein status

The composed builder/orchestrator tier drained well (it reuses the wave-1
primitives). What's left is **~16 funcs**: the reg-alloc near-misses (3, → `.s`),
the jump-table/RE giants (`021dca68`/`021dd374`/`021dd648`), and a residue of
medium funcs not yet attempted (`021dbc8c`, `021dc474`, `021dc570`, `021dc664`,
`021dc7bc`, `021dc830`, `021dc998`, `021dcbf0`, `021dcd64`, `021dce74`, `021dcf38`,
`021dd040`, `021dd150`). A wave-3's worth, but the easy composition is mostly gone —
expect lower yield and more `.s`/permuter routing.

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | **OK** (8 `.c`, byte-identical) |
| Carve-size audit (8 sizes vs symbols.txt, overlaps) | **PASS** (exact, 0 overlaps) |
| No orphan `.thumb.c` | clean |

EUR-only carve (+8 `complete_units`); usa/jpn are the regression gate.

## Cross-references

- `docs/research/brief-395-ov004-thumb-drain-wave1.md` — wave 1 + the primitives
  (`021dbddc` forwarder, `021dbfd4` XOR, `021dc128` CRC, the divmod recipes) this
  wave composes.
- `docs/research/brief-393-ov004-realc.md` — the `*.thumb.c` harness.
- `src/overlay004/ov004_core.h` §VERIFIED b397 — the per-func recipe index.
