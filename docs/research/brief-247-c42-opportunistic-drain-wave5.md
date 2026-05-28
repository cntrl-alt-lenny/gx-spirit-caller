[//]: # (markdownlint-disable MD013 MD041)

# Brief 247 — C-42 opportunistic drain wave 5

**Brief:** 247 (decomper). Continuation of C-42 drain with brief 244's
gotcha 11 + 6-step diagnostic order now in the catalog. Halted early
at 19 ships per brief discipline — repeated escapes on undocumented
patterns surfaced for brief 248.

## Headline

**19 .c ships** byte-identical across EUR/USA/JPN. Mix of main +
ov002 (main-heavy: 18 main, 1 ov002). C-yield 19/26 = **73%**
(below brief 247's 85-94% expectation — see escape analysis below).

3-region SHA1 PASS (EUR/USA/JPN).

## 19 shipped picks

### sp3 routing (gotcha 10, 9 picks, all main)

| Addr | Pattern |
|------|---------|
| `0203c824` | helper + global struct byte write |
| `02054b1c` | `*data = helper(*data)` |
| `02056038` | nested null-checks + helper |
| `02087200` | `if (n) helper(0x40); else helper2();` |
| `02087528` | `1 << field` + helper *(deferred — bytes match orig but objdiff fuzzy 66%; same shape as brief 245 escape, not retried)* |
| `0203de80` | helper-chain + ternary `(r==1) ? 0x12 : 0x11` |
| `020444b0` | bool tail `helper(*data, 0x400, arg) != 0` |
| `020446f0` | sibling of 020444b0 (LIT=0x300) |
| `02065e14` | bool tail `helper(arg, data, 6) == 0` |
| `02052b0c` | arg shuffle (a,b,c) → helper(1, a, b, c) |
| `02088e6c` | 2-field global check + helper |
| `02088ea8` | sibling of 02088e6c (f4 != 1) |

### sp3 not needed (no-frame recipes, 7 picks, all main)

| Addr | Pattern |
|------|---------|
| `02007ff4` | helper + bitfield merge + 2 helpers |
| `0201b708` | GetSystemWork + helper + OR field |
| `0201fb8c` | global struct ptr check + helper + return 1 |
| `02020188` | helper(3) + fn-ptr helper + cmp #2 + bool |
| `02020248` | sibling of 02020188 (different fn-ptr) |
| `0201f724` | sibling of 02020188 |
| `02023f4c` | 5-arg helper (stack arg) + return 1 |
| `02032748` | 3-arg helper + return 0 |
| `02033318` | helper + cond helper2 + helper3 + return 0 |
| `02034548` | if-else 4 helpers |
| `02034754` | irq disable + helper + restore |
| `02038c54` | global check + helper + return 1 |
| `0203c13c` | helper1 + cond helper2 + return r |
| `020873cc` | byte arg null-check + helper + AND-NOT |
| `0202b410` | `*data2->f38 = helper(&data1, 4, 0)` |

## 7 escapes deferred (4 patterns)

Each escape was deferred at the 10-min cap. None matched a documented
gotcha cleanly enough to retry within budget.

### Pattern N1 — sub-shape 2 with trailing helper (`020a6b30`)

```text
push {r3, lr}
mov r0, #1; bl helper1    ; r0 = ret (discarded)
ldr r1, [pool]            ; r1 = pool addr (orig)
mov r0, #1; str r0, [r1, #0xc]
bl helper2; pop
```

mwcc allocates pool to r0 (mine) but orig has pool in r1. Brief 242's
gotcha 8 (return matches last LIT) doesn't apply because the function
has a trailing helper call AFTER the field write — r0 can't stay
"alive" with LIT across the bl. Tried `void` and `int return helper2()`
forms; neither matched.

**Surface for brief 248:** "sub-shape 2 with trailing void helper"
needs a different lever than gotcha 8.

### Pattern N2 — predication collapse despite if-then (`020305d8`)

```text
push {r3, lr}
ldr r1, [#0x17c4]
cmp r0, r1; bne L_else
mov r0, #0; pop           ; orig BRANCHES to return 0
L_else: bl helper; cmp; moveq/movne; pop
```

Both `if (X) return 0; ...` and `if (!X) { ... } return 0;` collapsed
to predicated execution (`moveq + popeq`) instead of orig's branch
around. Gotcha 5 (`if-then` vs early-return) didn't unlock — the
braces don't change codegen.

**Surface for brief 248:** mwcc's predication heuristic fires for
this body shape; need source nudge that defeats it.

### Pattern N3 — nested struct ptr-alias (`02032724`)

```text
push {r4, lr}
add r4, r0, #0x1fc        ; r4 = &self->inner (orig)
ldr r1, [r4, #0xc80]
... bl helper(self) ...
str r0, [r4, #0xc80]
```

Orig pre-computes `self + 0x1fc` into r4 (callee-save) and accesses
the field via `[r4, #0xc80]` twice. Mine produces `mov r4, r0; ldr
r1, [r4, #0xe7c]` — combined offset, no alias. The `struct Inner *p
= &self->inner;` source form didn't force mwcc to materialize the
intermediate pointer.

**Surface for brief 248:** how to force mwcc to alias a sub-struct
pointer to a callee-save register.

### Pattern N4 — 2-helper if-else reg-alloc (`func_ov002_0227b090`)

```text
ldr r3, [pool]; ldr r3, [r3]   ; orig uses r3
cmp r3, r0; bne L_else
bl helper1(arg); pop
L_else: bl helper2(arg); pop
```

Orig uses r3 for the pool temp; mine uses r1. With 1-arg function +
1-arg helpers, mwcc should pick r1 (next free). Adding fake args to
helpers feels too risky.

**Surface for brief 248:** when r0 alone is "live for upcoming bl"
and there's no other reg pressure, what makes mwcc pick r3?

### Misc deferrals (not pattern repeats)

- `02087528`: bytes match orig (verified via objdump) but objdiff
  fuzzy reports 66%. Same shape as brief 245's deferral — possibly
  an objdiff scoring artifact with relocations. Skipped per brief
  247 instructions.
- `func_ov002_02259f74`: per brief 247, skipped.
- `020489c4`: data symbol `data_020ff924` referenced but not yet
  in delinks (Undefined at link). Not a code issue; defer until the
  data symbol is split out.

## Cohort progress

Total drained across waves 1-5:

| Brief | Wave | Picks | C-yield |
|---|---|---:|---:|
| 238 | 1 | 30 | 81% |
| 240 | 2 | 8 | 53% |
| 241 | (deferred) | 8 | 100% |
| 242 | scaffolder | 8 | 100% |
| 243 | 3 | 22 | 71% |
| 244 | scaffolder | 7 | 100% |
| 245 | 4 | 33 | 94% |
| **247** | **5** | **19** | **73%** |

Cumulative ships: **127** of the original ~860 C-42 cohort. Yield
varies by what sub-shapes the wave hits — wave 4 (mostly tag6 +
sp3) hit 94%, wave 5 (mixed main thunks with novel shapes) hit 73%.

## Lesson learned: yield correlates with sub-shape homogeneity

Wave 4 (brief 245) hit 94% because it leaned on two HIGH-yield
recipe families:
- tag6 bitfield siblings (17/17 ships via gotcha 7)
- sp3 routing siblings (9/10 ships via gotcha 10)

Wave 5 (brief 247) targeted main-heavy thunks with varied shapes.
Each escape was a novel pattern (4 new escape classes in 19
attempts). The yield drop is not a recipe-library regression — it's
that the remaining cohort has more diversity per pick.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| `tools/check_match_invariants.py` | 0 errors |
| EUR complete_units | 2215 → **2234** (+19) |

## Cross-references

- `docs/research/brief-244-c42-reg-alloc-investigation-wave2.md` —
  gotchas 11 + 6-step diagnostic (foundation of wave 5)
- `docs/research/brief-245-c42-opportunistic-drain-wave4.md` —
  high-yield drain template
- `docs/research/recipe-gotchas.md` — 11 gotchas + 6-step diagnostic
- `docs/research/codegen-walls.md` § C-42 — taxonomy
