/* func_ov011_021c9dac: indirect tail-call, sibling of
 * func_ov011_021c9da0 pointing at data_ov000_021b17dc instead.
 *
 *     ldr ip, =data_ov000_021b17dc
 *     bx  ip
 */

extern char data_ov000_021b17dc[];

void func_ov011_021c9dac(void) {
    ((void (*)(void))data_ov000_021b17dc)();
}
