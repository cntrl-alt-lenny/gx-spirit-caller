/* data_020c3630 -- 3-entry dispatch-tag table (12 bytes).
 *
 * Consumed by 3 sibling functions (func_020a1e68.s, func_020a1f7c.s) via
 * a runtime-computed `base + idx*4` word load, and walked in a real loop
 * in func_020a2394.s with a hard `cmp r9,#0x3` bound -- element count 3
 * is loop-bound-proven, not just size-inferred. Each word is dispatched
 * via func_020a21dc.s's `cmp r1,#0/#1/#2` to 3 distinct handlers. See
 * docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

const int data_020c3630[3] = {
    2, 0, 1,
};
