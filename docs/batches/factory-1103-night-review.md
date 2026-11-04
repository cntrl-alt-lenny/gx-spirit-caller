# Factory night 9 review (Sol then Sonnet, 87 functions)

Reviewed commit ca1aab7ae (verifier/factory-1103-night, base b8155efa2). Read-only: no build, no gate, no `src/` edit. Fastmatch was not re-run (it needs the toolchain); Brain's "every touched file still 100%" claim is unverified here.

## Commands

| Check | Result |
| --- | --- |
| diff scope | 87 A `.c`, 87 D `.s`, 15 M (4 `delinks.txt`, 9 existing `.c`, `attempts.tsv`, `reference_baseline.txt`). 87 unique function names, none also left as EUR `.s` (the two name hits are USA/JPN `.s`, out of scope). |
| delinks routing (scripted) | every new `.c` appears exactly once across all `delinks.txt`; no deleted `.s` is still routed; no routed `.c` is missing a file; no path routed twice. `func_ov002_02231dec` has one route. |
| ledger | base 16051 lines are a byte prefix of the new file; +1388 rows (115 shipped, 1273 parked), 0 deleted. |
| shipped rows vs files | 114 distinct shipped addresses = 87 `.c` files + 6 Brain reverts + 21 driver reverts (lane commits "reference check: wrong target", each followed by a parked row, `.s` still present). `0x02231dec` shipped twice (K1, K2): one file. |
| reference baseline | only the 2 `func_0200cb50.s` lines are gone. Both are `PC24 .text-0x8`, the two self-calls (`.s` lines 150, 223); the C now resolves them. No baseline line mentions any other new file. |
| grep of 87 new `.c` | 0 `asm`, `#pragma`, `register`, `while(0)`, `__attribute__`, `goto`, raw code words. `volatile` only in `func_0200cb50.c` (0x04000440/0x0400044c) and `func_020931f8.legacy.c` (0x04000100/0x04000102). Both MMIO. |
| data-offset scan (scripted) | for all 87, the set of `data_*` symbols in the C equals the set of `.word data_*` pool entries in the base `.s`; no pool entry carries a `+off`. Offsets in C come from instruction displacements. Honest. |
| sample | 33 files read in full or in part: the 12 largest by ledger size (516-868 B text; none over 1024 B), the 2 volatile files, and spread over main and overlays 002, 004, 008. |
| Brain commits | revert 95e553ab3: 6 restored `.s` byte-identical to base, 6 routes flipped back, 6 parked rows appended. Tidy ca1aab7ae: 14 files, +17/-17, declarations only. 6d5644c06 and b18ae7d79 as described. |

## Findings

**BLOCKER:** none.

**SHOULD FIX 1:** pointer-to-int casts at call sites to fit `int` parameters (mirror of the night-8 rule: fix the declaration, not the call).
- `src/main/func_02055a84.legacy_sp3.c` lines 22-43: `(int)self`, `(int)data_020ffc10`, `(int)a`, and so on, into `func_02058070(int,int,int)` and `func_0205ffc0(int *, int)`; the same file passes `self` as `void *` to `func_02058038`.
- `src/main/func_020608b4.legacy_sp3.c` lines 10-13: `(int)func_02060c9c(...)` and `(int)data_0210xxxx`, although `func_02060c9c` returns `void *`.
- `src/main/func_020580a0.legacy_sp3.c` lines 22-40 and `src/main/func_0205f844.legacy_sp3.c` line 26: string tables cast to `int`.
- `src/main/func_02063288.legacy_sp3.c` lines 33, 43, 51, 64, 89, 98: `(int)data`, `(int)self`.
- `src/main/func_0206ed7c.legacy.c` line 13: `(int)&port, (int)&addr`.
- `src/main/func_0200cb50.c` lines 42, 81, 85: `baseB` is an `int` holding an array address; `func_0208e420((int)(Mtx *)...)`.
- `src/overlay002/func_ov002_02219734.c` line 55: `(int)card`, while line 61 passes the same `struct Record *` to `func_ov002_0227ac64` as a pointer.
- `src/overlay002/func_ov002_022b0198.c` lines 29, 32: `(int)p`.
Retype the callee parameter as a pointer in each file.

**SHOULD FIX 2:** integer carried in a `void *`. `src/overlay002/func_ov002_02245dd4.c` line 14, `int player = (int)self;` with `self` declared `void *` only to match `func_ov002_022536e8(void *self, ...)` (line 12, used at line 40). Same pattern as night-8 SHOULD FIX 5. Declare the parameter `int`.

**NOTE (empty-parens declarations):** 8 `extern T f();` lines drop the prototype so the call may pass fewer arguments: `func_0200a488.c:25`, `func_020608b4.legacy_sp3.c:3`, `func_02063288.legacy_sp3.c:19`, `func_0206d600.legacy.c:40`, `func_02088350.legacy_sp3.c:31`, `func_ov002_021d05a4.c:19`, `func_ov002_02219734.c:25`, `func_ov002_022bdb88.c:17`. Each carries a comment saying the original passes fewer args. It is a prototype lever, not an asm trick; record it as a tracked class.

**NOTE (contortion):** `src/overlay002/func_ov002_021bd948.c` lines 47-54 (`*(unsigned short *)(&(data + po)[eo])` repeated, comma expression `(r4 = 1 - arg0, ...)` inside a condition) and `src/overlay002/func_ov002_022a68ec.c` lines 5-25 (`copy((Entry *)tmp, p)` through an `int[5]` scratch) are fitted shapes, but they use no banned construct. `src/main/func_02088350.legacy_sp3.c` line 28 emulates a bitfield read with `(int)(p->f24 << 31) >> 31`.

**NOTE (volatile):** the two volatile files are MMIO and acceptable. `func_0208cfa4.legacy.c` lines 16-20 writes 0x04001000 and 0x04000249 without `volatile`; harmless here.

**NOTE (func_0200cb50.c):** `if (!n) return;` at lines 39 and 75 tests a computed element address, not a real null check; the 0x04000440/0x0400044c stores are MMIO. The `data_02186ae8.f` read reaches +0xd4 past the symbol, but the base symbol is the only pool word, so this is a displacement, not a mislabelled symbol.

**NOTE (tidy ca1aab7ae):** sound. Return-type changes (`void` to `int`) on 8 externs; `unusedN` parameters added to 9 definitions (`func_02054e54`, `func_02062438`, `func_02068ca8`, `func_0206be44`, `func_0207cfc8`, `func_ov002_02203290`, `func_ov002_02216424`, `func_ov002_0226ae30`, `func_ov002_0229ec04`). No cast was invented. The added params invent arity. Other files still declare these functions with the old arity (for example `func_02068ca8` in `func_0204a2ec.legacy_sp3.c` line 23 and `func_ov002_0226ae30` in several overlay files), which is the project's usual per-file extern drift.

**NOTE (revert 95e553ab3):** sound. The ledger rows are classed `tool-anomaly` / `UNCLASSIFIED:tool-anomaly` with the brief `factory-1103-integration`, which is acceptable but not a real park class; reclassify to a volatile-only class when one exists.

**NOTE (ledger naming):** lane rows carry briefs `factory-1103-K*` and `factory-1104-K*` for one night; last-row-per-address says "parked" for 50 of the 87 shipped addresses (the other tiers parked after the default-tier ship). Size credit must come from files, not row order.

## Not checked

54 other new files by eye; USA and JPN; which of the K1/K2 copies of `func_ov002_02231dec` Brain kept; any build or fastmatch result, including the claim that each touched file is still 100%.

## Verdict

merge
