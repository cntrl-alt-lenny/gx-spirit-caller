/* data_020f85d0 (40 bytes, 4-aligned): per-screen resource manifest --
 * tag 0xf1000000, 4x {void *ptr; unsigned int kind;} entries, terminator
 * 0xf0000000. Same family as src/main/data_020fb5c0.c / data_020f7a00.c;
 * local per-file typedef mirrors that precedent. Kind sequence (1,2,6,6)
 * is identical to sibling data_020f8b30.c -- parallel manifests for
 * structurally similar screens, different resource pointers.
 * Consumer: src/overlay008/func_ov008_021b2064.c:14,17,53
 * (already-matched C):
 *     extern int func_020211c8(void *);
 *     extern char data_020f85d0[];
 *     (*(int **)data_ov008_021b270c)[0] = func_020211c8(data_020f85d0);
 * Cross-module reloc: config/eur/arm9/overlays/ov008/relocs.txt:918
 *   `from:0x021b2198 kind:load to:0x020f85d0 module:main`.
 * Entry pointers all confirmed real relocs (config/eur/arm9/relocs.txt:
 *   25719-25722): from:0x020f85d4->to:0x020f85f8, 0x020f85dc->0x020f8644,
 *   0x020f85e4->0x020f86ac, 0x020f85ec->0x020f86dc. All 4 targets are
 *   still default `kind:data(any)` placeholders, referenced here by name.
 * Not const: inside main's .data span (delinks.txt line 4). 4-aligned.
 */
extern char data_020f85f8;
extern char data_020f8644;
extern char data_020f86ac;
extern char data_020f86dc;

typedef struct {
    void *ptr;
    unsigned int kind;
} SubEntry020f85d0;

struct {
    unsigned int tag;
    SubEntry020f85d0 entries[4];
    unsigned int terminator;
} data_020f85d0 = {
    .tag = 0xf1000000,
    .entries = {
        { &data_020f85f8, 1 },
        { &data_020f8644, 2 },
        { &data_020f86ac, 6 },
        { &data_020f86dc, 6 },
    },
    .terminator = 0xf0000000,
};
