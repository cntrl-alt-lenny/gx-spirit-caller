/* data_ov015_021b5ae8 -- 6-entry {id,val1,val2} language table (36 bytes).
 *
 * Sole consumer func_ov015_021b4ba0.s: `base + idx*6` with a genuine
 * runtime-variable idx (bit-masked from data_02104f4c+4, range 0-7),
 * column count (3 fields, 6-byte stride) proven by a hard outer-loop
 * bound `cmp sl,#0x3`. Row count (6) matches 36/6 exactly but is not
 * independently loop-bound-proven in this function -- flagged as a
 * minor caveat, not enough to demote below STRONG given the
 * unambiguous stride/runtime-index proof. See
 * docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

typedef struct {
    unsigned short id, val1, val2;
} Ov015LangEntry021b5ae8;

const Ov015LangEntry021b5ae8 data_ov015_021b5ae8[6] = {
    { 0x0001, 0x0032, 0x0031 },
    { 0x0001, 0x0032, 0x0031 },
    { 0x0002, 0x0032, 0x0031 },
    { 0x0003, 0x0032, 0x0031 },
    { 0x0004, 0x0032, 0x0031 },
    { 0x0005, 0x0032, 0x0031 },
};
