/* data_020d1e10 (12 bytes, struct shape, one internal outgoing relocation at
 * +0x8): single-embedded-pointer record -- the D-3 'complex nested struct
 * array' signature (docs/research/cluster-d-recipe.md) restricted to its
 * simplest case, one pointer field, not N. 8-byte opaque prefix left as
 * unsigned char per this project's no-invented-structure convention (no
 * consumer evidence for a finer field split); the pointer field is a real
 * symbol reference, not a raw address, so it resolves correctly per-region
 * (cm-restock-carve-14).
 * Recipe: docs/research/cluster-b-pointer-pool.md's settled `extern char X;
 * void *Y = &X;` pattern, generalised from a standalone 4-byte slot to this
 * record's [8-byte prefix][4-byte pointer] layout.
 * Ground truth section is .data (delinks.txt) -- no const qualifier, matching
 * cluster-d-recipe.md's D-1/D-2 convention (const would move this to
 * .rodata).
 */
typedef struct {
    unsigned char pre[8];
    void *target;
} PtrRecord12_8;

extern char data_020d1ec4;

PtrRecord12_8 data_020d1e10 = {
    { 0x05, 0x00, 0x22, 0xf5, 0x00, 0x00, 0x00, 0xf8 },
    &data_020d1ec4,
};
