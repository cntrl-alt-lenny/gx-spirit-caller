/* CAMPAIGN-PREP candidate for func_022432b4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     nested guard(cmp 1/2/3)+jump-table; u16 byte-split; nested-call result as 3rd arg; buf[0x100]
 *   risk:       deep body in case2 (4 sequential calls + byte-split + nested func_0202b100() as 3rd arg) is the reg-alloc/scheduling wall: self in r4 across all calls, arg eval order around r2; permuter-class. f12@0xc struct-guessed. Shipped .s.
 *   confidence: low
 */
/* func_ov002_022432b4: ov002 nested dispatch. Outer guard on self->f12
 * (u16 +0xc): f12 in {1,3} -> 4-entry state machine (state at
 * data_ov002_022ce288+0x5b8); f12==2 -> tail func_0223f684; else ret 1.
 * 0x100 stack scratch buffer; arg1 forwarded to func_0223f684. */
typedef unsigned char  u8;
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; u16 :15; u8 pad[8]; u16 f12; };
extern char data_ov002_022ce288[];
extern int  data_ov002_022cd744[];
extern char data_ov002_022d016c[];
extern int  func_0202b100(void);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021b9ecc(int a, int b);
extern int  func_ov002_0223dcc0(void *self, int a, int b, int c);
extern u16  func_ov002_0223de94(void *node, int idx);
extern int  func_ov002_0223f684(void *self, int arg1);
extern int  func_ov002_0225935c(int a, int b, int c);
extern int  func_ov002_022593f4(void);
extern int  func_ov002_0228df3c(void *self, int arg1, int f0);
extern int  func_ov002_0229ce5c(void *buf, int a, int b);
extern int  func_ov002_022575c8(void);

int func_ov002_022432b4(struct Ov002Self *self, int arg1) {
    char buf[0x100];
    int v;

    if (self->f12 != 1) {
        if (self->f12 == 2)
            return func_ov002_0223f684(self, arg1);
        if (self->f12 != 3)
            return 1;
    }

    switch (*(int *)(data_ov002_022ce288 + 0x5b8)) {
    case 0:
    case 1:
        self->f12 = 1;
        if (func_ov002_0223f684(self, arg1) != 0)
            *(int *)(data_ov002_022ce288 + 0x5b8) = 2;
        return 0;
    case 2:
        self->f12 = 3;
        if (data_ov002_022cd744[self->b0] == 1)
            return func_ov002_0228df3c(self, arg1, self->f0);
        v = func_ov002_0223de94(self, 0);
        func_ov002_021b9ecc(v & 0xff, ((u16)v >> 8) & 0xff);
        func_ov002_0229ce5c(buf, 0x45, func_0202b100());
        func_ov002_021ae400(self->b0, (int)buf);
        func_ov002_0225935c(self->b0, self->f0, (int)func_ov002_022575c8);
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    case 3:
        if (func_ov002_022593f4() == 0) {
            *(int *)(data_ov002_022ce288 + 0x5b8) -= 1;
            return 0;
        }
        func_ov002_0223dcc0(self,
                            *(int *)(data_ov002_022d016c + 0xd70),
                            *(int *)(data_ov002_022d016c + 0xd74) +
                                *(int *)(data_ov002_022d016c + 0xd78),
                            *(int *)(data_ov002_022d016c + 0xd74));
        return 1;
    }
    return 1;
}
