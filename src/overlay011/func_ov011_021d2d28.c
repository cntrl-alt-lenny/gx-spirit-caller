/* func_ov011_021d2d28: thunk — `data_ov000_021b4e38(p + 8, p)`.
 *
 *     ldr ip, =data_ov000_021b4e38     ; treated as fn ptr
 *     mov r1, r0
 *     add r0, r1, #0x8
 *     bx  ip
 *
 * 4 insns + 1 pool = 0x14 bytes.
 */

extern void data_ov000_021b4e38(void *p_plus_8, void *p);

void func_ov011_021d2d28(void *p) {
    data_ov000_021b4e38((char *)p + 8, p);
}
