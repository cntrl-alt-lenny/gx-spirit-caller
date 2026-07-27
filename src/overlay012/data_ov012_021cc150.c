/* data_ov012_021cc150 (48 bytes, 4-aligned): retyped from opaque bytes to
 * a signed int[4][3] record table as part of cm-data-inference-6.
 *
 * Sole consumer func_ov012_021c9e1c.s (walled .s, no C match): bulk-copies
 * all 48 bytes into a stack buffer via 3x paired ldmia/stmia (lines 37-43),
 * then walks it with an explicit `cmp r7,#0x4; bcc` (4-record) inner loop
 * bound reading `ldmia sl,{r0,r1,r2}` (3 words) per record and `add
 * sl,sl,#0xc` (12-byte stride) -- both the record count and field width
 * are loop-bound-proven, not merely inferred from total byte size. Fields
 * are plain s32 deltas/sizes (relocs.txt confirms no embedded pointers).
 */

typedef struct {
    int f0;
    int f1;
    int f2;
} Row021cc150;

const Row021cc150 data_ov012_021cc150[4] = {
    { 0, 0, 40960 },
    { -20480, 1024, 0 },
    { 0, 2048, -61440 },
    { 40960, 3072, 0 },
};
