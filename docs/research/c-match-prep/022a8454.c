/* CAMPAIGN-PREP candidate for func_022a8454 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     branch-table via switch; lsl;lsr pairs as &mask bit-extracts; mla offset
 *   risk:       permuter-class: tail cmp/cmpeq/movne chain (sel==0xd && global==h&1) is awkward to coerce; the mla 0xcc index and 0x588 base offsets are struct-guessed.
 *   confidence: low
 */
/* func_ov002_022a8454: dispatch on func_0225929c(obj) (0..6) via a jump
 * table where cases 0..2 return 0 and cases 3..7 fall through to a
 * bitfield bit-test body. Reads u16 at obj+0x590, extracts a 5-bit
 * selector sel=(h>>2)&0x1f and bit b0=h&1, then tests a packed bit in
 * one of two/three dwords at obj+0x588 (+0x488 for sel==0xb). */

struct obj8454 {
    char pad[0x488];
    unsigned int w488[1];   /* 0x488, indexed by b*0xcc/4 via mla 0xcc */
};

extern int  func_ov002_0225929c(void *obj);
extern void func_ov002_022ae718(int *g);
extern int  data_ov002_022cd73c[];   /* field at +4 */
extern int  data_ov002_022d1a9c[];

int func_ov002_022a8454(char *obj) {
    int sel;
    int b0;
    unsigned int h;
    unsigned int word;

    switch (func_ov002_0225929c(obj)) {
    case 0:
    case 1:
    case 2:
        return 0;
    default:
        break;
    }

    h = *(unsigned short *)(obj + 0x590);
    sel = (h >> 2) & 0x1f;
    if (sel <= 0xa) {
        b0 = h & 1;
        word = *(unsigned int *)(obj + (b0 << 2) + 0x588);
        return (word >> sel) & 1;
    }
    if (sel == 0xb) {
        b0 = h & 1;
        word = *(unsigned int *)(obj + b0 * 0xcc + 0x488);
        return (*(unsigned int *)(obj + (b0 << 2) + 0x588)
                >> (((h >> 0x12) & 0xff) - word + 0x10)) & 1;
    }
    if (data_ov002_022cd73c[1] == (int)(h & 1) && sel == 0xd)
        return 0; /* placeholder: see asm cmpeq path */
    if (data_ov002_022cd73c[1] != (int)(h & 1) || sel != 0xd)
        return 0;
    func_ov002_022ae718(data_ov002_022d1a9c);
    return 0;
}
