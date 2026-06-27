/* CAMPAIGN-PREP candidate for func_022718f4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: emit field stores in asm order; d0250 :13 source bitfield (lsl#19;lsr#19); word0 :15/:9 packs; @0x16 :1/:2 bitfield inserts; (n>1?n-1:0) if-assign
 *   risk:       ASM-TRUNCATED: body cut at .L_238 (~97 insns) so the tail is unknown/incomplete — and many separate bitfield stores to the same word risk extra RMWs vs orig's fused str. struct-guessed; confirm full asm before building
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_022718f4 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED + ASM-TRUNCATED (body shown ends at .L_238;
 * the function is 388 bytes / ~97 insns and the JSON dump is cut off, so the
 * tail after the arg2 switch is reconstructed only up to what is visible).
 *
 * Store-order heavy builder. Packs cd300 word@0 from a u16 looked up in d0250
 * (indexed by arg1): bit0=arg0&1, :15 field@bit8 = (d0250[arg1] & 0x1fff),
 * :9 field@bit23 = arg1 (single fused store). Then u16@6=0; @0x16 bit2=(arg3>0);
 * @0x16 :2@bit4 = (arg3>1?arg3-1:0); word0 bits6-7=0b10, bit5=1; @0x16 clear
 * bit1 & bit3; then dispatch on arg2 (0/1/2).
 *
 * NOTE: _LIT2 = 0xff8000ff (the :15-field clear mask), and the orig materialises
 * 0x7fffff via `rsb r0,ip,#0xfe` (0xfe-0xff8000ff). _LIT3 (the func_021bb068 tag)
 * is not in the truncated literal pool — placeholder below.
 */
typedef unsigned int   u32;
typedef unsigned short u16;

struct Hdr300 {
    u32 b0    : 1;   /* bit0  */
    u32 b1to4 : 4;   /* bits1-4 */
    u32 b5    : 1;   /* bit5  */
    u32 b6_7  : 2;   /* bits6-7 */
    u32 f8    : 15;  /* :15 field at bit8 */
    u32 hi9   : 9;   /* :9 field at bit23 */
};
struct F30016 {
    u16 b0 : 1; u16 b1 : 1; u16 b2 : 1; u16 b3 : 1;
    u16 f4 : 2;       /* bits4-5 */
    u16 _r : 10;
};
struct D0250 { u16 f13 : 13; u16 _r : 3; };   /* u16 element, :13 field */

extern char data_ov002_022cd300[];
extern char data_ov002_022d0250[];
extern int  func_ov002_021bb068(int tag);

void func_ov002_022718f4(int arg0, int arg1, int arg2, int arg3) {
    struct Hdr300  *h = (struct Hdr300 *)data_ov002_022cd300;
    struct F30016  *f = (struct F30016 *)(data_ov002_022cd300 + 0x16);
    h->b0  = arg0;
    h->f8  = ((struct D0250 *)(data_ov002_022d0250 + arg1 * 4))->f13;
    h->hi9 = arg1;
    *(u16 *)(data_ov002_022cd300 + 6) = 0;
    f->b2 = arg3 > 0;
    f->f4 = (arg3 > 1) ? arg3 - 1 : 0;
    h->b5   = 1;
    h->b6_7 = 2;
    f->b1 = 0;
    f->b3 = 0;
    if (arg2 == 0) {
        h->b6_7 = 1;
        h->b5 = func_ov002_021bb068(0x13f2) > 0;
    } else if (arg2 == 1) {
        h->b6_7 = 0;
    } else if (arg2 == 2) {
        f->b1 = 1;
    }
    /* ... truncated tail ... */
}
