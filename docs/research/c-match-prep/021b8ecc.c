/* CAMPAIGN-PREP candidate for func_021b8ecc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :8 bitfield guard (lsl#24;lsr#24 at +6), (u16) zero-extend then signed >>8 (asr), <=4 -> movls
 *   risk:       reshape-able: the +6 read is lsl#24;lsr#24 — must be a u16 :8 bitfield (a plain &0xff folds to one `and` and diverges). The hi-byte uses (u16)cast then asr#8, so hold v as signed int after the (u16) cast; if mwcc emits lsr#8 that is a 1-insn diff.
 *   confidence: med
 */
/* func_ov002_021b8ecc: guard on a :8 byte at +6 of the node (==1), then read
 * func_ov002_0223de94(node,0), take its hi byte ((u16)v>>8)&0xff, and return
 * whether that is <=4. Class D: :8 bitfield guard, (u16) zero-extend + signed
 * >>8 (asr), range bool. */
typedef unsigned short u16;

struct Node8ecc { char _pad[6]; u16 k8 : 8; };

extern u16 func_ov002_0223de94(void *node, int idx);

int func_ov002_021b8ecc(void *node) {
    int v;
    if (((struct Node8ecc *)node)->k8 != 1)
        return 0;
    v = (u16)func_ov002_0223de94(node, 0);
    return ((v >> 8) & 0xff) <= 4;
}
