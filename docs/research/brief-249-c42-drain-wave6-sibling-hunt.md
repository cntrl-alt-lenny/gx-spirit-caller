[//]: # (markdownlint-disable MD013 MD041)

# Brief 249 — C-42 drain wave 6, sibling-family-first strategy

**Brief:** 249 (decomper). First wave to use the sibling-family-first
strategy proposed by brief 247. Hypothesis: yield correlates with
sub-shape homogeneity, so exhausting families one at a time should
sustain wave 4's 94% high-water yield.

## Headline

**27 .c ships across 6 families** → EUR/USA/JPN SHA1 PASS. C-yield
**27/29 = 93%** — matches brief 245's 94% high watermark.

The sibling-family strategy works: each family had a recipe that
shipped clean across all its members. The 2 escapes were both
single-pick speculative pilots from less-uniform families.

## Family enumeration

Brief 249 built a sibling-family classifier by canonicalizing each
unshipped C-42 pick's disasm signature (registers + immediates
abstracted, opcodes and structure preserved). Result: **332 distinct
signatures** across 389 unshipped picks. Top families (size ≥ 3):

| # | Sig hash | Picks | Modules | Body sz | Status |
|---|---|---:|---|---:|:---:|
| 1 | `822e8d30` | **9** | ov006/ov021 | 9 | ✅ 9/9 |
| 2 | `b622ac55` | 4 | main | 14 | ✅ 4/4 |
| 3 | `a76d4b96` | 4 | ov002 | 14 | ✅ 4/4 |
| 4 | `b26134ef` | 4 | ov006 | 12 | ✅ 4/4 |
| 5 | `4459b2cf` | 4 | ov016/17/19 | 13 | ✗ pilot escape |
| 6 | `b75ea868` | 3 | main | 11 | ✅ 3/3 |
| 7 | `27877bf8` | 3 | main | 13 | ✗ pilot escape |
| 8 | `15b436e3` | 3 | ov002 | 9 | ✅ 3/3 |

Total: 6 families exhausted (27 ships), 2 families piloted-and-deferred.

## 27 shipped picks by family

### Family 1 — `helper1() + cond helper2(data.f8) + return 1` (9 picks)

```c
struct PoolData { char pad[8]; int f8; };
extern struct PoolData data_X;
int func(void) {
    helper1();
    if (data_X.f8 != 0) helper2();
    return 1;
}
```

Ships: 9 picks (8 ov006 + 1 ov021):
`021b2668`, `021b3218`, `021b3804`, `021b3da8`, `021b4640`,
`021b4d40`, `021b5318`, `021b596c` (ov006); `ov021_021aa820`.

### Family 2 — `helper1+null+helper2+Task_InvokeLocked` (4 picks)

```c
int func(int arg0, int arg1) {
    int h = helper1(arg1);
    if (h != 0) {
        if (helper2(h, arg0) != 0) return h;
        Task_InvokeLocked(h);
    }
    return 0;
}
```

Key gotcha: brief 247-style early-return `if (h == 0) return 0`
collapsed to predicated execution. Fix: invert the polarity to
`if (h != 0) { ... }` — forces branch-around. Ships: 4 main picks
`0201ed3c`, `0201ed74`, `0201edac`, `0201ede4`.

### Family 3 — `helper1+null+helper2+bool` (4 picks)

```c
int func(int self, int arg) {
    if (helper1(self, arg) == 0) return 0;
    return helper2(self, arg) != 0;
}
```

Ships: 4 ov002 picks `021fa5e8`, `02203df4`, `022054d0`, `0220a7b8`.

### Family 4 — `helper1(&data1) + 4 void helpers + *data2 = K + return 1` (4 picks)

```c
extern char data_X[];
extern int data_Y;
int func(void) {
    helper1(data_X);
    void_h1(); void_h2(); void_h3(); void_h4();
    data_Y = K;
    return 1;
}
```

Ships: 4 ov006 picks `021b23c8`, `021b3b08`, `021b43a0`, `021b4aa0`.

### Family 6 — 6-arg sp3 wrapper + fn-ptr stack arg (3 picks)

```c
/* file: *.legacy_sp3.c */
extern int fn_ptr_target(int, int, int);
void func(int a, int b, int c, int d, int e, int f) {
    helper(a, b, c, d, e, f, (void *)fn_ptr_target);
}
```

Ships: 3 main picks `02004f58`, `02004f88`, `02005210`.

### Family 8 — bitfield(bit9, tag4) + helper + return 1 (3 picks)

```c
struct Self {
    char pad[0x14];
    struct { unsigned int low9:9; unsigned int bit9:1; unsigned int tag4:4; unsigned int rest:18; } f14;
};
int func(struct Self *self) {
    helper(self, self->f14.bit9, self->f14.tag4);
    return 1;
}
```

Ships: 3 ov002 picks `022409ec`, `02243290`, `02244a50`.

## 2 escapes

### Family 5 — 6-arg sp3 with packed local struct (4 picks deferred)

Pilot pick `func_ov016_021b3560` failed at 69% fuzzy. Recipe attempted:
local short-struct with explicit gap fields (pad at offset 4 and 10).
mwcc didn't emit the orig's `add r3, sp, #0` mid-write pattern.

Defer to brief 250 — the orig source likely uses a specific local
struct shape (possibly with union or packed attribute) that the
natural recipe doesn't reproduce.

### Family 7 — base[n].fX + bitfield extract (3 picks deferred)

Pilot pick `func_0201b690` failed at 85% fuzzy. Orig uses `lsl 24;
lsr 24` for the u8 cast; my `(unsigned char)x` emits `and r0, #0xff`.

Defer to brief 250 — need to find the explicit shift form that
defeats mwcc's `and`-emit peephole.

## Strategic finding: sibling-family strategy validated

Brief 247 hypothesized that yield correlates with sub-shape
homogeneity. Wave 6 confirms:
- **6 of 6 families that ship at all → ship 100% of members**
  (no partial wins)
- **2 of 8 families fail at the pilot** — no wasted work on siblings
- **Aggregate yield 93%** vs brief 247's 73% (random-pick)

The hypothesis holds: 20+ percentage points of yield improvement just
from selection discipline. Brief 250+ should continue the sibling-
hunt pattern, with cluster signature hashing as the selection tool.

## Tool: family-hunter scan script

`/tmp/scan_families.py` (not committed; one-shot exploratory tool):
- Canonicalizes each gap-obj function's disasm into a signature
  abstracting registers, addresses, immediates
- Buckets picks by SHA-1 hash of signature
- Sorts by family size

Brief 250 could productionize this as `tools/c42_family_hunter.py`
for repeat use. For now it's prototyped in /tmp/.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| `tools/check_match_invariants.py` | 0 errors |

## Cohort progress

Cumulative C-42 drain across waves 1-6: **154 picks** of original
~860 cohort. At 93% yield this wave, exhaustion projected around
wave 8-9 if family supply holds. Remaining cohort = 362 picks /
~330 distinct signatures (lots of singletons in the long tail).

## Cross-references

- `docs/research/brief-247-c42-opportunistic-drain-wave5.md` —
  yield-correlates-with-homogeneity finding (foundation of wave 6)
- `docs/research/brief-245-c42-opportunistic-drain-wave4.md` —
  prior 94% high watermark
- `docs/research/recipe-gotchas.md` — 11 gotchas + 6-step diagnostic
- `docs/research/codegen-walls.md` § C-42 — taxonomy
