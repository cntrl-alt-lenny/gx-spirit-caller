/* data_ov002_022ca470 (16 bytes, 4-aligned): NEW carve as part of
 * cm-data-inference-8, filling the next 16 bytes of the same
 * previously-unclaimed gap as sibling data_ov002_022ca468 (see that
 * file for the full provenance).
 *
 * STRONG: sole consumer func_ov002_022a6e04.s indexes this array in
 * parallel with data_ov002_022ca468 via the identical runtime selector
 * (`ldr r1,[r6,r9,lsl#2]`) for indices {0,1}; a 3rd fallback branch
 * hardcodes `mov r2,#0x8c` / `mov r1,#0x68` (140, 104) -- exactly
 * equal to this array's own elements [2]/[3] -- independently
 * confirming a real 4-element table where 2 of 4 slots got inlined as
 * literals at that particular call site rather than indexed. Zero
 * relocations anywhere in these 16 bytes.
 */

const int data_ov002_022ca470[4] = { 119, 89, 140, 104 };
