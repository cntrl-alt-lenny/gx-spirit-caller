/* CAMPAIGN-PREP candidate for func_0222ce30 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield held for (&1)*0x868 index + (1-b0) arg, :13 compare
 *   risk:       b0 must stay live (one ldrh, ip reused for 1-b0); 0226af38 arity/(1,3) and 0x169f confirmed; returns 0 not call result.
 *   confidence: med
 */
/* func_ov002_0222ce30: b0=self->b0; if cf26c[(b0&1)*0x868]==0 ret 0; if cf16c
 * +0xf8 13-bit id != 0x169f ret 0; else 0226af38(1-b0,1,3); return 0. */
typedef unsigned short u16;

struct S0222ce30 { u16 f0; u16 b0 : 1; u16 _r : 15; };
struct Slot13 { unsigned int id : 13; };

extern u16 data_ov002_022cf26c[];
extern char data_ov002_022cf16c[];
extern void func_ov002_0226af38(int a, int b, int c);

int func_ov002_0222ce30(struct S0222ce30 *self) {
    int b0 = self->b0;
    if (*(u16 *)((char *)data_ov002_022cf26c + (b0 & 1) * 0x868) == 0)
        return 0;
    if (((struct Slot13 *)(data_ov002_022cf16c + (b0 & 1) * 0x868 + 0xf8))->id != 0x169f)
        return 0;
    func_ov002_0226af38(1 - b0, 1, 3);
    return 0;
}
