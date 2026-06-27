/* CAMPAIGN-PREP candidate for func_022426a4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sequential-cmp switch (beq, not table); arg3 pass-through; bit0 bitfield
 *   risk:       case-2 dcc0 load-order: orig loads d74,d78,d70 then add r2,r3,r2 keeping d74 in r3; inlined loads may reorder/CSE -> reshape-able via 3 ordered temps. Shipped reg-alloc-walled .s.
 *   confidence: low
 */
/* func_ov002_022426a4: ov002 3-state step machine (state at
 * data_ov002_022ce288+0x5b8). Sequential cmp dispatch (cases 0/1/2).
 * NOTE: r3 (arg3) is saved by stmdb {r3,...} and forwarded to
 * func_0223dcc0 in case 0 (pass-through lever). */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };
extern char data_ov002_022ce288[];
extern char data_ov002_022cd3f4[];
extern int  data_ov002_022cd744[];
extern char data_ov002_022d016c[];
extern int  func_ov002_0223dcc0(void *self, int a, int b, int c);
extern int  func_ov002_0223e21c(void *self, int arg1);
extern int  func_ov002_022577dc(void);
extern int  func_ov002_0225935c(int a, int b, int c);
extern int  func_ov002_022593f4(void);
extern int  func_ov002_0228df3c(void *self, int arg1, int f0);
extern int  func_ov002_022575c8(void);

int func_ov002_022426a4(struct Ov002Self *self, int arg1, int arg2, int arg3) {
    switch (*(int *)(data_ov002_022ce288 + 0x5b8)) {
    case 0:
        func_ov002_0223dcc0(self,
                            *(int *)data_ov002_022cd3f4,
                            *(int *)(data_ov002_022cd3f4 + 0x1c),
                            arg3);
        if (data_ov002_022cd744[self->b0] == 1)
            return func_ov002_0228df3c(self, arg1, self->f0);
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    case 1:
        if (func_ov002_022577dc() == 0)
            return 1;
        func_ov002_0223e21c(self, arg1);
        func_ov002_0225935c(self->b0, self->f0, (int)func_ov002_022575c8);
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    case 2:
        if (func_ov002_022593f4() == 0) {
            *(int *)(data_ov002_022ce288 + 0x5b8) -= 1;
            return 0;
        }
        func_ov002_0223dcc0(self,
                            *(int *)(data_ov002_022d016c + 0xd70),
                            *(int *)(data_ov002_022d016c + 0xd74) +
                                *(int *)(data_ov002_022d016c + 0xd78),
                            *(int *)(data_ov002_022d016c + 0xd74));
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    }
    return 1;
}
