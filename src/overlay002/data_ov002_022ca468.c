/* data_ov002_022ca468 (8 bytes, 4-aligned): NEW carve as part of
 * cm-data-inference-8, filling the first 8 bytes of a previously-
 * unclaimed delinks.txt gap (found while resolving neighbor
 * data_ov002_022ca3dc's trailing word -- this symbol turned out to be
 * a wholly separate object, not a continuation of that one).
 *
 * STRONG: sole consumer func_ov002_022a6e04.s uses `ldr r4,[r8,r9,lsl#2]`
 * (word-granular stride, runtime-variable selector r9 in {0,1}) in 2 of
 * its 4 branches, in parallel with sibling data_ov002_022ca470's
 * identical indexing. Zero relocations anywhere in these 8 bytes
 * (confirmed both elements are plain integers, not pointers).
 */

const int data_ov002_022ca468[2] = { 84, 196 };
