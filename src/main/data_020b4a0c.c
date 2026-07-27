/* data_020b4a0c -- 8-entry ascending threshold table (32 bytes).
 *
 * Sole consumer func_02011a94.s: copies the whole 32-byte blob to a
 * stack buffer, then scans it with a runtime loop counter
 * (`ldr r1,[ip,r0,lsl #2]`, computed 4-byte stride) to find the first
 * threshold exceeding an input value -- a classic "bracket lookup".
 * Record count 8 confirmed three ways: declared size (32/4), the loop's
 * own termination behavior, and an independent downstream consumer
 * (func_020117e4.s) that uses the returned bracket index as one of
 * exactly 8 field selectors into the already-typed Record020b4d60[87]
 * array. Signed `lt`/`ge` comparisons throughout confirm element type
 * `int`, not unsigned. See docs/research/data/cm-data-inference-4-2026-07-25.md.
 */

const int data_020b4a0c[8] = {
    3, 7, 18, 24, 34, 40, 45, 100,
};
