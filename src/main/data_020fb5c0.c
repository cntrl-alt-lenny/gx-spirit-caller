/* data_020fb5c0 -- tag + 5-entry (ptr,kind) table + terminator (48 bytes).
 *
 * Consumed by func_020211c8.s (scans for the leading 0xf1000000 tag
 * word) which hands off to func_02021a3c.s, the real structural
 * consumer: a computed-stride (+8/iteration) walk over 5 (ptr,kind)
 * pairs, terminated by a runtime sentinel-word check (`cmp r0,#0xf0`),
 * not a fixed trip count. `kind` (0-6) dispatches through a 7-entry
 * jump table to one of 7 distinct handler functions. Confirmed via 3
 * independent facts: the sentinel scan naturally stops at exactly 48
 * bytes with zero slack; one embedded pointer (entries[1].ptr) is
 * itself the address of the very next symbol, data_020fb5f0; and every
 * `ptr` value resolves to a real, already-known symbol in
 * config/eur/arm9/symbols.txt. Not `const`: the original lives in
 * `.data`, not `.rodata` (verified via delinks.txt). See
 * docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

extern char data_020fb6d8;
extern char data_020fb5f0;
extern char data_020fb720;
extern char data_020fb73c;
extern char data_020fb758;

typedef struct {
    void *ptr;
    unsigned int kind;
} SubEntry020fb5c0;

struct {
    unsigned int tag;
    SubEntry020fb5c0 entries[5];
    unsigned int terminator;
} data_020fb5c0 = {
    .tag = 0xf1000000,
    .entries = {
        { &data_020fb6d8, 6 },
        { &data_020fb5f0, 6 },
        { &data_020fb720, 4 },
        { &data_020fb73c, 4 },
        { &data_020fb758, 5 },
    },
    .terminator = 0xf0000000,
};
