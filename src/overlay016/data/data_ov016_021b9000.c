/* cm-restock-carve-3 Part 2 EXPERIMENT: TU-composition test against the
 * documented ALIGNALL(2) alignment wall (docs/research/
 * cluster-b-size-1-2-recipe.md, docs/research/ov004-odd-aligned-slot-
 * recipe.md). data_ov016_021b9000 (0x021b9000, mod4=0 start, 10-byte
 * size, mod4=2 end) and data_ov016_021b900a (0x021b900a, mod4=2 start,
 * 10-byte size, mod4=0 end) are two of the census's 2-byte-misaligned
 * struct candidates. Individually each would trigger the wall (a
 * sub-4-byte-multiple .data section). This file declares BOTH as
 * separate named globals of the same 10-byte record type, in address
 * order, in ONE TU whose combined .data section is 20 bytes (a 4-byte
 * multiple) -- testing whether TU composition (not source-level
 * alignment hints, all three of which wave 1 already falsified) avoids
 * the cascade, and whether mwcc preserves 2-global declaration order
 * (a smaller-scale version of the reordering that broke wave 1's
 * larger kv_t bundle attempt).
 *
 * Both symbols are real, independently-addressed consumers, not an
 * artificial pairing: src/overlay016/func_ov016_021b2d4c.s loads each
 * by its own literal-pool `.word` as a direct base pointer for two
 * "case 0" / "case 1" fast-path branches (relocs.txt:120-121
 * from:0x021b2f54/0x021b2f58 kind:load to:0x021b9000/0x021b900a
 * module:overlay(16)), AND (relocs.txt:162-163, a second call site)
 * indexes across the SAME pair with a `mov r0,#0xa; mul r0,r1,r0`
 * (stride=10) computation reading offsets +0/+2/+6/+8 of
 * &data_ov016_021b9000 + idx*10 -- i.e. this is genuinely one 10-byte-
 * stride record array that dsd's boundary deduction split into
 * separate placeholder symbols because the two fast-path branches
 * happen to reference elements 0 and 1 by direct literal instead of by
 * indexed arithmetic. A 3rd element (data_ov016_021b9014) is accessed
 * the same way but is OUT OF SCOPE for this bounded experiment (Part 1
 * carves it separately as an aligned candidate).
 *
 * Field roles (u16 each, offsets +0/+2/+4/+6/+8 within each 10-byte
 * record) are only partially consumer-proven: +0x2 is read directly
 * for records 0/1/2 (func_ov016_021b2d4c.s:82,111 relative to record 0's
 * base) and fed into a width-like computation (-3, then passed to
 * func_ov016_021b2a8c alongside a fixed second arg per case); +0x0,
 * +0x6, +0x8 are read together in the generic indexed path
 * (func_ov016_021b2d4c.s:128-131). +0x4 is not read by any traced
 * consumer.
 *
 * Section: config/eur/arm9/overlays/ov016/delinks.txt line 5 confirms
 * `.data start:0x021b8f80 end:0x021b9740` -- both addresses fall
 * inside .data, so neither may be `const`.
 */

typedef struct {
    unsigned short f0;
    unsigned short f2;
    unsigned short f4;
    unsigned short f6;
    unsigned short f8;
} Ov016Record021b9000;

Ov016Record021b9000 data_ov016_021b9000 = { 0x00e4, 0x00a5, 0x1a1a, 0x0002, 0x0000 };
Ov016Record021b9000 data_ov016_021b900a = { 0x0012, 0x003b, 0x15dc, 0x0002, 0x0002 };
