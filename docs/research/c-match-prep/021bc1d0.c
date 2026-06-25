/* CAMPAIGN-PREP candidate for func_021bc1d0 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     :13 bitfield + u16 field + per-player loop (clone-pair w/ 021bc22c)
 *   risk:       orig keeps 2 inductions (base+base+0x30); single struct ptr may collapse to [ip],[ip,#8]
 *   confidence: low
 */
/* func_ov002_021bc1d0: per-player row at cf16c+(arg0&1)*0x868; for each of 5
 * stride-0x14 slots (from +0x30): if slot.id!=0 and arg1 == u16 at +0x38,
 * count++. id is a :13 bitfield (lsl#19;lsr#19); the u16 is at slot+8. */
extern char data_ov002_022cf16c[];

struct Ov002Slot1 {
    unsigned int id : 13;       /* +0x00 */
    unsigned short f04;         /* +0x04 */
    unsigned short f06;         /* +0x06 */
    unsigned short f08;         /* +0x08 (read at row+0x38) */
    unsigned short f0a;
    unsigned short f0c;
    unsigned int   f10;
};                              /* sizeof = 0x14 */

int func_ov002_021bc1d0(int arg0, int arg1) {
    struct Ov002Slot1 *p =
        (struct Ov002Slot1 *)((char *)data_ov002_022cf16c +
                              (arg0 & 1) * 0x868 + 0x30);
    int i;
    int count = 0;
    for (i = 0; i < 5; i++) {
        if (p[i].id) {
            if (arg1 == p[i].f08)
                count++;
        }
    }
    return count;
}
