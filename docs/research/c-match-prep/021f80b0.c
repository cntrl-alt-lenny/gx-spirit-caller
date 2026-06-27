/* CAMPAIGN-PREP candidate for func_021f80b0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfields for lsl;lsr; bind s=f0<<4 once; if/else-if state switch
 *   risk:       eor-pack must reuse s=(f0<<4) for both (1<<(s+f1)) and (0xffff<<s); if mwcc recomputes 16*f0, extra mov diverges. reshape-able via bound local s.
 *   confidence: med
 */
typedef unsigned short u16;
typedef unsigned int u32;

struct Entity {
    u16 unk0;
    u16 f0 : 1;
    u16 f1 : 5;
    u16 f6 : 6;
    u16 f12 : 2;
};

struct State { unsigned char pad[0x5b4]; int step; };
extern struct State data_ov002_022ce288;
extern int data_ov002_022cf178[];

extern void func_ov002_021ded30(int mask);
extern void func_ov002_021d7c40(int a, int b);

int func_ov002_021f80b0(struct Entity *e)
{
    int s;
    if (e->f6 == 0x23)
        return 1;
    if (data_ov002_022ce288.step == 0) {
        s = e->f0 << 4;
        func_ov002_021ded30((1 << (s + e->f1)) ^ (0xffff << s));
        data_ov002_022ce288.step += 1;
        return 0;
    }
    if (data_ov002_022ce288.step == 1) {
        if (data_ov002_022cf178[(e->f0 & 1) * 0x868 / 4] != 0) {
            func_ov002_021d7c40(0, 0);
            return 0;
        }
        data_ov002_022ce288.step += 1;
        return 0;
    }
    return 1;
}
