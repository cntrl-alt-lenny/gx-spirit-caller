/* func_ov011_021cdbac: reset three per-actor sub-states (id, 0).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     mov   r1, #0x0 ; bl func_ov011_021d11a0
 *     mov   r0, r4 ; mov r1, #0x0 ; bl func_ov011_021d1230
 *     mov   r0, r4 ; mov r1, #0x0 ; bl func_ov011_021d1058
 *     ldmia sp!, {r4, pc}
 */

extern void func_ov011_021d11a0(int id, int v);
extern void func_ov011_021d1230(int id, int v);
extern void func_ov011_021d1058(int id, int v);

void func_ov011_021cdbac(int id) {
    func_ov011_021d11a0(id, 0);
    func_ov011_021d1230(id, 0);
    func_ov011_021d1058(id, 0);
}
