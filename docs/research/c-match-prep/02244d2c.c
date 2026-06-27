/* CAMPAIGN-PREP candidate for func_02244d2c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: if(state==0)/if(state==1) chain (beq/beq); (u8) byte-pack; bind c/sum; load a,b,c order; bind state once for the cmp pair
 *   risk:       reshape-able: binding state to one local matches `ldr;cmp#0;beq;cmp#1;beq`; if mwcc reloads ce288 for the 2nd cmp an extra ldr diverges. Byte-pack peephole risk if (u8) cast dropped.
 *   confidence: med
 */
/* func_ov002_02244d2c — two-state handler (state @ ce288+0x5b8). */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Self02244d2c { u16 f0; u16 b0 : 1; };

extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];
extern void func_ov002_021ae400(int a, int b);
extern int  func_ov002_021d8770(int a, int b);
extern void func_ov002_0223dad0(void *self, int packed);
extern void func_ov002_0225935c(int a, int b, int c);
extern int  func_ov002_022593f4(void);
extern int  func_ov002_02244cd8(void);

int func_ov002_02244d2c(struct Self02244d2c *self) {
    int a, b, c, sum;
    int state = *(int *)(data_ov002_022ce288 + 0x5b8);
    if (state == 0) {
        func_ov002_021ae400(self->b0, 0x145);
        func_ov002_0225935c(self->b0, self->f0, (int)&func_ov002_02244cd8);
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    }
    if (state == 1) {
        if (func_ov002_022593f4() == 0) {
            *(int *)(data_ov002_022ce288 + 0x5b8) -= 1;
            return 0;
        }
        a   = *(int *)(data_ov002_022d016c + 0xd74);
        b   = *(int *)(data_ov002_022d016c + 0xd78);
        c   = *(int *)(data_ov002_022d016c + 0xd70);
        sum = a + b;
        func_ov002_021d8770(c, sum);
        func_ov002_0223dad0(self, (u16)((u8)c | ((u8)sum << 8)));
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    }
    return 1;
}
