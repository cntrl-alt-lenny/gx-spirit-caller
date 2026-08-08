/* data_020fdb90 (48 bytes, 4-aligned): per-screen resource manifest --
 * tag 0xf1000000, 5x {void *ptr; unsigned int kind;} entries, terminator
 * 0xf0000000. Same family as src/main/data_020fb5c0.c / data_020f7a00.c;
 * local per-file typedef mirrors that precedent.
 * Consumer: src/overlay006/func_ov006_021c52b8.c:13,15,61
 * (already-matched C):
 *     extern char data_020fdb90[];
 *     extern int func_020211c8(void *);
 *     obj->f_4 = func_020211c8(data_020fdb90);
 * Cross-module reloc: config/eur/arm9/overlays/ov006/relocs.txt:2839
 *   `from:0x021c53b4 kind:load to:0x020fdb90 module:main`.
 * Entry pointers all confirmed real relocs (config/eur/arm9/relocs.txt:
 *   27042-27046): from:0x020fdb94->to:0x020fdbc0, 0x020fdb9c->0x020fdc0c,
 *   0x020fdba4->0x020fdc74, 0x020fdbac->0x020fdca4, 0x020fdbb4->0x020fdcc0.
 *   All 5 targets are still default `kind:data(any)` placeholders,
 *   referenced here by name.
 * Not const: inside main's .data span (delinks.txt line 4). 4-aligned.
 */
extern char data_020fdbc0;
extern char data_020fdc0c;
extern char data_020fdc74;
extern char data_020fdca4;
extern char data_020fdcc0;

typedef struct {
    void *ptr;
    unsigned int kind;
} SubEntry020fdb90;

struct {
    unsigned int tag;
    SubEntry020fdb90 entries[5];
    unsigned int terminator;
} data_020fdb90 = {
    .tag = 0xf1000000,
    .entries = {
        { &data_020fdbc0, 1 },
        { &data_020fdc0c, 2 },
        { &data_020fdc74, 6 },
        { &data_020fdca4, 6 },
        { &data_020fdcc0, 3 },
    },
    .terminator = 0xf0000000,
};
