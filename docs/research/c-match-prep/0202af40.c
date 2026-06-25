/* CAMPAIGN-PREP candidate for func_0202af40 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     repeated guard+Task_InvokeLocked+clear, reload-per-use, ptr model
 *   risk:       currently ships as .s (reg-alloc-walled); reload-each-use must reproduce; matched analog func_0202c1ac suggests it will
 *   confidence: med
 */
/* func_0202af40: 9 repeated null-check Task_InvokeLocked + clear blocks
 * on (*data_0219a93c)->f_XX, offsets in source order:
 * 0x30,0x34,0x2c,0x38,0x08,0x04,0x0c,0x10,0x14. Last block uses the
 * predicated early-return (ldmeqia). Models data_0219a93c as a pointer
 * (the +0 member), matching matched sibling func_0202c1ac. */

extern void Task_InvokeLocked(void *p);

typedef struct State0219a93c {
    char  _pad_00[0x04];
    void *f_04;          /* +0x04 */
    void *f_08;          /* +0x08 */
    char  _pad_0c[0x0c - 0x0c];
    void *f_0c;          /* +0x0c */
    void *f_10;          /* +0x10 */
    void *f_14;          /* +0x14 */
    char  _pad_18[0x2c - 0x18];
    void *f_2c;          /* +0x2c */
    void *f_30;          /* +0x30 */
    void *f_34;          /* +0x34 */
    void *f_38;          /* +0x38 */
} State0219a93c;

extern State0219a93c *data_0219a93c;

void func_0202af40(void) {
    if (data_0219a93c->f_30 != 0) { Task_InvokeLocked(data_0219a93c->f_30); data_0219a93c->f_30 = 0; }
    if (data_0219a93c->f_34 != 0) { Task_InvokeLocked(data_0219a93c->f_34); data_0219a93c->f_34 = 0; }
    if (data_0219a93c->f_2c != 0) { Task_InvokeLocked(data_0219a93c->f_2c); data_0219a93c->f_2c = 0; }
    if (data_0219a93c->f_38 != 0) { Task_InvokeLocked(data_0219a93c->f_38); data_0219a93c->f_38 = 0; }
    if (data_0219a93c->f_08 != 0) { Task_InvokeLocked(data_0219a93c->f_08); data_0219a93c->f_08 = 0; }
    if (data_0219a93c->f_04 != 0) { Task_InvokeLocked(data_0219a93c->f_04); data_0219a93c->f_04 = 0; }
    if (data_0219a93c->f_0c != 0) { Task_InvokeLocked(data_0219a93c->f_0c); data_0219a93c->f_0c = 0; }
    if (data_0219a93c->f_10 != 0) { Task_InvokeLocked(data_0219a93c->f_10); data_0219a93c->f_10 = 0; }
    if (data_0219a93c->f_14 != 0) { Task_InvokeLocked(data_0219a93c->f_14); data_0219a93c->f_14 = 0; }
}
