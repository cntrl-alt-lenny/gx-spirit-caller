/* func_ov010_021b4014: tail-call wrapper with global-data arg.
 *
 *     ldr ip, .L_... ; func_ov010_021b3f98
 *     ldr r0, .L_... ; data_ov010_021b8b98
 *     bx  ip
 */

extern int func_ov010_021b3f98(void *p);
extern char data_ov010_021b8b98[];

int func_ov010_021b4014(void) {
    return func_ov010_021b3f98(data_ov010_021b8b98);
}
