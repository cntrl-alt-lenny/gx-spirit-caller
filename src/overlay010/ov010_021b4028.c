/* func_ov010_021b4028: tail-call wrapper with global-data arg.
 *
 *     ldr ip, .L_... ; func_ov010_021b3f98
 *     ldr r0, .L_... ; data_ov010_021b8b7c
 *     bx  ip
 */

extern int func_ov010_021b3f98(void *p);
extern char data_ov010_021b8b7c[];

int func_ov010_021b4028(void) {
    return func_ov010_021b3f98(data_ov010_021b8b7c);
}
