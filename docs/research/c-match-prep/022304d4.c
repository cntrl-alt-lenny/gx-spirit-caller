/* CAMPAIGN-PREP candidate for func_022304d4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     two bitfield insert-RMWs (b1=1;b2=b1;b3=b2) each its own ldrh;strh; k via (u16)r4>>8 asr; if-chain k<=0xa/==0xb/==0xd; arg0->player bitfield folds into cmp
 *   risk:       the two consecutive bitfield-insert RMWs into e->[.4] (orig does ldrh;bic;orr;strh TWICE, re-loading between) are the wall: mwcc -O4 likely coalesces them or reorders the bic/orr; also keeping r4(ret) live across 4 branches + arg0.bit0 cmp-fold -> store-order + reg-alloc, permuter-class; struct e offsets struct-guessed
 *   confidence: low
 */
typedef unsigned short u16;
typedef unsigned int   u32;
struct cd3f4 { char _a[4]; int f4; char _b[0x18]; int f20; };
struct e_t {
    u16 f0;
    u16 player : 1;   /* [.2] bit0 */
    u16 idx : 5;      /* [.2] bits[5:1] */
    u16 b1 : 1;       /* [.4] bit1 */
    u16 b2 : 1;       /* [.4] bit2 */
    u16 b3 : 1;       /* [.4] bit3 */
    u16 : 2;
    u16 f6 : 9;       /* [.4] bits[14:6] */
};
extern struct cd3f4 data_ov002_022cd3f4;
extern char data_ov002_022cf16c[];
extern int  func_ov002_021b947c(int a);
extern int  func_ov002_021d8904(int player, int idx, int f6);
extern int  func_ov002_021de4b0(int self, int player, int idx);
extern void func_ov002_021dee94(int self, int flag);
extern void func_ov002_021e2550(int player, int a, void *p, int flag);
extern void func_ov002_021e2570(int a, int b, int flag);
extern int  func_ov002_021e286c(int a);
int func_ov002_022304d4(struct e_t *arg0, struct e_t *e) {
    int r4, k, flag, lo;
    char *base;
    if (e == 0) return 0;
    e->b1 = 1;
    e->b2 = e->b1;
    e->b3 = e->b2;
    r4 = func_ov002_021b947c(e->f6);
    func_ov002_021d8904(e->player, e->idx, e->f6);
    k = ((u16)r4 >> 8) & 0xff;
    if (k <= 0xa) {
        if ((u16)(r4 >> 16) == 0) {
            func_ov002_021de4b0((int)arg0, e->player, e->idx);
        } else {
            flag = (data_ov002_022cd3f4.f4 == e->player &&
                    data_ov002_022cd3f4.f20 == e->idx) ? 1 : 0;
            func_ov002_021dee94((int)arg0, flag);
        }
    } else if (k == 0xb) {
        base = data_ov002_022cf16c + (e->player & 1) * 0x868;
        flag = (e->player != arg0->player) ? 1 : 0;
        func_ov002_021e2550(e->player, (u16)(r4 >> 16),
                            base + 0x120 + (u16)(r4 >> 16) * 4, flag);
    } else if (k == 0xd) {
        lo = r4 & 0xff;
        flag = (lo != arg0->player) ? 1 : 0;
        func_ov002_021e2570(lo, (u16)(r4 >> 16), flag);
        func_ov002_021e286c(lo);
    }
    return 0;
}
