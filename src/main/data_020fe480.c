/* data_020fe480 -- 2-field sentinel state block (8 bytes).
 *
 * +0x0 (s16): halfword sentinel, -1 = inactive (ROM default). Written
 * -1 in func_02034c34.s (reset), read+cmp+rewritten in func_020379f8.s
 * (active/inactive dispatch + overwrite with the caller's own arg).
 * +0x4 (s32): a second, distinct field, written via a full 32-bit str
 * in func_02034d58.s with that function's own 4th argument; survives
 * func_02034d58's own trailing call to the func_02034c34 reset (which
 * only clears +0x0). Both fields independently confirmed via
 * relocs.txt (3 relocations, one per consumer, no hidden/orphan
 * references) and the raw ROM's own static initializer, which matches
 * exactly ({-1, pad, -1}). Carved from a previously-unclaimed
 * delinks.txt gap. See docs/queue/claude-scaffolder.md
 * (cm-data-inference-5).
 */

typedef struct {
    short state;    /* +0x0 */
    short pad_2;    /* +0x2 -- no known consumer; ROM-static 0, likely alignment padding */
    int param_4;    /* +0x4 */
} SentinelBlock020fe480;

SentinelBlock020fe480 data_020fe480 = {
    .state = -1,
    .pad_2 = 0,
    .param_4 = -1,
};
