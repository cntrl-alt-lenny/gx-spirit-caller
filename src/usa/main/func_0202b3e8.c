/* func_0202b3e8: thunk — tail-call `func_0202df24(0xfa7, arg)`.
 *
 *     ldr  ip, .L_0202b44c              ; ip = &func_0202df24
 *     mov  r1, r0                        ; r1 = r0 (arg shift)
 *     ldr  r0, .L_0202b450                ; r0 = 0xfa7 (const id)
 *     bx   ip
 * .L_0202b44c: .word func_0202df24
 * .L_0202b450: .word 0xfa7
 *
 * 4 insns + 2 pool words = 0x18 bytes.
 *
 * Sibling of `func_0202b400` (0xfc9), `func_0202b418` (0xfe4),
 * `func_0202b430` (0x10f4), `func_0202b448` (0x12e5) — same thunk
 * shape, different id constants.
 *
 * The indirect tail call via `ldr ip, =sym; bx ip` is peculiar —
 * direct `b func_0202df24` would also reach (11KB delta). mwcc at
 * -O4 may emit this form for tail-calls where the callee is in a
 * different source object but same section. Testing to see whether
 * C produces the expected shape.
 */

extern int func_0202df24(int id, int arg);

int func_0202b3e8(int arg) {
    return func_0202df24(0xfa7, arg);
}
