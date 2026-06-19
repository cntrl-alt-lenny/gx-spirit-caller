/* func_ov010_021b3f28: tail-call wrapper with global-data arg.
 *
 *     ldr ip, .L_... ; func_ov010_021b3e98
 *     ldr r0, .L_... ; data_ov010_021b8a7c
 *     bx  ip
 */

extern int func_ov010_021b3e98(void *p);
extern char data_ov010_021b8a7c[];

int func_ov010_021b3f28(void) {
    return func_ov010_021b3e98(data_ov010_021b8a7c);
}
