[//]: # (markdownlint-disable MD013 MD041)

# Brief 232 — C-39 drain wave 5 (C-39b-solo cohort)

**Brief:** 232 (decomper). Continue C-39 cohort drain. Pick C-39b-solo
or C-39+b+d compound. Apply brief 226/228/229/230 locked recipes.
Target: 25-40 ships, hard-tier 7.2% → 7.5-7.8%.

## Headline

**35 .c ships → hard-tier 7.2% → 7.42%** (620/8351, +35). All in
`src/overlay002/`. Cohort chosen: **C-39b-solo** per brief 232's
guidance (recipe locked, smaller per-pick effort).

3-region SHA1 PASS preserved (EUR/USA/JPN).

## Recipe survey: 116 unshipped C-39b candidates → 76 after
detector tightening

Brief 215's "swap-tail-call register temp" detector regex
(`mov rD, r0`) was too permissive — matched `mov rD, r0, lsl/lsr ...`
shift instructions. Tightened to `mov rD, r0$` (plain reg-to-reg)
gives 76 strict-clone candidates. Of these, 57 are "simple 2-bl"
shape (3-arg helper + tail-call), the cleanest sub-cohort.

## Variant catalog (this wave)

All 35 ships fit one of 5 brief 230-style sub-shapes:

### Pattern E1 — cross-call compare (Idiom 2)

```c
int n = helper(arg1);
return n CMP helper(arg2);
```

2 ships: `02293068` (`<` same helper, 1-bit0 vs bit0), `022066b0`
(`> 0` with `+` arithmetic).

### Pattern E2 — helper + conditional helper2 + return helper1

```c
int r = helper1(self);
if (r == 1) helper2(...args...);
return r;
```

1 ship: `021f8760` (5-arg helper2 with stack-spill 5th arg).

### Pattern E3 — 2-helper sequence return 1 (brief 228 Shape α variant)

```c
helper1(self);
helper2(self->f2.bit0, self->f2.multi5, ~0);
return 1;
```

1 ship: `021fae4c` (helper2 takes 3 args including sentinel `~0`).

### Pattern E4 — helper-reuse + early-return + tail-call (Idiom 1 variant)

```c
int n = helper1(self);
if (helper2(self->f2.bit0, n, K) < 0) return 0;
return helper3(self, arg1);
```

1 ship: `022967a0`.

### Pattern E5 — early-return-then-tail-call (the BIG family — 30 ships)

```c
if (helper1(arg, ...) CMP K) return 0;
return helper2(self, arg1);
```

The mwcc 2.0 codegen for `if (cmp) return 0; ...rest...` emits
**conditional pop** (`ldmltia`/`ldmltia`/`ldmeqia`/`ldmneia`) rather
than the brief 230 if-then form's branch + fall-through-zero. This
is the dominant cohort shape — 30 of 35 ships fit here.

30 ships, sub-variants by comparison polarity (`<`, `>=`, `==`, `!=`,
`<= N`, `>= N`) and helper arg shape (1-arg `bit0`, 2-arg
`bit0+multi5`, 3-arg `bit0+multi5+f0`, 3-arg `bit0+11+f0`,
`bit0+f4_field9`, `1-bit0`, helper-with-fn-pointer, MMIO check).

## Recipe lock — when to use early-return vs if-then form

Brief 230's lesson confirmed: **mwcc compiles `if (x == 0) return
CONST; rest;` differently from `if (x) { rest; } return CONST;`.**

- Orig has `cmp; movCC #0; ldmCCia` (predicated pop) → use
  **early-return** form: `if (helper() CMP K) return 0; ...`
- Orig has `cmp; bne .L; ...; .L: mov #0; pop` (branch + fall) → use
  **if-then** form: `if (helper() != 0) { ...rest...; } return 0;`

This wave: 32 of 35 ships use early-return form (the cohort norm
under mwcc 2.0). 3 use if-then form (`0220d174`, `02291fa8`,
`022960e8`, `0228bc8c`, `02291e94`) — picks where the orig
explicitly has a `beq`/`bne` branch with a `.L:` join point that
falls through to a final `mov r0, #0`.

## Source idiom for fn-pointer args

3 ships (`0220d174`, `02291fa8`, plus 1 more) pass a function
pointer as an argument:

```c
extern int func_0202ed90(int);
extern int helper1(unsigned int bit, int (*fnref)(int));
helper1(self->f2.bit0, func_0202ed90);
```

mwcc emits `.word func_0202ed90` in the literal pool — matches orig
when the `.word` symbol name aligns.

## Ships catalog (35 picks)

All `src/overlay002/`:

| Addr | Size | Pattern | Notes |
|---|---:|---|---|
| `02293068` | 0x38 | E1 | cross-call `<` same helper |
| `022066b0` | 0x44 | E1 | cross-call `+` arithmetic `> 0` |
| `021f8760` | 0x4c | E2 | helper1 + 5-arg helper2 + return r1 |
| `021fae4c` | 0x30 | E3 | 2-helper + `~0` sentinel |
| `022967a0` | 0x44 | E4 | helper-reuse + early-return + tail |
| `02286f74` | 0x44 | E5 | helper1 `< 0` + bool ge/lt 2 |
| `02296a38` | 0x40 | E5 | helper(bit0, -1, 0) `< 0x7d0` + tail |
| `02208560` | 0x40 | E5 | helper(bit0, f0) `!= 3` + bool `>= 2` |
| `0220dc9c` | 0x40 | E5 | helper(bit0, 11, f0) `!= 0` + tail |
| `02206884` | 0x40 | E5 | helper1(self) `== 0` + bool `!= 0` |
| `0228b810` | 0x40 | E5 | null-check + helper + tail |
| `02296b80` | 0x40 | E5 | helper(bit0, f0, 0) `< 2` + tail |
| `02296bc0` | 0x40 | E5 | helper(bit0, multi5) `< 5` + tail |
| `02204bdc` | 0x40 | E5 | helper(bit0, multi5) `< 2` + tail |
| `02206954` | 0x40 | E5 | helper(bit0, 11, f0) `== 0` + tail |
| `0220dc5c` | 0x40 | E5 | helper(bit0, 11, f0) `!= 0` + tail |
| `0228b850` | 0x44 | E5 | null + helper(1-bit0) `== 0` + tail |
| `02204040` | 0x44 | E5 | helper(bit0) + helper2 != 0 ? 2 : 0 |
| `02208b68` | 0x48 | E5 | helper(bit0, multi5, 0x17d2) `== 0` + tail |
| `022093c4` | 0x48 | E5 | sibling of 02208b68 (tag 0x1814) |
| `0220bcdc` | 0x44 | E5 | helper(bit0, f4_field9) `< 0` + tail |
| `0220d02c` | 0x44 | E5 | sibling of 0220bcdc |
| `0220d5f4` | 0x44 | E5 | helper(bit0, multi5, f0) `== 0` + tail |
| `0220d77c` | 0x44 | E5 | sibling of 0220d5f4 polarity |
| `0220db60` | 0x44 | E5 | sibling of 0220d5f4 different tail |
| `0221ee5c` | 0x44 | E5 | sibling of 0220bcdc different tail |
| `02224dd0` | 0x44 | E5 | sibling of 0221ee5c different tail |
| `022096e4` | 0x44 | E5 | helper(self) ne + helper2(bit0, field9) `>= 0` |
| `02206668` | 0x48 | E5 | tag6 early-return-1 + cross-call compare |
| `0220d174` | 0x50 | if-then | tag6 skip + helper(bit0, fnptr) + tail |
| `02291fa8` | 0x54 | if-then | helper(bit0, fnptr) + bool `> 1` |
| `02224398` | 0x4c | E5 | MMIO check + helper bit-check + tail |
| `022960e8` | 0x4c | if-then | helper1 + helper2(1-bit0, 1, 0, 1) `> 0` |
| `0228bc8c` | 0x44 | if-then | helper1 + helper2(1-bit0, 1, 1) `!= 0` |
| `02291e94` | 0x44 | if-then | helper1 + helper2(1-bit0, 0, 1) `> 0` |

## Picks deferred (with reason)

- **`func_ov002_02295284`** (0x58): double-call disjunction
  `(helper(bit0, T1) != 0) || (helper(bit0, T2) != 0)`. Tried
  natural `||` short-circuit form; mwcc emits 1 fewer instruction
  than orig (54% fuzzy). Likely needs explicit `if/return 1`
  chain in a specific shape — defer to a focused brief.
- **`func_ov002_0220673c`** (0x44): cross-call compare with `dead`
  movlt result that's overwritten by subsequent tail-call setup.
  Brief 230 pattern — the orig's `movlt r0, #0` is genuinely dead
  (mwcc artifact from a pattern I couldn't reproduce in 2 tries).
  Defer.

## New wall pattern: `0228b810`-shape null+helper-check

Surfaced shape with `movs r4, r1` (S=1) setting flags **at the top**
for the arg1==0 early-return:

```c
if (arg1 == 0) return 0;       // → movs r4, r1; moveq #0; ldmeqia
if (helper(self, bit0) == 0) return 0;
return helper2(self, arg1);
```

mwcc emits the S-flag-on-mov peephole when the C compares an arg
directly to 0 before any other use. Worked example: `0228b810`
(strict bit0) and `0228b850` (`1 - bit0`). Worth flagging as a
sub-pattern for scaffolder's brief 233 follow-on if cohort grows.

## Metric deltas (EUR)

| | Before | After | Δ |
|---|---:|---:|---:|
| `matched_functions` | 2028 | 2063 | **+35** |
| `complete_units`    | 1991 | 2026 | **+35** |
| `matched_code_percent` | 5.59% | 5.66% | +0.07 pp |
| hard tier matched   | 7.21% | 7.42% | **+0.21 pp** |

3-region SHA1 PASS preserved per pick: EUR ✓, USA ✓, JPN ✓.
27/27 modules OK per region.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | ✓ OK |
| USA `ninja sha1` | ✓ OK |
| JPN `ninja sha1` | ✓ OK |
| `dsd check modules` | ✓ 27/27 OK |
| `tools/check_match_invariants.py` | ✓ 0 errors |
| `ruff check .` | ✓ All checks passed |
| Hard tier % | **7.21% → 7.42%** (620/8351) |

## Cross-references

- `docs/research/brief-226-c39-subclass-sign-check-helper-reuse.md` — sub-shape definitions (Idiom 1/2/3)
- `docs/research/brief-228-c39-wave3-sub-shapes.md` — V0-V9 + Shape α
- `docs/research/brief-229-c39c-d-pilots-and-c38-nonleaf.md` — C-39d locked recipe
- `docs/research/brief-230-c39-wave4-cohort-hunt.md` — early-return vs if-then form discovery
- `src/overlay002/func_ov002_02293068.c` — wave 5 E1 canonical
- `src/overlay002/func_ov002_02286f74.c` — wave 5 E5 canonical
- `src/overlay002/func_ov002_0220d174.c` — wave 5 if-then canonical (fnptr arg)
