/* data_020f7a00 (56 bytes, 4-aligned): per-screen resource manifest --
 * tag 0xf1000000, 6x {void *ptr; unsigned int kind;} entries, terminator
 * 0xf0000000. Same family as the already-shipped src/main/data_020fb5c0.c
 * (SubEntry020fb5c0, 5 entries) -- local per-file typedef mirrors that
 * precedent (no shared header exists for this family).
 * Consumer: src/overlay007/func_ov007_021b2d0c.c:9,12 (already-matched C):
 *     extern char data_020f7a00[];
 *     *(int *)a0 = func_020211c8(data_020f7a00);
 *   func_020211c8 (src/main/func_020211c8.c, landed) scans its argument
 *   word-by-word for a word whose top byte == 0xf1, then hands that
 *   pointer to func_02021a3c (docs/research/dossiers/02021a3c.md), which
 *   walks {ptr,kind} pairs, dispatching `kind` (0-6) to one of 7 handler
 *   functions with `ptr` as the argument, until top-byte == 0xf0.
 * Cross-module reloc: config/eur/arm9/overlays/ov007/relocs.txt:131
 *   `from:0x021b2d38 kind:load to:0x020f7a00 module:main`.
 * Entry pointers all confirmed real relocs (config/eur/arm9/relocs.txt:
 *   25633-25638): from:0x020f7a04->to:0x020f7a38, 0x020f7a0c->0x020f7b10,
 *   0x020f7a14->0x020f7ba8, 0x020f7a1c->0x020f7c3c, 0x020f7a24->0x020f7c6c,
 *   0x020f7a2c->0x020f7d60. All 6 targets are still default
 *   `kind:data(any)` placeholders in symbols.txt, referenced here by
 *   name, not raw hex.
 * Not const: inside main's .data span (delinks.txt line 4). 4-aligned.
 */
extern char data_020f7a38;
extern char data_020f7b10;
extern char data_020f7ba8;
extern char data_020f7c3c;
extern char data_020f7c6c;
extern char data_020f7d60;

typedef struct {
    void *ptr;
    unsigned int kind;
} SubEntry020f7a00;

struct {
    unsigned int tag;
    SubEntry020f7a00 entries[6];
    unsigned int terminator;
} data_020f7a00 = {
    .tag = 0xf1000000,
    .entries = {
        { &data_020f7a38, 1 },
        { &data_020f7b10, 2 },
        { &data_020f7ba8, 3 },
        { &data_020f7c3c, 3 },
        { &data_020f7c6c, 3 },
        { &data_020f7d60, 3 },
    },
    .terminator = 0xf0000000,
};
