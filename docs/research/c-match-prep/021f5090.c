/* CAMPAIGN-PREP candidate for func_021f5090 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: switch(state) for dispatch; pl=parity^b14 (order tuned for bit14-first shift); f4_6 :9 bitfield; store-order kept
 *   risk:       register-alloc coin-flip: orig parks pl in ip and does `mov r0,ip` before df780; mwcc keeps pl in r0 (1 insn shorter in state1), cascading the eor/lsr dest regs in the head. Everything else byte-matches. permuter-class.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021f5090 (ov002, class D) — MED tier.
 * BUILD-CHECKED (mwcc 2.0/sp1p5 -O4,p -interworking): switch dispatch shape, both
 * case bodies, the cf16c/cd744/d016c accesses, the f4_6 :9 field, and store-order
 * all match the delinked .o. The `pl = self->parity ^ self->b14` order was tuned
 * to reproduce the bit14-first shift pair. RESIDUE: orig parks pl in ip (r12) and
 * does `mov r0,ip` before df780; mwcc here keeps pl in r0 (1-insn shorter in
 * state1) — a register-allocation coin-flip. Bitfields: bit14, parity :1, f4
 * bits6..14 :9; per-player 0x868 stride. */
typedef unsigned short u16;

struct Ov002Self {
    u16 f0;
    u16 parity : 1;     /* +2 bit0  */
    u16 _b1    : 13;    /* +2 bits1..13 */
    u16 b14    : 1;     /* +2 bit14 */
    u16 _b15   : 1;     /* +2 bit15 */
    u16 _f4a   : 6;     /* +4 bits0..5  */
    u16 f4_6   : 9;     /* +4 bits6..14 (the field passed to 021ae4bc) */
    u16 _f4b   : 1;     /* +4 bit15 */
    char _pad6[6];
    u16 fC;             /* +0xc */
};
struct Ov002G  { char _pad[0x5b4]; int state; };

extern struct Ov002G data_ov002_022ce288;
extern char data_ov002_022cf16c[];           /* per-player 0x868 stride, int @ off 0 */
extern int  data_ov002_022cd744[];           /* int array indexed by player parity */
extern char data_ov002_022d016c[];           /* G2; +0xd44 holds a handle */
extern int  func_ov002_0227ddf8(void);
extern int  func_ov002_021ae4bc(int a, int field);
extern int  func_ov002_021df780(int pl, int v);

int func_ov002_021f5090(struct Ov002Self *self) {
    int pl = self->parity ^ self->b14;
    switch (data_ov002_022ce288.state) {
    case 0:
        if (*(int *)(data_ov002_022cf16c + (pl & 1) * 0x868) <= 0x7d0)
            return 1;
        if (data_ov002_022cd744[pl] == 1)
            *(int *)(data_ov002_022d016c + 0xd44) = func_ov002_0227ddf8();
        else
            func_ov002_021ae4bc(0xfa, self->f4_6);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        if (*(int *)(data_ov002_022d016c + 0xd44) != 0)
            func_ov002_021df780(pl, 0x7d0);
        self->fC = (u16)*(int *)(data_ov002_022d016c + 0xd44);
        return 1;
    default:
        return 1;
    }
}
