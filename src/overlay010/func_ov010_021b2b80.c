/* CAMPAIGN-PREP candidate for func_021b2b80 (ov010, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Dense switch returning tail-calls -> pc-rel jump table
 *   risk:       mwcc may emit tail-`b` vs orig `bl;pop`; jump-table body order must follow source case order 0..7
 *   confidence: high
 */
/* func_ov010_021b2b80: dense 0..7 dispatcher. cmp r0,#7; addls pc,pc,r0,lsl#2
 * indexes 8 tail-calls (idx -> func), default returns 0. Each arm is
 *   bl func_N ; ldmia sp!,{r3,pc}  == `return func_N();`. The r3 save is the
 * 8-byte call-alignment push; the return value flows through r0.
 *
 *   stmdb sp!, {r3, lr}
 *   cmp   r0, #7
 *   addls pc, pc, r0, lsl #2
 *   b .L_2cc            ; default -> 0
 *   b .L_28c .L_294 .L_29c .L_2a4 .L_2ac .L_2b4 .L_2bc .L_2c4   ; idx 0..7
 */
extern int func_0208df94(void);
extern int func_0208e014(void);
extern int func_0208e0a0(void);
extern int func_0208e120(void);
extern int func_0208e1ac(void);
extern int func_0208e1cc(void);
extern int func_0208e200(void);
extern int func_0208e220(void);

int func_ov010_021b2b80(int x) {
    switch (x) {
    case 0: return func_0208e220();
    case 1: return func_0208e1cc();
    case 2: return func_0208e120();
    case 3: return func_0208e014();
    case 4: return func_0208e200();
    case 5: return func_0208e1ac();
    case 6: return func_0208e0a0();
    case 7: return func_0208df94();
    default: return 0;
    }
}
