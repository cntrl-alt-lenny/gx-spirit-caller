[//]: # (markdownlint-disable MD013 MD041)

# Permuter target worklist (brief 370)

A deduplicated, prioritized list of permuter targets distilled from the whole
catalogued near-miss backlog (every `*_core.h` §WALL / §DEFERRED block, the main
routed near-misses of briefs 357/359/361/363, the ov002 routing pass 358, and the
wave-brief deferred tables). **Work it top-down.** No code here — this is the
queue the `.s`/permuter lane consumes once the Windows port lands (brief 369) or
on the next Mac switch.

The real gate for any shipped pick is **`ninja sha1`** (objdiff-100% can false-pass
on a data reloc — brief 361). bl-reloc-only picks link clean.

## Prioritization rubric — evidence, not hope

Built from the two pilots that actually ran the permuter, **reconciled** (they
disagree on one class):

| class | verdict | evidence |
|---|---|---|
| **commutative-operand** (add/orr order) | **HIGH — proven** | 363 cracked `020195b8` (score→0); hand-C can't flip the canonicalised operand order |
| **peephole-split** (`(v<<k)>>k`→`&mask`, nibble reposition) | **HIGH — proven** | 363 cracked `02018dcc`,`0201b690`; permuter mutates the C shape to dodge the peephole |
| **scheduling / store-scheduling / instr-order** | **MEDIUM — theory** | both pilots say "the permuter anneals scheduling"; no *proven* wall-crack yet — test to confirm |
| **reg-mirror / reg-alloc** (base-reg r1↔r2, rotation, numbering, discriminant/caller/callee coin-flips, post-blx) | **LOW — proven plateau** | 358 ran `02267f90` 477 iters stuck at 45; "permuter anneals scheduling but plateaus on reg-allocation". **NB: this CONTRADICTS 363's speculation that reg-mirror is HIGH — 363 never actually tested it; 358 did.** |
| **`\|\|`-equality / CSE-of-base** | **LOW — proven plateau** | 363 4/4 plateau (705–805); mwcc refuses to CSE the compare-base from any C |
| **frame-allocation** (`push {r3}` vs `sub sp,#4`) | **LOW — proven plateau** | 363 plateau (`020536d0` 355, borderline); downstream of reg pressure |

**Net:** the permuter's wheelhouse is the two *front-end-transform* classes
(commutative, peephole) plus *maybe* scheduling. Everything that is fundamentally
a **register-allocation** difference plateaus → those are `.s` (`asm_escape
--whole-function`), not permuter. The bulk of the overlay backlog is reg-alloc.

## TIER 1 — HIGH (proven permuter classes): work first

The 363 batch already shipped the proven examples (`020195b8`, `02018dcc`,
`0201b690` — **excluded below as done**). The remaining proven-class walls:

| addr | mod | size | class | best% | shape / note |
|---|---|---|---|---|---|
| `021ceffc` | ov011 | 0x4c | peephole-split | — | nibble-reposition `(n<<28)>>K` fuses to `&mask` (brief 362) — the proven dodge applies |
| `02053600` | main | 0x2c | commutative/peephole | — | recurs in 353/355/359 main waves — re-characterise, likely commutative |
| `0208c9d4` | main | 0x30 | commutative | — | main wave-6 routed wall |
| `0207d37c` | main | 0x30 | peephole/commutative | — | main wave-6 routed wall |

Plus: **re-scan main waves 1–7 for the commutative/peephole pile** that 363 said
was "under-represented in the pilot" — those declared-walls (operand-order /
shift-dodge) are TIER 1 but were not individually addressed in the brief docs.

## TIER 2 — MEDIUM: test early to resolve, highest propagation value

Two sub-groups. **(a) scheduling** (theory-tractable, unproven — a real crack
here validates the whole class). **(b) the high-volume recurring reg-alloc shapes**
— these are reg-alloc (TIER-3 by class) BUT one crack propagates to 5–8 siblings,
so a *bounded* permuter probe is worth it before mass-routing them to `.s`.

### 2a. Scheduling / store-scheduling (prove the class)

| addr | mod | size | best% | shape |
|---|---|---|---|---|
| `021cc2a4` | ov004 | — | — | field-pool RMW, store-scheduling (brief 362) |
| ov002 ×4 | ov002 | — | — | scheduling-class deferred (brief 358 "deferred 4 — recoverable in principle") |
| `021d1308` | ov004/main | — | — | status-msg, loaded value used 3× — scheduling + reg-mirror (362) |
| `020536d0` | main | 0x34 | 355 | frame, but **retry at 600s** (363 flagged it the closest miss; was capped at 150s) |

### 2b. CRACK-ONCE-PROPAGATE — recurring shapes (probe the canonical instance)

If the canonical instance cracks, the fix template propagates to every sibling
(same shape, same size). If it plateaus, route the whole family to `.s` in one go.

| shape (canonical → siblings) | instances | size | class | best% |
|---|---|---|---|---|
| **script-step dispatcher post-blx rotation** | ov017 `021b2c8c` → ov019 `021b26d0`, ov014 `021b26ec`, ov007 `021b2280` | 0x58 ×4 | post-blx reg-rotation | ~72% |
| **post-blx INCREMENT rotation** (same family, increment tail) | ov009 `021ad7d4` → ov012 `021cc01c`, ov013 `021cb700` | 0x50–0x58 | post-blx reg-rotation | ~80% |
| **switch-discriminant r0-vs-r1** | ov017 `021b33dc` → ov014 `021b2eec`, ov007 `021b25a0`, ov003 `021cbe8c`, ov009 `021ab910` (+ ov005 `021ad284`) | 0x7c–0xe8 | discriminant coin-flip | 87–93% |
| **BGCNT/RGB555 bit-manip caller-saved field-reg dance** | ov014 `021b4810`/`021b41b8` → ov007 `021b28c4`, ov019 `021b28dc` | 0x3c–0x90 | caller-saved bit-pack | 60% |

**These 7+3+6+4 = ~20 instances ride on 4 probes.** Highest leverage in the whole
list — but they are reg-alloc, so by 358's evidence they will likely plateau.
Resolve the 363-vs-358 conflict *here*: run each canonical at a generous budget
(≥600s); a single crack reclassifies its family to TIER 1, a plateau retires ~20
funcs to `.s` at once.

## TIER 3 — LOW (proven/expected reg-alloc plateau): route straight to `.s`

`asm_escape --whole-function`. Do **not** spend permuter budget here beyond the
TIER-2b probes; the class is settled.

| group | instances | class |
|---|---|---|
| `\|\|`-equality / CSE-of-base | main `0202ef08`,`0202f59c`,`02031764` (0x30), `02031794` (0x2c); the dominant ov002 deferred class | CSE-of-base (363/358 plateau) |
| frame-allocation | main `0205d688` (0x34); ov016 frameless pairs; ov014 `021b4248` (RGB555 frameless) | frame |
| whole-fn reg-rotation / numbering | ov017 `021b61dc` (0x88), ov011 `021d20e8` (0x30), ov000 `021ab850`/`021abf78`, ov010 `021b46a8` (0xa8)/`021b2490` (0x64) | reg-numbering |
| caller-saved coin-flip | ov003 `021cbdf4` (0x98), ov019 `021b4c30` (0x44), ov009 `021ac458` (0x78)/`021aa59c` (0x3c), ov007 `021b2e84` (0x60) | caller-saved |
| callee-saved permutation (entangled) | ov003 `021ceb84` (0xa0), ov019 `021b4324` (0x84) | callee-saved (decl-order cracks only PURE loop-local) |
| reg-choice struct shuffle | main `0207da48` (0x34)/`0207da1c` (0x2c) (13v13), ov002 mirror-twins (`0220cff8`…) | reg-choice |
| reg-swap pair (branch-inverting) | ov016 `021b287c`/`021b28f4`/`021b6074` | commutative-but-inverts-branch → reg-alloc |
| 11-arg stack-layout builder | ov003 `021cedf8` (0xbc), ov012 `021caea8` (0x9c)/`021caf80` (0x108) | frame/stack-layout (`func_0201e964`) |
| loop strength-reduction | ov003 `021cc010` (0xc8)/`021cbf08` (0x108), ov014 `021b3fc4` (0x7c), ov020 loop-SR group | loop-SR (fixed loop lowering) |
| block-layout (branch-displacement) | ov014 `021b274c` (0xc0, 95.8%)/`021b2644` (0xa8) | block placement |

### Lower-confidence MEDIUM (could promote on a crack)
| addr | mod | size | class |
|---|---|---|---|
| `021acf80` | ov018 | 0x198 | HSV→RGB: 3 magic-mult divs BURIED in a 6-way sextant switch — CSE/scheduling interaction (clean magic-div is *drainable*, see exclude; the buried form is permuter-MEDIUM) |
| `021aa9b8` | ov018 | 0x84 | angle→cell magic-mult signed div tail-call |

## EXCLUDE — do NOT put on the permuter queue

- **Already cracked by the 363 pilot (shipped):** `020195b8`, `02018dcc`,
  `0201b690`.
- **~69% of the legacy "435 walls" are STALE** (brief 362): of 225 addresses in
  the ov004/006/011 WALL sections, 155 are already carved. Only ~70 genuinely
  uncarved (ov004 27, ov006 13, ov011 30) — and 362 found those mostly `.s`-bound
  (tri-compile recovered 0; the 2 recoveries were a stale status-msg shape).
  **Re-confirm carve status before queueing any legacy-WALL address** (`m2c_feed`
  returns the disasm regardless of carve state — an already-done fn masquerades as
  a wall, e.g. ov006 `021b2280`-on-main).
- **Drainable in hand-C, not permuter:**
  - byte-pack arg-pack family (ov002 `021d5xxx`, ~30–50 callers) — the `(u8)lo |
    ((u8)hi<<8)` cast lever (briefs 358/360). A *drain* vein for a Windows wave.
  - clean constant-divisor magic (ov019 `021b2818`, ov016 `021b5fb0`) — `/N`,`%N`
    reproduce byte-exact from plain C.
  - ov004 status-message family — mostly shipped; stragglers via plain 2.0.
- **Link-failures, not codegen:** main `020489c4` (refs `data_020ff924`, a
  non-bss `data` symbol dsd can't link) — needs a data-def fix, not the permuter.
- **Compiler-routing candidates:** ov002 `021b91d0` (`stmfd {r3}; sub sp,#4`
  legacy frame) → try `.legacy.c`, not the permuter.

## Working notes (from the 363 harness pilot)

- Flow: carve near-miss as a TU (`.c` + `delinks complete`) → `ninja <tu>.o` →
  `dsd dis -c … -a build/eur/disasm` → **bridge the name** (`cp
  build/eur/disasm/src/<mod>/func_<a>.s build/eur/disasm/<mod>_<a>.s`) →
  `tools/permute.py func_<a> --run --max-seconds N --threads 6`.
- **Bridge gotcha:** `dsd dis` emits `…/src/<mod>/func_<a>.s` but `permute.py`
  expects `…/<mod>_<a>.s` — copy across, or fix the resolver (recommended).
- Matched C is permuter-ugly (helper vars) but byte-exact; clean it up minimally.
- Budgets: commutative/peephole crack fast (score→0 within the default run);
  give the TIER-2b reg-alloc probes ≥600s before declaring plateau.

## Suggested execution order

1. **TIER 1** (proven classes) — fast wins; re-scan main waves 1–7 for the
   commutative/peephole pile.
2. **TIER 2b probes** (4 canonical instances) — biggest leverage; resolves the
   reg-mirror conflict and bulk-routes ~20 funcs either way.
3. **TIER 2a scheduling** — prove (or retire) the scheduling class; retry
   `020536d0` at 600s.
4. **TIER 3** → `.s` (`--whole-function`) in family batches; no further permuter
   spend.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
