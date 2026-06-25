/* CAMPAIGN-PREP candidate for func_021bc22c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     :13 bitfield + u16 at +6 + per-player loop (clone of 021bc1d0)
 *   risk:       same dual-induction risk as 021bc1d0; field offset 0x36 placement in struct
 *   confidence: low
 */
/* func_ov002_021bc22c: clone of 021bc1d0 reading the u16 at +0x36 (slot+6)
 * instead of +0x38. Same :13 id bitfield + per-player stride-0x14 walk. */
extern char data_ov002_022cf16c[];

struct Ov002Slot2 {
    unsigned int id : 13;       /* +0x00 */
    unsigned short f04;         /* +0x04 */
    unsigned short f06;         /* +0x06 (read at row+0x36) */
    unsigned short f08;         /* +0x08 */
    unsigned short f0a;
    unsigned short f0c;
    unsigned int   f10;
};                              /* sizeof = 0x14 */

int func_ov002_021bc22c(int arg0, int arg1) {
    struct Ov002Slot2 *p =
        (struct Ov002Slot2 *)((char *)data_ov002_022cf16c +
                              (arg0 & 1) * 0x868 + 0x30);
    int i;
    int count = 0;
    for (i = 0; i < 5; i++) {
        if (p[i].id) {
            if (arg1 == p[i].f06)
                count++;
        }
    }
    return count;
}
