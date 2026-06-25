/* CAMPAIGN-PREP candidate for func_0222c524 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield index (&1)*0x868, u16 gate, :13 id compare, tail-call
 *   risk:       the (b0&1) extra mask + single shared mul must CSE; id at +0xf8 / constants 0x868,0x175e confirmed from siblings.
 *   confidence: med
 */
/* func_ov002_0222c524: player p=b0&1; if cf26c[p*0x868]==0 ret 0; if the +0xf8
 * 13-bit id of cf16c[p*0x868] != 0x175e ret 0; else tail 0220e75c(self). */
typedef unsigned short u16;

struct S0222c524 { u16 f0; u16 b0 : 1; u16 _r : 15; };
struct Slot13 { unsigned int id : 13; };

extern u16 data_ov002_022cf26c[];
extern char data_ov002_022cf16c[];
extern int func_ov002_0220e75c(void *self);

int func_ov002_0222c524(struct S0222c524 *self) {
    int p = self->b0 & 1;
    if (*(u16 *)((char *)data_ov002_022cf26c + p * 0x868) == 0)
        return 0;
    if (((struct Slot13 *)(data_ov002_022cf16c + p * 0x868 + 0xf8))->id != 0x175e)
        return 0;
    return func_ov002_0220e75c(self);
}
