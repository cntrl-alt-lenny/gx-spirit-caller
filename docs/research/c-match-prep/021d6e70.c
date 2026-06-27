/* CAMPAIGN-PREP candidate for func_021d6e70 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     byte-unpack both args; cf1a8 ring walk (stride8,link+6); :4 type==0xa; partial
 *   risk:       struct-guessed + INCOMPLETE: supplied asm is truncated mid-body (~half of 484B; ends at ldr r0,_LIT7) so the tail and _LIT6/_LIT7 consts are unknown; also `cmp id, =data_022d0650` (address vs 13-bit id) is semantically ambiguous. Campaign must supply full asm.
 *   confidence: low
 */
/* func_ov002_021d6e70 (ov002, cls D): byte-unpack both args, walk a linked
 * record ring (cf1a8, stride 8, link at +6) and for nodes whose :4 type==0xa
 * whose per-player slot id == data_022d0650, call 021d9144; then range/limit
 * guards. WARNING: the supplied asm is TRUNCATED at `ldr r0,_LIT7` (~half of
 * size=484) -- only the prologue, the ring loop, and the first two tail guards
 * are modelled. The remaining body is UNKNOWN. */
#include "ov002_core.h"

extern int  func_ov002_021b9ecc(int a, int b);
extern void func_ov002_021d9144(int a, int b, int c);
extern unsigned short data_ov002_022cf1a6[];
extern unsigned short data_ov002_022cf1a8[];
extern int  data_ov002_022d0650;

struct RingNode { unsigned short w0; unsigned short f4 : 4; unsigned short _pad; unsigned short link; };

void func_ov002_021d6e70(int arg0, int arg1) {
    int a_lo = arg0 & 0xff;
    int a_hi = (arg0 >> 8) & 0xff;
    int b_lo = arg1 & 0xff;
    int b_hi = (arg1 >> 8) & 0xff;
    int pb;
    unsigned int node;
    if (a_lo == b_lo)
        return;
    pb = (a_lo & 1) * 0x868;
    if (*(unsigned short *)(data_ov002_022cf16c + pb + a_hi * 0x14) == 0)
        return;
    node = *(unsigned short *)(data_ov002_022cf1a4 + pb + a_hi * 0x14);
    if (node != 0) {
        do {
            unsigned short w0 = data_ov002_022cf1a8[node * 4];
            int typ = data_ov002_022cf1a8[node * 4 + 1] & 0xf;
            int lo = w0 & 0xff;
            int hi = (w0 >> 8) & 0xff;
            unsigned short next = data_ov002_022cf1a8[node * 4 + 3];
            if (typ == 0xa &&
                ((struct Ov002Slot *)(data_ov002_022cf1a6 + (lo & 1) * 0x868 + hi * 0x14 + 0x30))->id
                    == (unsigned int)(int)&data_ov002_022d0650)
                func_ov002_021d9144(lo, hi, 0);
            node = next;
        } while (node != 0);
    }
    if (func_ov002_021b9ecc(a_lo, a_hi) != 0x14ac /* _LIT6 (truncated, placeholder) */)
        return;
    if (b_hi >= 5)
        return;
    /* TRUNCATED: asm ends here at `ldr r0,_LIT7`; remaining body unmodelled. */
}
