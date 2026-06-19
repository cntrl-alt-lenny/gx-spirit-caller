/* func_ov011_021cf134: configure entry idx (stride 0x14) of the actor table,
 * then set its second parameter.
 *
 *     stmdb sp!, {r4, r5, r6, lr}
 *     mov   r2, #0x14
 *     mul   r4, r0, r2
 *     ldr   r5, =data_ov011_021d40c0
 *     mov   r6, r1
 *     add   r0, r5, r4 ; bl func_ov000_021ac458
 *     mov   r1, r6 ; add r0, r5, r4 ; bl func_ov000_021ac480
 *     ldmia sp!, {r4, r5, r6, pc}
 */

extern char data_ov011_021d40c0[];
extern void func_ov000_021ac458(void *entry);
extern void func_ov000_021ac480(void *entry, int v);

void func_ov011_021cf134(int idx, int v) {
    func_ov000_021ac458(data_ov011_021d40c0 + idx * 0x14);
    func_ov000_021ac480(data_ov011_021d40c0 + idx * 0x14, v);
}
