/* ov002_core.h — canonical ov002 per-player core types + shared-sink
 * signatures for the Cluster-A batch drain (brief 286; band extension
 * brief 296; consolidated to this single build copy in brief 298).
 *
 * THE canonical header — include it from ov002 TUs and trim per file.
 * Brief 298 merged the brief-296 research copy here and deleted the
 * docs/research/ duplicate; future edits go straight to this file.
 *
 * Every type / signature below is PROVEN: compiled into a sample family
 * member under the exact build.ninja ov002 cflags (mwcc 2.0/sp1p5) and
 * byte-compared against the delinked orig .o (bl/pool relocs modulo).
 * Provenance per entry: [memberN] = N sample members byte-verified
 * (briefs 286/296); [shipped] = already a matched .c/.s on main. See
 * docs/research/brief-286-ov002-core-header.md + brief-296 for the tables.
 */
#ifndef OV002_CORE_H
#define OV002_CORE_H

typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

/* --- per-player core: 0x868 bytes/player, indexed (player & 1) ---------
 * The dominant Cluster-A globals. Stride between players is 0x868; index
 * a player's region with (player & 1) * 0x868 as a BYTE offset.            */
extern char data_ov002_022cf16c[];   /* row table (0x868/player) [member3] */
extern int  data_ov002_022cf17c[];   /* per-player count table (0x260 list) [member2] */
extern char data_ov002_022cf178[];   /* per-player event count table */
extern int  data_ov002_022cf184[];   /* per-player count table (0x3a0 list) [shipped 021ba1e8] */
extern char data_ov002_022ce950[];   /* per-player field table (+0x80c scalar) [member1] */
extern char data_ov002_022d016c[];   /* per-player field table (+0xcec scalar) [member1*] */
extern char data_ov002_022cf1a4[];   /* per-player field table */
extern char data_ov002_022ce288[];   /* per-player field table */
extern char data_ov002_022cd3f4[];   /* per-player field table */

/* 20-byte (0x14) sub-row array starts at (row + 0x30); slot.id is a 13-bit
 * field read lsl#19;lsr#19 — type it as a BITFIELD, never (v<<19)>>19
 * (mwcc folds that to & 0x1fff; gotcha 6/16).  [member3]                   */
struct Ov002Slot { unsigned int id : 13; };

/* Accessor "self" pointer: a u16 at +2 carries a bit0 "player" flag, read
 * as a 1-bit field (lsl#31;lsr#31 — bitfield, not & 1).  [member5]         */
struct Ov002Self { u16 f0; u16 b0 : 1; };

/* --- shared-sink signatures --------------------------------------------
 * The batch lever (brief 282): forward the incoming args THROUGH to the
 * sink so they stay live in r0/r1/r2 (reserving those regs); a sink call
 * is what anchors register colouring across the family (gotcha 9/15/26).  */

/* 0x868 sub-row accessors — pass (self, player, idx) straight through.     */
extern int  func_ov002_021c1ef0(struct Ov002Self *self, int player, int idx); /* [member2] */
extern int  func_ov002_021c1e44(struct Ov002Self *self, int player, int idx); /* [member1] */

/* command sink: r0 = command id, r1..r3 = (often packed) payload.          */
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);   /* [member1] */

/* list sink: (player, kind=13, 0) is the dominant call shape.              */
extern int  func_ov002_02253458(int a, int b, int c);            /* [member2] */

/* arg-pack sink: r0 is a packed u16 built by the caller.                   */
extern int  func_ov002_021d479c(int packed, int a, int b, int c);/* [member2] */

/* --- sinks already matched on main (signatures are ground-truth) -------- */
extern int  func_ov002_021bc288(int player, int idx);            /* [shipped 021bcfe4] slot-ready */
extern int  func_ov002_021ff3bc(struct Ov002Self *self);         /* [shipped .s] bool query */
extern int  func_ov002_021ca2b8(int a, int unused, int c, int d);/* [shipped] thunk → 021ca0d4(a,0,c,d) */
extern void func_ov002_021b91c4(int *dst, const int *src);       /* [shipped] *dst = *src */

/* =======================================================================
 * 0x100-0x200 BAND extension (brief 296)
 *
 * The band largely reuses the <0x100 vocabulary above; these are the extra
 * top sinks + globals it needs. Band members are COMPOSITE (multi-sink
 * orchestrators, not pure wrappers), so the header gives shared types/sigs
 * — the bodies are still per-function hand-RE. Sigs marked [shipped …] are
 * ground-truth from a matched .c on main; [member 021ea1b4] are verified
 * here by byte-compile. See brief-296.
 * ======================================================================= */

/* per-something flag/state tables the band's tickers + hub key off. */
extern int  data_ov002_022cd744[];   /* flag table, indexed by a small id [shipped 021ae400] */
extern u16  data_ov002_022ce720[];   /* node fallback ring (mod 128) [shipped 0223de94] */

/* d016c / ce288 are per-player FIELD tables (declared char[] above); the
 * band reads scalar state at fixed offsets — type a local struct per TU,
 * e.g. d016c.f3300 (+0xce4), .f3308 (+0xcec), .f3340 (+0xd0c), .f_d50,
 * .f_d64; ce288.f1484/.f1488/.f1492/.f1496/.f1672. [shipped 021e2b3c/2c5c] */

/* hub: gate on a flag table, then post a command (84 band callers). */
extern void func_ov002_021ae400(int a, int b);                   /* [shipped] cd744[a]?ret:0229ade0(0x31,0,b,0) */

/* d016c-state boolean query (no args). */
extern int  func_ov002_022593f4(void);                           /* [shipped] */

/* d016c-field → 021d479c arg-pack wrapper. */
extern int  func_ov002_021e286c(int arg0);                       /* [shipped] → 021d479c(packed,...) */

/* game-state tickers (no args) — read ce288/d016c, may post via 021b1570. */
extern void func_ov002_021e2c5c(void);                           /* [shipped] */
extern void func_ov002_021e2b3c(void);                           /* [shipped] */

/* node / VBits accessor: arr8[idx] for idx<5 else ce720 ring. */
extern u16  func_ov002_0223de94(void *node, int idx);            /* [shipped] */

/* event-send sink (id, arg, out-ptr, kind). */
extern void func_ov002_021b1570(int a, int b, u16 *out, int kind);/* [shipped via 021e2c5c] */

/* accessor guard + sink used by band-sized 0x868 accessors (pass-through). */
extern int  func_ov002_021b8fcc(int player, int idx);            /* [member 021ea1b4] accessor guard */
extern int  func_ov002_021c2084(struct Ov002Self *self, int player, int idx, int d); /* [member 021ea1b4] */

/* =======================================================================
 * §VERIFIED — brief 348 deep-drain wave 1 (19 picks, EUR/USA/JPN ninja sha1 OK).
 * Per-pick table in docs/research/brief-348-ov002-deep-drain-wave1.md. The
 * small accessor/forwarder/predicate tier (0x24-0x28) is RICHLY matchable-C:
 * 19/20 attempted matched on the first or second pass; the apparent reg-misses
 * are all the PASS-THROUGH LEVER, not reg-walls.
 *
 * THE LEVER (re-confirmed, dominant): an ov002 forwarder keeps its incoming args
 * LIVE by passing them THROUGH to the sink, which bumps the scratch reg the body
 * uses. Diagnose from the orig: a base/temp in r2 (not r1) => 1 pass-through arg
 * (r1 live); a temp in r3 => 2 pass-through args (r1,r2 live). Match by declaring
 * the sink with that arity and forwarding (021b4204/422c/022038b0 = +arg1;
 * 021f0f58 = +arg1,arg2; 021f2068 = +arg1,arg2). A forwarder that keeps r0 across
 * the call RETURNS the sink's result (021f0f58 — 0x183e store goes to r1, not r0).
 *
 * Other recipes confirmed this wave:
 *  - tail-call: `return sink(...)` with no frame -> `ldr ip,=sink; ...; bx ip`
 *    (021ae680/0226b274/022953c4/0220d070).
 *  - value-map `v = arg ? 1 : 0` must be the `if` form (`v=0; if(arg)v=1;`) to get
 *    `mov#0;movne#1`, NOT the ternary (`movne#1;moveq#0`) (021ff14c).
 *  - bitfields: bit0 via `struct{u16 b0:1;}` (lsl#31;lsr#31, NOT &1); a multi-field
 *    holder `struct{u16 b0:1; u16 f1:5;}` reads once + extracts both (0220d070).
 *  - ASYMMETRIC shift extract is safe as raw C `(unsigned)(x<<17)>>23` (mwcc does
 *    NOT fold unequal shifts; only symmetric `(x<<N)>>N` folds to a mask) (02208668).
 *
 * Picks: 021ae680 021e7584 021f0f58 021ff14c 02208668 0224326c 0226b274 0229d2c8
 *   0229d9f8 021de4b0 02203558 021cb084 02222040 022953c4 021b4204 021b422c
 *   022038b0 021f2068 0220d070.
 * HELD: 021b91d0 (int-swap with an `stmfd {r3}; sub sp,#4` legacy frame -> a
 *   compiler-routing candidate (.legacy.c?), NOT a reg-wall).
 * CLASSIFICATION: census = 1109 simple + 629 dispatcher (1738 hand-drainable) vs
 *   1088 permuter — ~62% matchable-C / ~38% reg-walled. This wave confirms the
 *   "simple" tier is genuinely matchable once the lever is applied.
 * GOTCHA-18: cross-wire check clean (no pick references an ov000 symbol); the
 *   3-region sha1 PASS proves the {0,2,5,8} base-0x021aaee0 overlap is byte-isolated.
 * ======================================================================= */

/* =======================================================================
 * §VERIFIED — brief 350 deep-drain wave 2 (17 picks, EUR/USA/JPN ninja sha1 OK).
 * Per-pick table in docs/research/brief-350-ov002-deep-drain-wave2.md.
 *
 * KEY FINDING — the 0x2c-0x40 tier SPLITS into two sub-classes:
 *  (a) clean forwarders / predicates (wave-1 shapes: tail-call arg-pack, guard +
 *      sink + compare, sibling predicates) — HIGH match rate. All 17 picks here.
 *  (b) arithmetic-combine / inline-vs-branch bodies — CODEGEN-SENSITIVE near-miss
 *      (mwcc -O4 makes choices the orig avoided): byte-pack (`(x&0xFF)<<8` →
 *      `lsl#24;lsr#16` vs orig `and;orr lsl#8`); range-opt (`k==6||7||8` →
 *      `sub;cmp;movls` vs orig 3 cmps); inline-vs-outlined const returns; "keep
 *      r0 for the return value, temp in r2" reg choice. These are NOT walls
 *      (logic is right) but resist hand-RE — a soft-wall sub-tier. SELECT (a),
 *      defer (b).
 *
 * Recipes added:
 *  - PASS-THROUGH to a core.h-declared sink whose prototype is too-few-args: call
 *    via a fn-ptr cast `((R(*)(T*,int))func)(self, arg1)` — emits a clean DIRECT
 *    `bl` and sets up the extra live arg (021b0623c... i.e. 0220623c).
 *  - 021d479c ARG-PACK FAMILY: `func_021d479c((u16)((arg0?0x8000:0)|KIND),
 *    (u16)arg1, tag, 0)` tail-call. Members 021d873c/8770 (kind 41), 021df708
 *    (43, tag1), 021e278c (81).
 *  - flag-compare-vs-bitfield: `if (*(int*)(d016c+3308) == self->b0)` folds the
 *    bitfield `>>31` into the cmp (`cmp ip,r2,lsr#31`); inline return-0 matches
 *    when it's the FIRST/only such return (02206100/34); branches when a later
 *    return-0 is shared (02216530 — defer).
 *
 * LEGACY (dual-compile) FINDING: these are mwcc-2.0 functions (orig epilogues are
 * `pop {r3,pc}` / `bx lr`). The .legacy.c (1.2/sp2p3) compile produces a DIFFERENT
 * frame (`stmfd {lr}; sub sp,#4; bx lr`) — it does NOT match. So the predication-
 * vs-branch near-miss here is a 2.0-internal codegen choice, NOT legacy; dual-
 * compile does not rescue them. (Contrast: main's stragglers ARE legacy.)
 *   021b91d0 (the held swap): its `stmfd {r3}; sub sp,#4; …; bx lr` frame matches
 *   NEITHER 2.0 NOR sp2p3 NOR sp3 (sp3 epilogue is `pop {pc}`) — a genuine
 *   straggler (-O0 or hand-asm), candidate for .s escape.
 *
 * Picks: 0220b1dc 0220623c 0228a888 0228a974 0229e814 022aec44 0220de28 0220cd40
 *   02215bc4 021d873c 021d8770 021df708 021e278c 02206100 02206134 02208004 021ded54.
 * CLASSIFICATION refinement: matchable-C bucket (census ~1738) is real, but its
 * EASY sub-tier is the forwarders/predicates; the arithmetic/inline-branch bodies
 * are matchable-in-principle-but-codegen-finicky — slower hand-RE, partial wall.
 * ======================================================================= */

/* =======================================================================
 * §VERIFIED — brief 352 deep-drain wave 3 (16 picks, EUR/USA/JPN ninja sha1 OK).
 * Per-pick table in docs/research/brief-352-ov002-deep-drain-wave3.md. The
 * "select the fast sub-tier" strategy held: 16 of ~22 attempted (the misses are
 * the codegen-finicky sub-tier, deferred as planned).
 *
 * NEW — INDIRECT-DISPATCH FAMILY (02257594/c54/ca8): resolve a record, then
 * tail-`blx` a handler stored in it:
 *   char *r = func_02257464(arg0);
 *   int (*fn)(void*,int);
 *   if (r == 0 || (fn = *(int (**)(void*,int))(r + OFF)) == 0) return 1;
 *   return fn(arg0, arg1);                       // OFF = 12 / 16 / 20
 * mwcc emits `blx r2`. (dcheck gotcha: objdump renders `blx reg` as
 * `msr SP_hyp, reg, LSR pc` — the LSR form, distinct from `bx`'s LSL form;
 * teach the comparator both, else a true match shows as a 1-line near-miss.)
 *
 * Recipes reused / extended:
 *  - 021d479c ARG-PACK family now has 3-payload members: 021d87a4
 *    `(pack(41), (u16)arg1, (u16)arg2, 0)`; 021e1aec `(pack(51), 13, (u16)arg2,
 *    (u16)arg1)`.
 *  - per-player 0x868 stride + Ov002Slot.id (32-bit holder, lsl#19;lsr#19):
 *    0228dda8 `base = cf16c + (arg0&1)*0x868; ((Ov002Slot*)(base+arg1*20+48))->id`.
 *  - pass-through arg1 (02237960/0223405c — the d016c value lands in r2 => r1
 *    live); a `>> 1` bit-test needs an UNSIGNED holder (else `asr` not `lsr`).
 *  - load-ORDER steers reg-alloc: declare the operand the orig loads FIRST first
 *    (0220ced8: `int b=…+2152; int a=…+0;` to match `ldr r2,[+2152]` first).
 *  - a forwarder that RETURNS 0 after its last call (not the call's result) —
 *    `f(...); return 0;` — orig has a trailing `mov r0,#0` (0222b704).
 *
 * DEFERRED (codegen-finicky sub-tier, NOT walls): mirror-reg twins (0220cff8 is
 * 02206100's reg-mirror), multi-store scheduling (022592b8/02259324 — base/zero
 * reg + lazy cd73c load), range-opt of `==N||==N+1[||N+2]` (0220cf0c/022abf88 —
 * mwcc folds to `sub;cmp;movls`). These go to a later permuter/hand-RE pass.
 *
 * Picks: 0220b740 0226db7c 022859b4 02286978 0220ced8 02237960 0223405c 02257594
 *   02257c54 02257ca8 0228dda8 021d87a4 021e1aec 02202318 0226ad24 0222b704.
 * ======================================================================= */

/* =======================================================================
 * §VERIFIED — brief 354 deep-drain wave 4 (14 picks, EUR/USA/JPN ninja sha1 OK).
 * Per-pick table in docs/research/brief-354-ov002-deep-drain-wave4.md. HARDER
 * tier this wave (0x3c-0x44): the easy forwarder/predicate shapes thin and the
 * codegen-finicky class grows, so yield landed at the target floor (14).
 *
 * FAMILY SWEEP (reloc-grep the gap objs for callers of a sink):
 *  - func_02257464 (indirect-dispatch resolver): 12 callers, but the SIMPLE
 *    blx-form family is drained (wave 3); the rest are loops/struct-builders.
 *  - func_021d479c (arg-pack sink): 126 callers — a big vein, but most remaining
 *    are byte-pack-finicky (`and #255; orr …,lsl#8`) or guarded-with-byte-pack.
 *    The clean ones are simple-(u16)-cast tail-calls (021d90c0 = kind 58 with
 *    (u8)arg1 + lo/hi u16 of arg2 — needs `(unsigned)arg2 >> 16` for lsr).
 *
 * NEW / refined recipes:
 *  - the PASS-THROUGH LEVER also rescues "mirror-reg" near-misses: when the holder
 *    lands in r2 (not r1) on a PURE-looking predicate, the sink takes a live arg
 *    — forward it (02292020: func_02291160(arg0, arg1) -> holder to r2, matches).
 *  - u16-HOLDER slot id: `struct { u16 id : 13; }` for an ldrh-loaded id (distinct
 *    from core.h's 32-bit Ov002Slot); asymmetric index `(unsigned)(x<<23)>>21`
 *    (0220a94c/aa20, kind-8 guard + d0250 table + tail-call).
 *  - DUAL-BITFIELD holder `struct { u16 b0:1; u16 :11; u16 f12:2; }` reads the u16
 *    once and extracts bit0 + a high field (02292020/0220b094).
 *  - value-map `r = 0; if (v <= N) r = 1; return r;` (pre-zeroed) emits `movls`
 *    WITHOUT the `movhi` that `return v <= N` adds (02209004).
 *  - multi-counter OR predicate `a>0 || b>0 || c>0` -> cmp/cmple chain (022b3910).
 *
 * DEFERRED (the dominant near-miss class now — ROUTE to permuter / .s /
 * asm_escape --c, which is 2.0-OK for ov002, NOT grind):
 *  - INLINE-vs-BRANCH: a guard's `return 0` inlines (`movne#0;popne`) where the
 *    orig branches to a shared ret-0 epilogue. Unsteerable by C form (the `&&`
 *    rewrite changes the LAST condition's handling). 02267f90, 021efd38 (3-way
 *    dispatch), the 02201e38/0220d7c0/02205dc8 bitfield-bit-compare family,
 *    0220599c (guard+tail-call).
 *  - mirror-reg with no sink to forward to (0220cff8); multi-store scheduling;
 *    021b9210 (held-offset reg-alloc); byte-pack (021d5xxx arg-pack cluster).
 *
 * Picks: 021de598 022090b8 0220a148 02281994 0220444c 02242570 021decdc 0220b094
 *   022b3910 021d1be4 0220a94c 0220aa20 02209004 02292020.
 * ======================================================================= */

#endif /* OV002_CORE_H */
