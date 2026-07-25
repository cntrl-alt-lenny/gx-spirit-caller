/* data_ov002_022c819c (432 bytes, 4-aligned): retyped from opaque bytes to
 * a typed struct array as part of cm-data-inference-3.
 *
 * Independent of the 8-table "card-ID -> handler-pointer pair" family
 * (func_ov002_02257464.s/func_ov002_0228bcd0.s, the family's shared
 * helpers, do not reference this symbol at all) -- this table has its
 * own bespoke pair of consumers and a wider 4-field/16-byte record.
 *
 * Evidence: func_ov002_02259ee8.s linear-scans the table (`add
 * r7,r7,#0x10` per iteration, stride 16, loop bound `cmp r5,#0x1b` = 27
 * records exactly, 432/16), reads offset 0 (id, full-word compare) and
 * offset 0xC (handler fn ptr, `blx` with 3 args). func_ov002_02259b4c.s
 * independently scans the SAME table (same stride/bound) and reads
 * offset 4 (category, compared against a runtime value) and offset 8
 * (predicate fn ptr, `blx` with 1 arg) -- between the two consumers, all
 * four fields are directly evidenced. relocs.txt/symbols.txt confirm
 * both pointer fields resolve 100% to real func_ov002_* symbol starts.
 *
 * Pointer fields emitted as raw (void *)0x... literal-address casts (no
 * per-record relocation needed for a byte-identical final ROM -- same
 * technique already established for the 8-table family's handler
 * field). Byte content is an exact reinterpretation of the same bytes
 * previously shipped as `const unsigned char data_ov002_022c819c[432]`
 * -- mechanically parsed out of the previous literal and
 * round-trip-verified, never hand-transcribed.
 */
typedef struct {
    unsigned int cardId;      /* offset 0x0 */
    unsigned int category;    /* offset 0x4 -- observed values: 12, 13, 14 only */
    void *predicate;           /* offset 0x8 -- called with 1 arg (func_ov002_02259b4c.s) */
    void *handler;               /* offset 0xC -- called with 3 args (func_ov002_02259ee8.s) */
} Ov002CardBonusEntry;

const Ov002CardBonusEntry data_ov002_022c819c[27] = {
    { 0x128c, 13, (void *)0x02259990, (void *)0x02259a94 },
    { 0x112e, 13, (void *)0x02259990, (void *)0x02259a94 },
    { 0x1315, 13, (void *)0x022598ec, (void *)0x02259a40 },
    { 0x196b, 13, (void *)0x02259990, (void *)0x02259a94 },
    { 0x196c, 13, (void *)0x02259990, (void *)0x02259a94 },
    { 0x196d, 13, (void *)0x02259990, (void *)0x02259a94 },
    { 0x196e, 13, (void *)0x02259990, (void *)0x02259a94 },
    { 0x1449, 14, (void *)0x022598ec, (void *)0x02259a40 },
    { 0x144c, 14, (void *)0x022598ec, (void *)0x02259a40 },
    { 0x1452, 14, (void *)0x022598ec, (void *)0x02259a40 },
    { 0x1457, 14, (void *)0x022598ec, (void *)0x02259a40 },
    { 0x193a, 14, (void *)0x02259914, (void *)0x02259a68 },
    { 0x1aac, 14, (void *)0x02259914, (void *)0x02259a68 },
    { 0x1b25, 14, (void *)0x02259914, (void *)0x02259a68 },
    { 0x1b2c, 14, (void *)0x02259914, (void *)0x02259a68 },
    { 0x15b4, 12, (void *)0x022599e8, (void *)0x02259ac0 },
    { 0x15b1, 12, (void *)0x022599e8, (void *)0x02259ac0 },
    { 0x15f9, 12, (void *)0x022599e8, (void *)0x02259ac0 },
    { 0x15fa, 12, (void *)0x022599e8, (void *)0x02259ac0 },
    { 0x1953, 12, (void *)0x022599e8, (void *)0x02259ac0 },
    { 0x1954, 12, (void *)0x022599e8, (void *)0x02259ac0 },
    { 0x1a6d, 12, (void *)0x022599e8, (void *)0x02259ac0 },
    { 0x1a6e, 12, (void *)0x022599e8, (void *)0x02259ac0 },
    { 0x1a6f, 12, (void *)0x022599e8, (void *)0x02259ac0 },
    { 0x1b4c, 12, (void *)0x022599e8, (void *)0x02259ac0 },
    { 0x1b4d, 12, (void *)0x022599e8, (void *)0x02259ac0 },
    { 0x1b4e, 12, (void *)0x022599e8, (void *)0x02259ac0 },
};
