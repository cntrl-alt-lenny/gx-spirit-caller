/* CAMPAIGN-PREP candidate for func_020882fc (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     (1<<field) call + signed :1 guard (return-if-set) + 2 calls + orr-set-bit
 *   risk:       bitfield bit1 signed layout & sub-struct offsets guessed; ne-guard branch sense
 *   confidence: med
 */
/* func_020882fc: enable path. Call func_020950a0 with 1<<field40;
 * if signed bit-1 of field_24 is already set, return; else run the
 * two sub-callbacks at +0x08/+0x14 and set bit 1 of field_24.
 */

typedef struct St82fc {
    char _pad_00[0x08];
    char _grp08[0x14 - 0x08];/* +0x08 */
    char _grp14[0x24 - 0x14];/* +0x14 */
    signed int _b0 : 1;
    signed int flag1 : 1;    /* bit 1 of field_24 */
    signed int _rest : 30;
    char _pad_28[0x40 - 0x28];
    int field_40;            /* +0x40 */
    int field_44;            /* +0x44 */
} St82fc;

extern void func_020950a0(int a, int b, int c, int d);
extern void func_0209a824(void *p);
extern void func_0209a83c(void *p);

void func_020882fc(St82fc *p) {
    func_020950a0(p->field_44, 0, 1 << p->field_40, 0);
    if (p->flag1) return;
    func_0209a83c(&p->_grp08);
    func_0209a824(&p->_grp14);
    p->flag1 = 1;
}
