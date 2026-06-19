/* func_ov011_021cdae8: reset three per-actor sub-states (id, 0).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     mov   r1, #0x0 ; bl func_ov011_021d10dc
 *     mov   r0, r4 ; mov r1, #0x0 ; bl func_ov011_021d116c
 *     mov   r0, r4 ; mov r1, #0x0 ; bl func_ov011_021d0f94
 *     ldmia sp!, {r4, pc}
 */

extern void func_ov011_021d10dc(int id, int v);
extern void func_ov011_021d116c(int id, int v);
extern void func_ov011_021d0f94(int id, int v);

void func_ov011_021cdae8(int id) {
    func_ov011_021d10dc(id, 0);
    func_ov011_021d116c(id, 0);
    func_ov011_021d0f94(id, 0);
}
