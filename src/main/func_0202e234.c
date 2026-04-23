/* func_0202e234: first non-trivial hard-tier match — two-condition
 * guard with a delegated call. Real control flow, not a forwarder.
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_*.s):
 *
 *     stmdb sp!, {r3, lr}
 *     cmp   r0, #0x0
 *     beq   .L_0202e250             ; x == 0 → return 0
 *     bl    func_0202b890            ; else r0 = func_0202b890(x)
 *     cmp   r0, #0x8
 *     movlt r0, #0x1                 ; if result < 8, r0 = 1
 *     ldmltia sp!, {r3, pc}          ; and return
 *   .L_0202e250:
 *     mov   r0, #0x0
 *     ldmia sp!, {r3, pc}
 *
 * 9 ARM instructions, 0x24 bytes.
 *
 * The conditional-execution predicate `movlt / ldmltia` encodes the
 * second return point: if the LT flag is set after the cmp, both the
 * register assignment and the return happen atomically. The fall-
 * through (GE case) joins the x==0 path at .L_0202e250 to return 0.
 *
 * Semantics: gate on (x != 0) AND (delegated_check < 8). Looks like
 * an "in-range active X" predicate — x is an index/handle, and
 * func_0202b890 probably normalizes it or reads a count field.
 *
 * Codegen iteration: the natural `if (x == 0) return 0;` C form
 * compiled `moveq r0, #0; ldmeqia` (conditional-exec fold) instead
 * of baserom's explicit `beq` + trailing `mov r0, #0; ldmia` at a
 * shared zero-return label. Switching the zero-path to a `goto` with
 * the label at function-tail forced mwcc to emit the branch-and-
 * fallthrough shape that matches baserom bytes.
 */

extern int func_0202b890(int x);

int func_0202e234(int x) {
    if (x == 0) goto zero;
    if (func_0202b890(x) < 8) return 1;
zero:
    return 0;
}
