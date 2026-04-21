/* func_ov011_021c9e8c: indirect tail-call, sibling of
 * func_ov011_021c9e80 pointing at data_ov000_021b18c8 instead.
 *
 *     ldr ip, =data_ov000_021b18c8
 *     bx  ip
 */

extern char data_ov000_021b18c8[];

void func_ov011_021c9e8c(void) {
    ((void (*)(void))data_ov000_021b18c8)();
}
