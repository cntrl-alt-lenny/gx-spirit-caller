/* CAMPAIGN-PREP candidate for func_021ca678 (ov006, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Straight-line OAM build, fixed call seq + bitfield twiddle (bic/orr)
 *   risk:       local OAM struct layout (+0x8/0xc/0x10/0x14) and func signatures guessed; scheduling of the field stores may reorder
 *   confidence: med
 */
/* func_ov006_021ca678: build one OAM entry for object a0.
 * id = func_02006c0c(data_ov006_021cf094, 4, 0); fill a 0x28 local via
 * func_0201d47c(&loc); patch loc fields (handle, -1, attr byte (&~0xf)|6,
 * x<<5, y<<5); commit via func_0201e5b8(&loc); free via func_02006e1c(id).
 * Returns 1.
 */

extern int  func_02006c0c(void *a, int b, int c);
extern void func_0201d47c(void *p);
extern void func_0201e5b8(void *p);
extern void func_02006e1c(int id);
extern char data_ov006_021cf094[];

struct oam {
    int            field0;   /* +0x00: id */
    int            field4;   /* +0x04 */
    int            field8;   /* +0x08: -1 */
    int            fieldC;   /* +0x0c: x<<5 */
    short          field10;  /* +0x10: y<<5 */
    short          field12;  /* +0x12 */
    unsigned short field14;  /* +0x14: attr */
};

int func_ov006_021ca678(char *a0) {
    struct oam loc;
    int id = func_02006c0c(data_ov006_021cf094, 4, 0);
    func_0201d47c(&loc);
    loc.field8 = -1;
    loc.field14 = (loc.field14 & ~0xf) | 0x6;
    loc.field0 = id;
    loc.fieldC = *(int *)(a0 + 0x38) << 5;
    loc.field10 = (short)(*(int *)(a0 + 0x3c) << 5);
    func_0201e5b8(&loc);
    func_02006e1c(id);
    return 1;
}
