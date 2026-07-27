/* data_020c3198 -- the true base of the split 6-byte-record table.
 *
 * dsd split this single 96-byte (16-record) table into 3 sub-symbols
 * by literal-pool address (data_020c3198/9a/9c), because the sole
 * consumer (func_02090330, GLOBAL_ASM/no-match .s) loads a pointer to
 * each FIELD offset within the same record separately, not the record
 * base. The first 4 bytes (record 0's field0/field1) sat in an
 * unclaimed delinks.txt gap with no owning file -- dsd auto-filled them
 * via its own implicit gap mechanism (_dsd_gap@main_177.o) rather than
 * a real source file. Structurally identical to the already-shipped
 * cm-data-020b52d8-carve precedent, except the sole consumer stays .s
 * (never matched to C), so data_020c319a/data_020c319c remain in
 * symbols.txt as address-only markers -- func_02090330.s references
 * them as data_020c3198+2 / data_020c3198+4 (verified identical
 * relocation targets), not as independent symbols any more.
 * See docs/research/data/cm-data-inference-3-2026-07-25.md and
 * docs/research/cm-data-020b52d8-carve-2026-07-25.md (the precedent).
 */

typedef struct {
    unsigned short field0;
    unsigned short field1;
    unsigned short field2;
} Record020c3198;

const Record020c3198 data_020c3198[16] = {
    { 0, 0, 0 },
    { 26624, 0, 0 },
    { 26656, 0, 0 },
    { 26624, 0, 0 },
    { 26688, 0, 0 },
    { 26624, 26688, 32 },
    { 26656, 0, 0 },
    { 26624, 0, 0 },
    { 26720, 0, 0 },
    { 26624, 26720, 32 },
    { 26656, 26720, 32 },
    { 26624, 26720, 64 },
    { 26688, 0, 0 },
    { 26624, 26688, 32 },
    { 26656, 0, 0 },
    { 26624, 0, 0 },
};
