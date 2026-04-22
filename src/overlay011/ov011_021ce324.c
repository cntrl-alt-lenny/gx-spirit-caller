/* func_ov011_021ce324: zero r1 and tail-call func_ov011_021ce334.
 *
 *     ldr ip, =func_ov011_021ce334
 *     mov r1, #0x0
 *     bx  ip
 *
 * Routed through a function pointer so mwld emits the `ldr ip / bx ip`
 * trampoline instead of a direct `b func_ov011_021ce334` (the latter
 * would be ~8 bytes shorter — wrong shape for the 0x10-byte slot).
 *
 * Signature kept loose per brief 008 — the deep callee
 * (`func_ov011_021ce190`) is unmatched, so we don't reverse the arg
 * count. Three ints covers r0/r1/r2 pass-through.
 */

extern void func_ov011_021ce334(int r0, int r1, int r2);

void func_ov011_021ce324(int r0, int r1, int r2) {
    void (*fn)(int, int, int) = func_ov011_021ce334;
    fn(r0, 0, r2);
}
