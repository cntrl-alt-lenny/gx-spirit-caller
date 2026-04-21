/* func_ov000_021aaeb8: intra-overlay trampoline to func_ov000_021aaea0.
 *
 *     ldr ip, =func_ov000_021aaea0
 *     bx  ip
 *
 * This is the `ldr ip; bx ip` shape the linker produces when mwcc
 * can't emit a direct `b target` (usually: target in a separate TU
 * that may be ARM or Thumb). Writing as an indirect-call tail so
 * mwcc produces the same trampoline bytes.
 */

extern void func_ov000_021aaea0(void);

void func_ov000_021aaeb8(void) {
    func_ov000_021aaea0();
}
