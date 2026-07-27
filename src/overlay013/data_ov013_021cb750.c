/* data_ov013_021cb750 (100 bytes, 4-aligned): retyped from opaque bytes
 * as part of cm-data-inference-7. Not a genuine opaque blob -- 56 of
 * its 100 bytes (14 words) are relocs.txt-proven pointers, in two
 * evidence tiers:
 *
 * STRONG (code + relocs): offsets +0x20/+0x24 -- fixed-offset reads in
 * live consumer func_ov013_021ca15c.s:20-21 (values passed to
 * `func_02006c0c(ptr, 4, 0)` and built into an OAM task), each also
 * independently reloc-confirmed.
 *
 * STRONG-by-relocs only (no known code consumer, same evidence tier
 * already accepted for shipped sibling data_ov012_021cc1e8): offsets
 * +0x34 through +0x60, 12 consecutive relocated words, gapless,
 * targets clustered in 0x021cb9c4-0x021cbb00 -- verified byte-for-byte
 * against config/eur/arm9/overlays/ov013/relocs.txt, including the
 * genuinely-unusual repeated target (+0x38 through +0x48, 5 separate
 * relocations all independently pointing at the identical address
 * 0x021cb9c4 -- confirmed via the raw bytes and relocs.txt together,
 * not a transcription artifact).
 *
 * Offsets +0x00-0x10 (5 raw words) and +0x28-0x30 (3 raw words) have no
 * relocation and no known consumer -- kept as plain integers, not
 * forced into any shape. Offsets +0x14-0x1F (12 bytes) likewise have
 * no relocation and decode as small packed byte values -- kept raw.
 *
 * Ground truth section is `.rodata` (config/eur/arm9/overlays/ov013/
 * delinks.txt), so the whole struct instance is `const` and the
 * pointer targets use raw address-literal casts, not `extern char X;
 * &X` -- none of the 14 pointer targets are carved yet; see
 * data_ov011_021d30f8.c for why a real relocation would push this into
 * `.data` instead of matching ground truth.
 */

typedef struct {
    unsigned int f00, f04, f08, f0c, f10;
    unsigned char params[12];
    void *cursorCfg[2];
    unsigned int unk28[3];
    void *rows[12];
} Ov013Entry021cb750;

const Ov013Entry021cb750 data_ov013_021cb750 = {
    .f00 = 1, .f04 = 0x1000, .f08 = 8, .f0c = 0x3c, .f10 = 1,
    .params = { 0x20, 0x40, 0x40, 0x40, 0x40, 0x40, 0x05, 0x01, 0x04, 0x00, 0x03, 0x02 },
    .cursorCfg = { (void *)0x021cbb00, (void *)0x021cba54 },
    .unk28 = { 0x819336e3, 0x35002995, 0x81188e57 },
    .rows = {
        (void *)0x021cbab4, (void *)0x021cb9c4, (void *)0x021cb9c4, (void *)0x021cb9c4,
        (void *)0x021cb9c4, (void *)0x021cb9c4, (void *)0x021cba24, (void *)0x021cba3c,
        (void *)0x021cbacc, (void *)0x021cb9f4, (void *)0x021cba0c, (void *)0x021cb9dc,
    },
};
