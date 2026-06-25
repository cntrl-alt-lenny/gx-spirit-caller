/* CAMPAIGN-PREP candidate for func_0202ce24 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bind-once guard chain + two tail calls
 *   risk:       func_02037208 arg1=-1 may materialize via mov/mvn not sub-from-0x35; reload-vs-bind of global may differ
 *   confidence: med
 */
/* func_0202ce24: NULL/flag guard chain over a held global pointer,
 * then two calls. The global at data_0219ad48 is loaded once and its
 * base kept in a register across all four field reads (bind-once),
 * so bind it to one local. Early-return when any guard fails.
 *
 *     ldr r0,_LIT0; ldr r1,[r0]; cmp r1,#0
 *     ldrne r1,[r0,#0x24]; cmpne r1,#0
 *     ldrne r1,[r0,#0x18]; cmpne r1,#0
 *     ldmeqia ... (return if any zero)
 *     ldr r0,[r0,#0x14]; cmp r0,#0; ldmneia ... (return if nonzero)
 *     mov r0,#1; bl func_0202d194
 *     mov r0,#0x35; sub r1,r0,#0x36; mov r2,#0; mov r3,#1
 *     bl func_02037208
 */

typedef struct {
    int  active;        /* +0x00 */
    char _pad_04[0x10];
    int  field_14;      /* +0x14 */
    int  field_18;      /* +0x18 */
    char _pad_1c[0x08];
    int  field_24;      /* +0x24 */
} S_0202ce24;

extern S_0202ce24 data_0219ad48;
extern void func_0202d194(int a);
extern void func_02037208(int a, int b, int c, int d);

void func_0202ce24(void) {
    S_0202ce24 *p = &data_0219ad48;

    if (p->active == 0) return;
    if (p->field_24 == 0) return;
    if (p->field_18 == 0) return;
    if (p->field_14 != 0) return;

    func_0202d194(1);
    func_02037208(0x35, -1, 0, 1);
}
