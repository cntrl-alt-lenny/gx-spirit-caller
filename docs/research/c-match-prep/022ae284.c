/* CAMPAIGN-PREP candidate for func_022ae284 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Dense switch on call return -> pc-relative jump table
 *   risk:       Default-vs-explicit case 0/1/2/10 collapse: mwcc must still size table to 0..10; jump-table entry order should match source case order.
 *   confidence: high
 */
/* func_ov002_022ae284: save arg in r4, call func_ov002_0225929c, switch
 * on its return (dense 0..10 -> mwcc emits the pc-relative jump table).
 * idx 3,4 -> return the saved arg (r4); idx 5..9 -> return 1; everything
 * else (0,1,2,10,default) -> return 0.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_ov002_0225929c
 *     cmp   r0, #0xa
 *     addls pc, pc, r0, lsl #0x2
 *     b .L_229c   (default -> 0)
 *     [0]->229c [1]->229c [2]->229c [3]->228c [4]->228c
 *     [5]->2294 [6]->2294 [7]->2294 [8]->2294 [9]->2294 [10]->229c
 *  .L_228c: mov r0,r4 ; pop {r4,pc}
 *  .L_2294: mov r0,#1 ; pop {r4,pc}
 *  .L_229c: mov r0,#0 ; pop {r4,pc}
 */

extern int func_ov002_0225929c(int arg);

int func_ov002_022ae284(int arg) {
    switch (func_ov002_0225929c(arg)) {
    case 3:
    case 4:
        return arg;
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
        return 1;
    default:
        return 0;
    }
}
