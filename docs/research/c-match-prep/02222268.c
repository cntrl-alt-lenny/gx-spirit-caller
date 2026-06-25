/* CAMPAIGN-PREP candidate for func_02222268 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     global 0x7f/0x80 dispatch; bitfield bit0; counter decrement
 *   risk:       ce288 base must reload each access (3x); branch order 0x7f-first preserved
 *   confidence: med
 */
/* func_ov002_02222268: if ce288+0x5a8==0x80 set ce288+0x5ac=self->f14 (0x7f falls
 * through, else return 0); then if ce288+0x5ac==0 return 0; call 021e104c(bit0 of
 * self->f2, 1); decrement ce288+0x5ac; return 0x7f. */
typedef unsigned short u16;
extern char data_ov002_022ce288[];
extern void func_ov002_021e104c(int a, int b);

struct Self22268 { u16 _0; u16 b0:1; u16 :15; char _pad[16]; int f14; };

int func_ov002_02222268(struct Self22268 *self) {
    int s = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (s != 0x7f) {
        if (s != 0x80) return 0;
        *(int *)(data_ov002_022ce288 + 0x5ac) = self->f14;
    }
    if (*(int *)(data_ov002_022ce288 + 0x5ac) == 0) return 0;
    func_ov002_021e104c(self->b0, 1);
    (*(int *)(data_ov002_022ce288 + 0x5ac))--;
    return 0x7f;
}
