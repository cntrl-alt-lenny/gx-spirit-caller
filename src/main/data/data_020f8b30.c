/* data_020f8b30 (40 bytes, 4-aligned): per-screen resource manifest --
 * tag 0xf1000000, 4x {void *ptr; unsigned int kind;} entries, terminator
 * 0xf0000000. Same family as src/main/data_020fb5c0.c / data_020f7a00.c;
 * local per-file typedef mirrors that precedent. Kind sequence (1,2,6,6)
 * matches sibling data_020f85d0.c (different pointer targets).
 * Consumer: src/overlay009/func_ov009_021ab848.c:7,12,24
 * (already-matched C):
 *     extern int func_020211c8(void *);
 *     extern char data_020f8b30[];
 *     o[11] = func_020211c8(data_020f8b30);
 * Cross-module reloc: config/eur/arm9/overlays/ov009/relocs.txt:147
 *   `from:0x021ab8c0 kind:load to:0x020f8b30 module:main`.
 * Entry pointers all confirmed real relocs (config/eur/arm9/relocs.txt:
 *   25757-25760): from:0x020f8b34->to:0x020f8b58, 0x020f8b3c->0x020f8ba4,
 *   0x020f8b44->0x020f8c0c, 0x020f8b4c->0x020f8c3c. All 4 targets are
 *   still default `kind:data(any)` placeholders, referenced here by name.
 * Not const: inside main's .data span (delinks.txt line 4). 4-aligned.
 */
extern char data_020f8b58;
extern char data_020f8ba4;
extern char data_020f8c0c;
extern char data_020f8c3c;

typedef struct {
    void *ptr;
    unsigned int kind;
} SubEntry020f8b30;

struct {
    unsigned int tag;
    SubEntry020f8b30 entries[4];
    unsigned int terminator;
} data_020f8b30 = {
    .tag = 0xf1000000,
    .entries = {
        { &data_020f8b58, 1 },
        { &data_020f8ba4, 2 },
        { &data_020f8c0c, 6 },
        { &data_020f8c3c, 6 },
    },
    .terminator = 0xf0000000,
};
