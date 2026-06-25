/* CAMPAIGN-PREP candidate for func_02296ebc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     2-bit guard; mla base+f0*stride; dual cursor +0x14; <<0x13>>0x13 field; lsr#8 tst#1
 *   risk:       reshape-able: orig walks two pointers (r3=bank+0x30 advancing, ip=byte offset) — if mwcc folds to one base+i*0x14 the add/ldr pattern diverges; keep separate `bank` base and `off` cursor, don't index bank[i].
 *   confidence: low
 */
// func_ov002_02296ebc — guarded scan loop, bit-test, mla base
typedef struct Obj Obj;
struct Obj { unsigned short pad0; unsigned short flags; };

extern int func_ov002_02291160(void);
extern int data_ov002_022cf16c[];   /* stride 0x868 */

int func_ov002_02296ebc(Obj *obj)
{
    int f12 = (obj->flags >> 12) & 3;     /* lsl#0x12;lsr#0x1e */
    if (f12 == 0)
        return func_ov002_02291160();

    {
        int f0 = obj->flags & 1;
        char *bank = (char *)data_ov002_022cf16c + (f0 & 1) * 0x868;
        int i, off;
        for (i = 0, off = 0; i < 5; i++, off += 0x14) {
            int w = *(int *)(bank + 0x30 + off);
            if (((w << 0x13) >> 0x13) == 0)         /* low-13 field == 0 */
                continue;
            if (*(unsigned short *)(bank + 0x38 + off) != 0)
                continue;
            if ((*(int *)(bank + 0x40 + off) >> 8) & 1)
                return 1;
        }
        return 0;
    }
}
