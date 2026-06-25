/* CAMPAIGN-PREP candidate for func_02231994 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global 3-way switch (0223483c template) + 1-bit bitfield + 1-bit0 rsb
 *   risk:       0220e518 declared void to elide a self mov (self already in r0); if it actually takes self, an extra mov could appear.
 *   confidence: high
 */
/* func_ov002_02231994: global 3-way state switch on [data+0x5a8].
 * Direct sibling of matched func_ov002_0223483c / 0222b2e0.
 *   case 0x80: if 0220e518() != 0 return 0x7f; break;
 *   case 0x7f: 021e13f4(1 - self->bit0, 2, 1); break;
 *   default/fallthrough: return 0.
 */
typedef unsigned short u16;
struct S { u16 f0; u16 bit0:1; u16 rest:15; };

extern char data_ov002_022ce288[];
extern int  func_ov002_0220e518(void);
extern void func_ov002_021e13f4(int a, int b, int c);

int func_ov002_02231994(struct S *self) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 0x80:
        if (func_ov002_0220e518() != 0) return 0x7f;
        break;
    case 0x7f:
        func_ov002_021e13f4(1 - self->bit0, 2, 1);
        break;
    }
    return 0;
}
