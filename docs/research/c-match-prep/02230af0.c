/* CAMPAIGN-PREP candidate for func_02230af0 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     plain /10,%-style col=i-(i/10)*5; bind g base; bit-test 1<<n; if-assign state
 *   risk:       divmod reconstruction: orig emits two i/10 magic muls + col=i-(i/10)*5. If C reshapes to i%10 the magic/operand sequence diverges. permuter-class (divmod shape).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_02230af0 (ov002, class D) - brief 494.
 * UNVERIFIED build-free draft. Divide-by-10 magic (0x66666667) on a 0..9 loop
 * counter g->c5b0; bit index = (i - (i/10)*5) + ((i/10 ^ (h->f2 & 1)) << 4);
 * tst c5ac, 1 << bit. State machine on c5a8 (0x7f init / 0x80 spawn).
 */
typedef unsigned short u16;

extern char data_ov002_022ce288[];
extern void func_ov002_021d5a08(int a, int b, int c, u16 d);
extern int  func_ov002_021e2b3c(void);
extern int  func_ov002_021e2c5c(void);
extern int  func_ov002_02257704(void);
extern void func_ov002_0226b11c(int a, int b);

int func_ov002_02230af0(void) {
    char *g = data_ov002_022ce288;
    int state;
    int *node;

    state = *(int *)(g + 0x5a8);
    if (state == 0x7f) {
        int i;
        if (*(int *)(g + 0x5b0) >= 0xa) {
            func_ov002_021e2c5c();
            return 0;
        }
        for (i = *(int *)(g + 0x5b0); i < 0xa; i = *(int *)(g + 0x5b0)) {
            int q = i / 10;
            int col = i - q * 5;
            int row = q ^ (((u16 *)((char *)node + 0))[1] & 1);
            int bit = col + (row << 4);
            if (*(int *)(g + 0x5ac) & (1 << bit)) {
                func_ov002_021d5a08(*(u16 *)node, row, col, (u16)5);
                func_ov002_0226b11c(row, col);
                *(int *)(data_ov002_022ce288 + 0x5b0) =
                    *(int *)(data_ov002_022ce288 + 0x5b0) + 1;
                return 0x7f;
            }
            *(int *)(g + 0x5b0) = *(int *)(g + 0x5b0) + 1;
        }
        func_ov002_021e2c5c();
        return 0;
    }
    if (state != 0x80)
        return 0;
    node = (int *)func_ov002_02257704();
    *(int *)(g + 0x5ac) = (int)node;
    if (node == 0)
        return 0;
    func_ov002_021e2b3c();
    *(int *)(g + 0x5b0) = 0;
    return 0x7f;
}
