/* CAMPAIGN-PREP candidate for func_0223ad60 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: state==0x80 gate else tail-call 022112f8; magic table v; tst#1 / lsr#1 tst#1 guards; store to +0x5ac; p?0x8000:0 select
 *   risk:       reshape-able + struct-guessed: the two ldmne/ldmeq guards (tst d0,#1 ; mov lsr#1 ; tst#1) must keep that exact bit-test order; if C reorders the two returns flip. Tail-call to 022112f8 from two sites (early-out vs .L_e4). w1c index field uncertain.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cd3f4[];
extern u8 data_ov002_022ce288[];
extern u8 data_ov002_022cf1a4[];
extern u8 data_ov002_022d016c[];
extern int func_ov002_021c1e44(void);
extern int func_ov002_021d479c(int a, int b, int c, int d);
extern int func_ov002_022112f8(int a, int b);

int func_ov002_0223ad60(int *self, int arg) {
    if (*(int*)(data_ov002_022ce288 + 0x5a8) != 0x80)
        return func_ov002_022112f8((int)self, arg);
    {
        int w0 = *(int*)(data_ov002_022cd3f4);
        int w1c = *(int*)(data_ov002_022cd3f4 + 0x1c);
        int parity = w0 & 1;
        int v = *(u16*)(data_ov002_022cf1a4 + parity * 0x868 + w1c * 0x14);
        if (v != 0) {
            if (func_ov002_021c1e44() == 0) {
                if (*(int*)(data_ov002_022ce288 + 0x5ac) != 0)
                    return func_ov002_022112f8((int)self, arg);
                {
                    int d0 = *(int*)(data_ov002_022d016c + 0xd0);
                    if (d0 & 1) return 0;
                    if (((d0 >> 1) & 1) == 0) return 0;
                    {
                        int p = (*(int*)(data_ov002_022cd3f4) != 0) ? 0x8000 : 0;
                        int a0 = (u16)((p | 0x20));
                        int a1 = (u16)(*(int*)(data_ov002_022cd3f4 + 0x1c));
                        func_ov002_021d479c(a0, a1, 0, 0);
                        *(int*)(data_ov002_022ce288 + 0x5ac) = 1;
                        return 0x80;
                    }
                }
            }
        }
        return 0;
    }
}
