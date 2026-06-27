/* CAMPAIGN-PREP candidate for func_02013b4c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     dense 0..10 switch => addls-pc jump table; bit0 &1 gate; conditional store via if(==N); BIC=&~
 *   risk:       struct-guessed: SystemWork 0x8d8/0x920 and dst+8 inferred. Table only forms if mwcc keeps cases 0..10 dense (incl. empty case10) and bit0 read matches; orig bit0 is lsl#31;lsr#31 (:1 bitfield) vs &1->`and`. reshape-able (bitfield + dense cases).
 *   confidence: low
 */
/* func_02013b4c(dst): SystemWork enable-bit(0x8d8 bit0) gate, then a DENSE
 * jump-table dispatch on SystemWork[0x920] for values 0..10 (orig uses
 * `cmp #0xa; addls pc,pc,r0,lsl#2`). Most arms store a packed status word to
 * dst->f8 (off 8); arm1 also clears 0x2000 in *func_0201b75c(); arms 4/5
 * gate their store on func_0201b7e0(dst)==4 / ==5. */
extern char *GetSystemWork(void);
extern int  *func_0201b75c(void);
extern int  func_0201b7e0(int *dst);

void func_02013b4c(int *dst)
{
    char *sw = GetSystemWork();
    if ((*(int *)(sw + 0x8d8) & 1) == 0)
        return;
    switch (*(int *)(sw + 0x920)) {
    case 0:
        dst[2] = 0x00020100;
        break;
    case 1:
        dst[2] = 0x00020200;
        {
            int *p = func_0201b75c();
            *p &= ~0x2000;
        }
        break;
    case 2:
        dst[2] = 0x00020300;
        break;
    case 3:
        dst[2] = 0x00020400;
        break;
    case 4:
        if (func_0201b7e0(dst) == 4)
            dst[2] = 0x00020500;
        break;
    case 5:
        if (func_0201b7e0(dst) == 5)
            dst[2] = 0x00020600;
        break;
    case 6:
        dst[2] = 0x00020700;
        break;
    case 7:
        dst[2] = 0x00020800;
        break;
    case 8:
        dst[2] = 0x00020900;
        break;
    case 9:
        dst[2] = 0x00020a00;
        break;
    case 10:
        break;
    }
}
