/* func_ov000_021aadd8: intra-overlay trampoline to func_ov000_021aadc0.
 *
 *     ldr ip, =func_ov000_021aadc0
 *     bx  ip
 *
 * This is the `ldr ip; bx ip` shape the linker produces when mwcc
 * can't emit a direct `b target` (usually: target in a separate TU
 * that may be ARM or Thumb). Writing as an indirect-call tail so
 * mwcc produces the same trampoline bytes.
 */

extern void func_ov000_021aadc0(void);

void func_ov000_021aadd8(void) {
    func_ov000_021aadc0();
}
