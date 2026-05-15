/* func_0203dd98: dense-switch (jump-table) returning one of 4 sequential
 * negative constants, default 0.
 *
 *     cmp   r0, #0x3
 *     addls pc, pc, r0, lsl #0x2     ; jump-table dispatch
 *     b     .L_default
 *     b     .L_case0
 *     b     .L_case1
 *     b     .L_case2
 *     b     .L_case3
 * .L_case0: mvn r0, #0x8 ; bx lr   ; return -9 — wait, target says ~9 = -10
 *
 * Actually the dispatch hops via the `b` table:
 *   case 0 → mvn r0, #0x9 → return -10
 *   case 1 → mvn r0, #0x8 → return -9
 *   case 2 → mvn r0, #0x7 → return -8
 *   case 3 → mvn r0, #0x6 → return -7
 *   default → mov r0, #0  → return 0
 *
 * 17 insns = 0x44 bytes. The case-body bodies are deliberately ordered to
 * preserve the `mvn` constant sequence 9..6 (= return values -10..-7) but
 * the dispatch table reads them in case-index order via PC-relative `b`s.
 * mwcc emits this layout for `switch` with dense small case values.
 */

int func_0203dd98(int n) {
    switch (n) {
        case 1: return -9;
        case 0: return -10;
        case 2: return -8;
        case 3: return -7;
        default: return 0;
    }
}
