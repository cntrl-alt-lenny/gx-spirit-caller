# Batch 11 review (Verifier)

Reviewed commit: 812860643 on worker/batch-11. The code commit is 37a92acee; 812860643 changes only `docs/batches/batch-11.md`.

## Findings

**SHOULD FIX 1: func_02088874 is parked at 80.3% but a natural draft matches 100% (sp3).** The ledger rows for 0x02088874 claim a P-30 register-permutation wall. The draft below, compared with fastmatch's resolved method, gives sp3 100.0% (61/61 words), default 0.0, legacy 7.9. Ship it as `.legacy_sp3.c` and correct the ledger.

**SHOULD FIX 2: func_0208c8cc is parked at 0.0 on all three tiers, but a plain draft matches 100% under legacy** (sp3 65.5, default 0.0). The 0.0 rows are not real scores. Draft below.

**SHOULD FIX 3: 47 in-range candidates were not retried.** The range holds 138 functions of 256 B or less; the batch touched 91. The other 47 were dropped by `wall_aware_headroom.py --exclude-attempted`, which is why the summary says nothing was left to retry. Each has rows for one tier only (36 default only, 10 one non-default, 1 plain). This batch needed a non-default tier for 51 of 69 matches, so a single-tier park is weak evidence. Several score 88-95% (0x02089f60, 0x0208771c, 0x02084dc0, 0x02089418, 0x0208bf3c). The summary does not mention them.

**SHOULD FIX 4: the other parks were probed lightly.** I tried 8 of the 22 with one or two drafts each; 2 matched. The Worker should redraft the rest on all three tiers before calling them walls.

**NOTE 5: the Thumb parks (0x0208b1ac, 0x0208b1c8) were scored with ARM compilers only.** Their 13-21% and 0% say nothing about Thumb. A `#pragma thumb on` draft (the `.thumb.c` convention used in ov004) gave 20.0% and 0.0%, so they probably stay parked, but the ledger rows are vacuous.

**NOTE 6: func_02084e0c `volatile`.** Plain `int` gives 55.0% (default), and the original does reload the flag three times, so the lever is real. Sibling TUs func_02084efc and func_02084fe0 declare the same symbol non-volatile. It is the only volatile in the batch.

**NOTE 7: tier not evidenced for some files.** func_020827ec, 02085888, 02085a74 and 020865d0 match under all three compilers. func_0208cb88 and 0208ea74 (sp3) also match under legacy. Ten default files also match under sp3. For these the suffix is a choice, not a requirement; every other file's chosen tier is its only 100%.

**NOTE 8: no fake-match tricks found** (no asm, pragma, register pin or dummy data). Style levers: func_02086e44 (`b = -b;` on one line with another statement), func_020880bc (two statements on a line), func_020882fc (`(f24 << 30) >> 31` where the original reads a signed 1-bit field), and raw MMIO stores without `volatile`, which match because mwcc does not merge them.

**NOTE 9: callee declarations that differ from the definition.** All reproduce the original's code. Beyond the summary's list: function addresses declared `void(void)` where the callee takes a pointer (func_02088000 and func_02088070 in 020885a0, func_0208ae34 in 0208afac, func_02087640 in 02087f34); `func_0209a83c` and `func_0209a824` called with a pointer, defined `int arg`; `func_02080114` and `func_020800b8` called with `u16` key, defined `u32`; `func_02087d10` defined `u16 v`, called with int.

**UNPROVEN CLAIM 10: "gate3 --scope all, exit 0, no SKIP".** The Worker's log is not in the repo, and I could not get one clean three-region run (table below).

**UNPROVEN CLAIM 11: 0208df94 and 0208e014 reach 100% with volatile MMIO reads.** My draft with volatile reads scored 15.6%. Volatile on hardware registers is ordinary C, not a trick. If the Worker's draft matches, not shipping 268 B is a mistake; put the draft in the batch.

## Checks (this worktree, 812860643)

| Check | Exit | Output |
|---|---|---|
| `git diff de2fe9f34...812860643 --name-status` | 0 | 70 A, 69 D, 2 M: 69 C files, 69 `.s` deletions, delinks, ledger, summary |
| delinks diff, scripted | 0 | 69 path lines `.s:` to `.c:`, nothing else; added set equals deleted set |
| `fastmatch.py eur` on 69 files | 0 | 69 lines `100.0%  OK` |
| compile under all three compilers | 0 | 18 default, 40 sp3, 11 legacy each 100% on own tier; see NOTE 7 |
| `validate_attempts.py` | 0 | `"errors": 0`, shape_conflicts 66 |
| ledger, scripted | 0 | 209 new rows (69 shipped, 140 parked); base prefix byte-identical; every raw park_class is in `park_class_map.tsv`; 22 parked have all three tiers; parked `.s` unchanged; shipped rows match size, tier and 100 |
| `check_fake_matches.py` | 0 | `OK` |
| `check_delink_dupes.py` | 0 | `OK (81 delinks.txt, no duplicate .text addresses)` |
| `check_match_invariants.py --version eur` | 1 | `0 error(s), 13999 warning(s)` |
| `progress.py --version eur` | 0 | Natural-C 458130; base 448234; gain 9896 = sum of matched sizes |
| `wall_aware_headroom.py ...` | 0 | candidate 0, excluded by ledger 1015 |
| `gate3.py --scope all`, run 1 | 2 | `[eur] SHA1 PASS`, `[usa] INFRASTRUCTURE ERROR`, `[jpn] SHA1 PASS`, `1330 passed, 15 skipped`, `GATE EXIT 2` |
| `gate3.py --scope all`, run 2 | 2 | eur and jpn `SKIP`, `[usa] INFRASTRUCTURE ERROR`, `GATE EXIT 2` |
| `gate3.py --scope usa` | 0 | `[usa] SHA1 PASS`, `GATE PASS`, `gate3: GATE EXIT 0` |

No STALE reference-baseline lines appeared in any log. Run 1 failed on 0-byte delink objects and run 2 on a missing mwasm output, both on unrelated `.s` files, which looks like a flaky Windows file write rather than the batch; I still have no single clean `--scope all` run.

## Not checked
The Worker's volatile-MMIO drafts; 14 of the 22 parks beyond a first look; whether the 47 older parks match on other tiers.

## Verdict
The 69 conversions are sound: honest C, 100% on their tiers, delinks and ledger prefix correct, gain equal to matched size. The batch is not finished: two parks (0x02088874, 0x0208c8cc, 360 B) match with plain drafts, the Thumb rows are vacuous, and 47 in-range functions were never retried across tiers. Fix those, then rerun a clean gate.

## Drafts (scratch compiles, outside the repo)

func_02088874, as `.legacy_sp3.c`:

```c
struct S { int active; int f4; char pad8[0x18]; int f20; int f24; int f28; int f2c; };
extern struct S data_021a524c;
extern char data_021a520c[];
extern void func_02095030(int a, int b, int c, int d);
extern int func_020955a8(void);
extern void func_02095678(int a);
extern void func_020955e8(int a);
extern int func_020924c0(void *a, int b, int c);
extern void func_0208738c(int a);
extern void func_020873cc(int a);
extern void func_02087328(int a);
extern void func_02094dd8(int a, int b, int c, int d);

void func_02088874(void)
{
    struct S *s = &data_021a524c;
    int ok;
    int mask;
    if (s->active == 0) {
        return;
    }
    ok = s->f2c >= 0;
    if (ok) {
        mask = 1 << s->f2c;
    } else {
        mask = 0;
    }
    func_02095030(s->f24, s->f28, mask, 0);
    if (ok) {
        int t = func_020955a8();
        func_02095678(1);
        func_020955e8(t);
        while (func_020924c0(data_021a520c, 0, 0) != 0) {
        }
    }
    if (s->f28 != 0) {
        func_0208738c(s->f28);
    }
    if (s->f20 != 0) {
        func_020873cc(s->f20);
    }
    if (ok) {
        func_02087328(s->f2c);
    }
    if (s->f4 == 1) {
        func_02094dd8(0, 0, 0, 0);
    }
    s->active = 0;
}
```

func_0208c8cc, as `.legacy.c`:

```c
typedef unsigned short u16;
typedef unsigned int u32;
extern u16 data_02102498;
extern u16 data_021a6300;

void func_0208c8cc(u32 a, u32 b, u32 c)
{
    u16 flag = data_02102498;
    u32 v = *(u32 *)0x04000000;
    data_021a6300 = a;
    if (flag == 0) {
        a = 0;
    }
    *(u32 *)0x04000000 = (v & 0xfff0fff0) | (a << 16) | b | (c << 3);
    if (data_021a6300 == 0) {
        data_02102498 = 0;
    }
}
```
