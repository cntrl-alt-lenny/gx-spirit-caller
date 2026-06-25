/* CAMPAIGN-PREP candidate for func_021bbf50 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     per-player mla base + :13 bitfield + strength-reduced count loop
 *   risk:       loop SR/induction (r2 counter + r3 ptr) and 0x14 struct stride must hold
 *   confidence: med
 */
/* func_ov002_021bbf50: per-player row at cf16c+(arg0&1)*0x868; walk the 5
 * stride-0x14 slots from +0x30 and count those whose 13-bit id != 0.
 *   id read as lsl#19;lsr#19 -> :13 bitfield (NOT (x<<19)>>19 / mask). */
extern char data_ov002_022cf16c[];

struct Ov002Slot0 { unsigned int id : 13; char _pad[16]; }; /* 0x14 */

int func_ov002_021bbf50(int arg0) {
    struct Ov002Slot0 *p =
        (struct Ov002Slot0 *)((char *)data_ov002_022cf16c +
                              (arg0 & 1) * 0x868 + 0x30);
    int i;
    int count = 0;
    for (i = 0; i < 5; i++) {
        if (p[i].id)
            count++;
    }
    return count;
}
