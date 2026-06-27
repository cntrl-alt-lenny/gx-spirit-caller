/* CAMPAIGN-PREP candidate for func_02242abc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     jump-table switch; && short-circuit guards; conditional state+=2 fall-through chain
 *   risk:       conditional-state+=2 then fall-into-next-case (.L_268->.L_278) is a rare layout the && form may not reproduce (the last &&'s branch-target diverges, brief354/358 inline-vs-branch); permuter-class. f12@0xc struct-guessed. Shipped .s.
 *   confidence: low
 */
/* func_ov002_02242abc: ov002 5-entry step machine (state at
 * data_ov002_022ce288+0x5b8) guarded by self->f12 (u16 at +0xc).
 * Fall-through chain: case0 fail -> state+=2 -> case2 body -> fail ->
 * state+=2 -> case4 (return 1). cases 1/3 share .L_304. */
typedef unsigned char  u8;
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; u16 :15; u8 pad[8]; u16 f12; };
extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];
extern int  func_ov002_021ca698(int a, int b);
extern void func_ov002_0223de04(void *self, int a, int b, int c);
extern int  func_ov002_022536e8(int a, int b, int c);
extern int  func_ov002_0226b194(int a, int b, int c);

int func_ov002_02242abc(struct Ov002Self *self) {
    u16 hv;

    if (self->f12 == 0)
        return 1;

    switch (*(int *)(data_ov002_022ce288 + 0x5b8)) {
    case 0:
        if (func_ov002_021ca698(self->b0, 1 - self->b0) != 0 &&
            func_ov002_022536e8(self->b0, self->f0, 0) != 0) {
            func_ov002_0226b194(self->b0, self->f0, 0);
            *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
            return 0;
        }
        *(int *)(data_ov002_022ce288 + 0x5b8) += 2;
        /* fallthrough */
    case 2:
        if (func_ov002_021ca698(self->b0, self->b0) != 0 &&
            func_ov002_022536e8(1 - self->b0, self->f0, 0) != 0) {
            func_ov002_0226b194(1 - self->b0, self->f0, 0);
            *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
            return 0;
        }
        *(int *)(data_ov002_022ce288 + 0x5b8) += 2;
        /* fallthrough */
    case 4:
        return 1;
    case 1:
    case 3:
        hv = *(u16 *)(data_ov002_022d0e6c + 0xb2);
        func_ov002_0223de04(self, hv & 1, 0xe, hv);
        *(int *)(data_ov002_022ce288 + 0x5b8) += 1;
        return 0;
    }
    return 0;
}
