/* ov013_core.h — shared notes for the overlay-013 clean-C co-drain.
 *
 * ov013 is a small paged-menu overlay (tab/page slides, a BLDALPHA fader, a
 * slot→cell map). Partially pre-existing (data_ov013_*, one .s func,
 * ov013_021c9ff8). Small overlay — a thin tail; wave 1 took the clean 5.
 *
 * Key globals:
 *   data_ov013_021cbb20 — display/config block ([0x178]/[0x17c] the two .12
 *     fade levels for BLDALPHA, [0x1a4] packs the current page in bits [20:18]).
 *   data_ov013_021cbb5c — page state ([0x168] also carries the page nibble in
 *     bits [20:18]). Hoist it to a callee-saved reg when used after calls.
 *   data_021040ac — shared global ([0xb6c] step cursor, [0x3c]/[0x40] pending).
 *
 * NOTE: the one size-histogram pair (0x138: 021ca024 / 021ca15c) is coincidental
 * AGAIN — both use the func_0201d47c struct-config helper but have different
 * prologues and bodies. ov009 / ov012 / ov013 all had zero real clone families;
 * read the seeds. Sizes from symbols.txt, not disasm line-count.
 */
#ifndef OV013_CORE_H
#define OV013_CORE_H

extern char data_ov013_021cbb20[];
extern char data_ov013_021cbb5c[];

/* ====================================================================== *
 *  §VERIFIED — co-drain wave 1 (brief 347). 5 .c, all EUR objdiff 100% +   *
 *  ninja rom OK. Recipe library → 7th overlay; 5 of 6 attempts matched.    *
 *  Thin overlay, hit the ~5 target exactly.                                *
 * ====================================================================== */
/* Picks (by recipe):
 *  - 021cb644 graphics-up INIT — clean call sequence (= ov012 021cbeb4 shape).
 *  - 021ca618 slot→cell map — a dense `switch` returning constants; mwcc emits
 *    the `addls pc, pc, r0 lsl#2` branch-table with `mov r0,#K; bx lr` bodies
 *    (no reshape needed — write the switch with cases 0..7 + default 0).
 *  - 021ca5d4 dual-engine BLDALPHA pack — bind reg=0x4000014, derive the sub
 *    engine via `(char*)reg + 0x1000`; the EVA/EVB fields are `(x>>12) & 0x1ff`
 *    and `((x>>12)<<16) & (0x1ff<<16)` (the orig reuses one 0x1ff for both).
 *  - 021ca294 page-count — `(n + 2) / 3` with a constant divisor inlines the
 *    /3 smull magic (0x55555556) and matches as plain `/`.
 *  - 021ca68c page-switch — bitfield INSERT into [0x1a4] bits [20:18] via the
 *    shift form `(field & ~0x1c0000) | (((unsigned)p<<0x1d)>>0xb)`. Two reshapes
 *    (81→100): bind data_cbc3c to a local at the TOP (orig hoists it to r4 across
 *    the calls), and SWAP the if/else so the orig's fall-through block comes
 *    first (`if (reverse) fwd; else rev;` — matches the `beq`/block order).
 *
 * DEFERRED / untried (→ Mac/permuter lane):
 *  - 021cb700 (~80% expected) blx dispatch over data_021040ac[0xb6c] — IDENTICAL
 *    to ov012 021cc01c / ov009 021ad7d4 (post-blx register rotation; not
 *    C-steerable). Not attempted this wave.
 *  - 021cb674 has a relative `bl #-0x194e8` to a far helper (needs the reloc
 *    target symbol); 021ca70c is nested state→pool-word selection.
 *  - 021ca024 / 021ca15c (0x138) bitfield-heavy struct-config (escaping stack
 *    struct → func_0201d47c, bic/orr field edits); 021c9d74 / 021ca2b8 / 021ca42c
 *    / 021ca7cc (0x174–0xe78) are the big bodies. */

#endif /* OV013_CORE_H */
