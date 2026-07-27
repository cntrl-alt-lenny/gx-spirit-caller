/* data_020c68cc -- 8-entry power-of-two shift table (32 bytes).
 *
 * Consumed at 2 independent computed-stride sites in func_02024630.s
 * (`.L_b9c`, two `lsl #0x2` word loads) and 2 more in func_02025a80.s
 * (`.L_544`), all with runtime-variable indices sourced from per-record
 * byte fields -- decodes 2 texture/sprite-size-class fields per call.
 * Not `const`: the original lives in `.data`, not `.rodata` (verified
 * via delinks.txt) -- keep matching that exactly. See
 * docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

unsigned int data_020c68cc[8] = {
    8, 16, 32, 64, 128, 256, 512, 1024,
};
