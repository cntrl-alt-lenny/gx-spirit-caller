# Cross-project pipeline — lessons from briefs 066 → 080

**Brief:** 074-lessons (cloud research note). The cross-project source
mining arc spans 15 briefs and ~30 PRs, from the brief 066 feasibility
verdict through brief 080's pokeheartgold extension. Most of the
architecture has been documented in per-brief PRs; this note synthesises
the recurring **patterns** that bit twice or more — the lessons worth
remembering when designing the next source-rewrite pipeline.

Audience: future-me, brain after a few-week gap, anyone scoping a
similar cross-project porting effort on another decomp.

## TL;DR — four lessons

1. **The 3-signal source-rewrite-trap pattern.** Any source rewriter
   that "byte-fingerprint matches → emits port → compile+link
   succeeds" can still produce wrong bytes. We hit this exact shape
   three times: byte-twin trivial-stub collisions, STT_NOTYPE extern
   data refs, and `static` keyword preservation. The fix is always
   "deliberate signal, not silent success" — but you only discover the
   signal after the layout cascade.

2. **Pool-drain funnel shape.** Bulk-port waves narrow predictably:
   sweep-OK pool → compile-OK → link-OK → byte-identical. The narrow-
   ing factor is roughly 4× per stage in the first wave, then collapses
   sharply once the easy wins are consumed. Floor-hit waves below this
   shape signal genuine pool drain, not driver regressions.

3. **Skip-reason taxonomy as architecture.** Every silent failure we
   diagnosed got an explicit skip-reason. Eight reasons accumulated
   (`callee-unresolvable`, `callee-ambiguous`, `data-ref-unresolved`,
   `struct-access`, `undefined-macro`, `ish-mismatch`,
   `already-complete`, plus `ok`). The discipline is: every failure
   gets a refusal name before the next wave runs. Silent passes are
   bugs.

4. **Research-mistake refinement.** Brief 066's headline projected an
   exact-SP-match bonus pool for pokeheartgold's nitrocrypto. Brief
   080's audit revealed the source is `.s` (assembly), not `.c` — the
   "bonus" was the audit reading the Makefile flag without checking the
   build rule. SP audits must verify both `MWCCVER := X` and the rule
   is a `.c → .o` build, not a `.s → .o` one.

## 1. Pipeline lifecycle

| Brief | Wave / piece | Outcome | Drove next |
|---|---|---|---|
| 066 | Feasibility research | GO verdict; v0 prototype name-matching | 068 |
| 068 | Byte-fingerprint pipeline | 5/5 on `OS_tick.c` smoke; library shipped | 069 |
| 069 | Wave 1 — first bulk-port attempt | 10 / 50 floor (BELOW); ad-hoc driver hit data-ref limit | 070 |
| 070 | D1 driver + D2/D3 macros/struct framework + D4 data-ref | shipped; wave-1 follow-ups surfaced | 071 |
| 070 wave-1 follow-up | TU-collision pre-filter + ish-mismatch | +30% iter speed; 5 catches | — |
| 070 wave-1 follow-up | STT_NOTYPE → reloc-type-first classification | 16 silent corruption → explicit refuse | — |
| 070 wave-2 follow-up | Callee-ambiguous (≥2 candidates tied at 1.0) | Forced deliberate decision | — |
| 071 | Wave 1 — bulk-port with D1 driver | **64 / 50 (ABOVE FLOOR)** — first ABOVE-FLOOR wave | 072+073 |
| 071 | Wave 2 — D2+D3+D4 stack | 13 / 50 (BELOW); 478 sweep-OK funnel collapsed at compile | 072 |
| 072 | D5 struct vendoring (_OSThread, OSMutex, ...) | +30 candidates compile-OK | 074 |
| 073 | Per-region cross-application — Approach A worked example | architecture | 075 |
| 074 | Wave 3 — full D1-D5 stack | 12 / 50 (BELOW); revealed `static` silent-corruption | 077 |
| 075 | Cross-region apply existing 87 ports | 27 / 70 (BELOW); 50 byte-twin refusals | 076 |
| 076 | Overlay regex + raw-bytes/reloc-parity fallback | architecture | 078 |
| 077 | Strip `static` keyword from rewritten port | 32-byte cumulative shift fixed | 078 |
| 077.b | Extend strip to `static inline` + family survey | rules out `register` strip | 078 |
| 078 | Cross-region wave 2 | 11 / 40 (BELOW); pipeline drained | 079 |
| 079 | D1 v2 overlay prefix + D2 v2 reloc-mask half-byte fix | unlocks last ~30 cross-region | 082 |
| 080 | pokeheartgold extension feasibility | GO-WITH-CAVEATS; nitrocrypto correction | future-082 |

**Cumulative port unlock (EUR baseline):** 99 byte-identical
cross-project ports + 39 cross-region applications + brief 080's ~50-80
projected unlock = roughly **190 of 270** total cross-project +
cross-region candidates, ~70% pipeline saturation. The remaining ~30%
needs struct definitions we don't yet have (D5+) or upstream sources
we haven't pooled (pokeheartgold post-brief-082).

## 2. The 3-signal source-rewrite-trap pattern

This is the most-bit lesson of the arc. Three independent traps with
the same shape: rewriter emits source, compiler accepts it, linker
accepts it, then byte-verify catches a subtle shift.

### Signal 1 — Byte-twin trivial-stub collisions

**First surfaced:** brief 069 wave 1 PR #436 (`func_02007218`
mis-attributed to `OSi_GetUnusedThreadId` when the upstream `OSi_Init`
had the same byte fingerprint).

**Mechanism:** trivial stubs (≤ 0x10 bytes) often share byte sequences
across many functions. `bx lr` alone is 2,632 occurrences in USA's
main binary (per brief 075 §root-cause). Byte-similarity 1.0 means
"matches" but not "uniquely matches."

**Fix:** brief 070 wave-2 follow-up PR #448 introduced the
`CalleeResolution` dataclass with `is_unique` / `is_ambiguous` /
`primary` accessors. The `primary` property returns `None` when
ambiguous, forcing the caller to make a deliberate "is this safe"
decision — no more silent first-wins from dict iteration order.

**Recurring:** brief 075 hit the same shape at the cross-region apply
step (50 of 87 ports refused due to byte-twin ambiguity). The fix is
the same primitive applied to a different stage.

### Signal 2 — STT_NOTYPE extern data refs

**First surfaced:** brief 071 wave 1 PR #442 (`GXi_DmaId` in
`GX_load2d.c` ports — bare identifier with no extern decl in the
rewritten output).

**Mechanism:** when upstream `.c` declares `extern u32 GXi_DmaId;` and
uses it, the compiled `.o` records a reloc pointing to a symbol with
STT_NOTYPE (symbol-type = 0) because the definition lives in another
TU. The previous classifier dropped STT_NOTYPE symbols into
`kind="other"`, which D4's parallel-reloc map skipped — silent
omission, not refusal.

**Fix:** brief 070 wave-1 follow-up PR #446 reordered classification:
**reloc-type first**, then symbol-type fallback. ARM ELF reloc types
encode the call-site nature regardless of symbol type:

| Type | Mnemonic | Kind |
|---|---|---|
| 2 / 3 / 5 | R_ARM_ABS32, R_ARM_REL32, R_ARM_ABS16 | data |
| 1 / 28 / 29 | R_ARM_PC24, R_ARM_CALL, R_ARM_JUMP24 | func |
| 10 / 30 | R_ARM_THM_CALL, R_ARM_THM_JUMP24 | func |

The 16 candidates that had been silently corrupted then surfaced as
explicit `data-ref-unresolved` refusals — caught before brief 071's
compile gate burned cycles on them.

### Signal 3 — `static` keyword preservation

**First surfaced:** brief 074 wave 3 PR #457
(`OSi_IdleThreadProc` + `OSi_CancelThreadAlarmForSleep`).

**Mechanism:** upstream declares the function `static`. The D1
rewriter preserved the keyword verbatim. But our dsd-gap TUs are
**never static** — preserving it caused mwldarm to allocate the
function differently, shifting subsequent symbols by 8 bytes each.
Cumulative 32-byte shift broke all 27 modules (24/27 → 0/27).

**Fix:** brief 077 PR #459 — 2-line regex strip:

```python
rewritten_body = re.sub(
    r"^\s*static\s+", "", rewritten_body, count=1,
)
```

`^` anchor (no MULTILINE) matches only the body's start. Local-scope
`static int x = 0;` inside the body survives.

**Extension:** brief 077.b PR #460 surveyed adjacent storage-class
qualifiers (`inline`, `register`, `__attribute__`, ...) and concluded
that only `static`/`static inline` need the strip — `register` would
break `asm void` declarations if stripped.

### The shape

All three signals share:

1. **Byte-fingerprint matches at 1.0.** The naive "matches → port"
   path emits and tries to compile.
2. **Compile and link succeed.** No syntactic or symbol-resolution
   error.
3. **Byte-verify catches a layout-cascade.** Either wrong-target
   addresses (signals 1 + 2) or wrong-size symbol allocation (signal 3).

The cost of each silent-failure mode is ~10 minutes of bisection per
wave (per brief 074 wave 3). Multiplied across waves, the bisection
cost is what motivates the autonomous-PR scope for each fix.

**Forward-looking implication:** any future cross-project rewriter
that runs `compile → link → byte-verify` should expect a fourth
silent-trap mode and design the refusal-name slot **before** the wave
runs. Examples on the horizon:

- `inline` codegen drift if the upstream marks a function inline but
  our project doesn't have a header declaration that matches.
- `__attribute__((noreturn))` affecting tail-call emission.
- Initializer-list ordering when the upstream uses C99-style
  designated initializers our compiler treats as positional.

The discipline isn't "anticipate every trap" — it's "log every silent
pass as a candidate-for-refusal name."

## 3. Pool-drain calibration

The bulk-port-wave funnel has a characteristic shape. Documenting it
here so future waves can recognise floor-hit waves as drain (expected)
vs regression (unexpected).

### Funnel stages

```
Sweep-OK candidates  (after dedup + prefilter)
       │
       ▼  ~3-5× narrowing
Compile-OK
       │
       ▼  ~1.5-2× narrowing
Link-OK
       │
       ▼  ~1.1-1.3× narrowing
Byte-identical (the port count that lands)
```

### Observed waves

| Wave | Sweep | Compile | Link | Byte-id | Note |
|---|---:|---:|---:|---:|---|
| 069 w1 | 14 | 14 | 14 | **10** | First wave; ad-hoc driver |
| 071 w1 | 893 → 352 → 276 | (implicit) | (implicit) | **64** | ABOVE FLOOR |
| 071 w2 | 478 → ~50 | 33 | 21 | **13** | Pool collapsed at compile |
| 074 w3 | 119 | 51 | 19 | **12** | Substantive ports only |

The narrowing factor compresses sharply once the pre-filters (TU-
collision, ish-mismatch, callee-ambiguous, data-ref-unresolved) are
correctly applied. Pre-filter quality and pool drain interact:

- **Bad pre-filter, fresh pool:** 893 sweep-OK → 64 ports. Driver was
  burning attempts on already-claimed addrs (~75/276) and silently-
  corrupted candidates.
- **Good pre-filter, drained pool:** 119 sweep-OK → 12 ports. Driver
  refuses cleanly; what's left is genuinely harder (needs struct defs,
  data refs, etc.).

### Pool-drain signal

When a wave reports a BELOW-FLOOR count, the actionable question is
**is this drain or regression**:

1. **Drain signal:** sweep-OK count dropping wave-over-wave, but the
   substantive-port (size ≥ 0x18) conversion rate stays healthy
   (≥ 70%). Brief 074 wave 3 was 12 byte-id / 16 substantive = 75% —
   the floor miss was pool depth, not driver quality.
2. **Regression signal:** sweep-OK count steady or growing, but the
   stage-narrowing factors widen (e.g., compile-OK fraction halves
   wave-over-wave). Brief 071 wave 2's compile fraction was 33/478 ≈
   7%, vs wave 1's implicit much-higher rate — that's the D3 struct-
   access regression that drove brief 072.

The metric to track is **byte-id / substantive-candidates** (not /
total). Trivial stubs are noise that pre-filters eat; the substantive-
port rate is the driver-quality signal.

## 4. Skip-reason taxonomy as architecture

Brief 070 D1 shipped with `ok` + `callee-unresolvable`. Each subsequent
PR added a refusal name as a silent failure mode surfaced. The full
taxonomy as of brief 080:

| Refusal | Surfaced | Mechanism caught |
|---|---|---|
| `ok` | 070 D1 | All checks passed |
| `callee-unresolvable` | 070 D1 | Upstream callee has no byte-fingerprint match in our pool |
| `struct-access` | 070 D2 | Body uses `->field` for an incomplete struct |
| `undefined-macro` | 070 D3 | Body references a macro absent from our headers |
| `data-ref-unresolved` | 070 D4 / #446 | Data ref classified as `data` but no matching placeholder |
| `already-complete` | 070 follow-up / #444 | Target addr range claimed `complete` in delinks.txt |
| `ish-mismatch` | 070 follow-up / #444 | Our local symbol THUMB but upstream compiled ARM (or vice versa) |
| `callee-ambiguous` | 070 wave-2 / #448 | ≥2 our placeholders tied at byte-similarity 1.0 |

**Discipline lessons:**

1. **Every silent pass that was later caught downstream as a byte-
   shift is a candidate for a new refusal name.** The skip-reason is
   not "wrong" data — it's a positive signal that the wave's surveyor
   should bisect to find the cause.
2. **Refusal names should be small + greppable.** `callee-ambiguous`
   beats `multiple-candidates-tied-at-high-similarity-threshold`. The
   former shows up clean in wave-output CSVs.
3. **Refusal carries the diagnostic data.** `callee-ambiguous` refusal
   message includes `{cand1@addr1, cand2@addr2}` — decomper can spot-
   check without re-running the sweep.
4. **Refusal taxonomy is forward-compatible.** Brief 081's wave-1
   driver consumes the same eight refusals without code changes; new
   refusals slot in via the same dataclass field.

## 5. Research-mistake refinement (brief 080)

Brief 066's headline finding was directionally correct (cross-project
porting unlocks 300-600 ports, validated at 99 actual landings) but
contained one specific projection that turned out to be a research
mistake. Worth documenting in detail since it's the only meaningful
correction the arc produced.

### The mistake

Brief 066's [`cross-project-feasibility.md`](cross-project-feasibility.md)
§1 noted:

> The `pokeheartgold` repo's separate use of `1.2/sp2p3` for
> `nitrocrypto.o` is a curiosity: that's the **exact same SP** as our
> `.legacy.c` routing tier.

The audit reasoning: pokeheartgold's top-level Makefile sets
`MWCCVER := 2.0/sp2p2`, but the `nitrocrypto` rule overrides it to
`1.2/sp2p3`. The latter matches our project's `.legacy.c` routing tier
exactly. By analogy with pokediamond's `arm9/lib/NitroSDK` (1.2/sp2p3
override against a 2.0/sp1 top-level), the nitrocrypto sub-pool looked
like a high-precision extension target.

### The reality

Brief 080's pokeheartgold clone surfaced:

```
$ ls tools/_vendor/pokeheartgold/asm/nitrocrypto.s
asm/nitrocrypto.s     # ← assembly, not .c

$ ls tools/_vendor/pokeheartgold/lib/include/nitro/crypto/
ls: lib/include/nitro/crypto/: No such file or directory
```

pokeheartgold ships nitrocrypto as hand-written assembly. The
`1.2/sp2p3` MWCCVER is for the **assembler**. There is no `.c` source
to port; the projection is non-existent.

### Why the audit missed it

Brief 066 audited the Makefile flag (`MWCCVER`) but did not verify the
rule target was a `.c → .o` build. The check that would have caught
this:

```bash
grep -E '^\$.*nitrocrypto\..*:.*\.c' Makefile     # would return empty
grep -E '^\$.*nitrocrypto\..*:.*\.s' Makefile     # finds the asm rule
```

The mistake was reasoning by **analogy from build flags alone**, not
by direct inspection of the build inputs.

### The correction's value

Despite landing one wrong finding, the broader brief 066 GO verdict
held: cross-project porting did unlock the projected 300+ ports, and
brief 080's audit produced a corrected pool size for pokeheartgold (39
porting-eligible `.c` files, all in the 2.0 SP family one rev from our
default). The realistic ~50-80 net-new HIGH ports per region remains a
meaningful incremental win.

The lesson is **research deliverables benefit from a "downstream
audit" pass once the prerequisite tools are built**. Brief 066 ran
without the toolchain (intentionally — that was brief 068's job);
brief 080's audit with the now-built toolchain produced a refinement
that's more valuable than the original projection.

**Forward-looking implication:** any "estimated unlock" projection
should carry a re-validation marker for when the prerequisite tools
land. The pattern:

> "X ports projected; revalidate after brief 0NN's toolchain ships."

Without the re-validation marker, brief 066's nitrocrypto headline
would have stayed as accepted truth indefinitely.

## 6. What this means for future cross-project work

Three concrete recommendations for the next pipeline (e.g. brief 082's
pokeheartgold consumption wave):

1. **Pre-wire the refusal taxonomy.** Before running a wave, ensure
   the eight existing refusals are wired into the new pipeline. Even
   if no new refusal name surfaces this wave, the audit-trail
   discipline carries forward.

2. **Track substantive-port rate, not raw count.** A 12-port wave
   with 75% substantive-rate is healthier than a 30-port wave at 30%.
   The badge-climb metric weighs substantive ports more anyway.

3. **Carry research-mistake refinement markers.** Any "expected
   unlock" projection in a research doc should explicitly list the
   downstream-audit checkpoint that would validate or correct it.

These compound across the next ~3 briefs without requiring new
infrastructure.
