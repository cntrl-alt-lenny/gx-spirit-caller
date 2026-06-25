/* CAMPAIGN-PREP candidate for func_02288350 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     stack int buf[2] via out-param; index by (1-bit)&1; -0x3e8 cmp; mul-index 0xc50 global
 *   risk:       reshape-able: orig indexes buf with r2 BEFORE masking (ldr r3,[sp,r2,lsl#2] uses lsr#31 result 0/1 directly) then ANDs r2&1 only for the mul — buf[] index is raw (1-bit), mul index is (1-bit)&1; declaring one combined local would mis-order the and.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct Ent { u16 f0; u16 f2; } Ent;

extern int data_ov002_022cf16c[];   /* indexed by sel*0xc50 here */
extern void func_ov002_0220eb00(Ent *e, int *out);

int func_ov002_02288350(Ent *e)
{
    int buf[2];          /* sp+0, sp+4 */
    Ent *ent;            /* r4 */
    int nsel;            /* r2 = (1-bit)&1 used as array index */
    int v;               /* r3 = buf[nsel] */

    ent = e;
    func_ov002_0220eb00(ent, buf);
    nsel = (1 - (ent->f2 & 1)) & 1;
    v = buf[nsel];
    if (v <= -1000) return 1;
    {
        int sel = nsel & 1;
        int g = *(int *)((char *)data_ov002_022cf16c + sel * 0xc50);
        if (g + v <= 0) return 1;
        return 0;
    }
}
