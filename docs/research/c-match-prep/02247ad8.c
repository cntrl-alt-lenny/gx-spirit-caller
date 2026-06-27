/* CAMPAIGN-PREP candidate for func_02247ad8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :1 and :13 bitfields for lsl#31/lsr#31 and lsl#19/lsr#19; 1-arg sink protos
 *   risk:       Orig pre-increments base via ldr [r6,#4]! (r6 reserved across loop) — strength-reduction of cacc0[i]; mwcc should match but may keep a separate index reg. reshape-able (load-order/IV) else minor scheduling. struct-guessed: Cacc0Ent stride=4 inferred.
 *   confidence: med
 */
/* func_ov002_02247ad8 (cls C): two gate calls, then scan a 13-bit-keyed table
 * calling func_022477e8(self, i) until a hit (->1) or the key runs out (->0). */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

struct Ov002Self { u16 f0; u16 b0 : 1; };     /* bit0 of the u16 at +2 */
struct Cacc0Ent  { u32 active : 13; };         /* low 13 bits gate the slot */

extern struct Cacc0Ent data_ov002_022cacc0[];
extern int func_ov002_021ca2b8(int bit0);
extern int func_ov002_021bb068(int id);
extern int func_ov002_022477e8(struct Ov002Self *self, int idx);

int func_ov002_02247ad8(struct Ov002Self *self) {
    int i;

    if (func_ov002_021ca2b8(self->b0) == 0)
        return 0;
    if (func_ov002_021bb068(0x13f2) != 0)
        return 0;
    for (i = 0; data_ov002_022cacc0[i].active != 0; i++) {
        if (func_ov002_022477e8(self, i) != 0)
            return 1;
    }
    return 0;
}
