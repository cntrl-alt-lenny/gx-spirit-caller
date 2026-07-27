/* data_ov002_022ca790 (88 bytes, 4-aligned): retyped from opaque bytes
 * to a { void *ptr; unsigned int value; } array[11] as part of
 * cm-data-inference-7. A distinct record shape from this overlay's
 * already-shipped "8-table {cardId, handler}" family (field order
 * there is {u32, void*}, reloc at offset+4; here it's {void*, u32},
 * reloc at offset+0) -- a new family, not a 9th member of that one.
 *
 * STRONG, triple-corroborated: byte size (88 = 11*8 exactly) x
 * relocs.txt (11 relocations, each exactly 8 bytes apart, zero at any
 * sub-offset, clean symbol boundaries on both sides -- every target
 * lands in ov002 .data, none are function symbols) x consumer loop
 * bound (func_ov002_022b31a4.s:21-60, computed-stride `base[idx*8]`/
 * `base[idx*8+4]`, runtime index r9, dynamic bound r8 reaching a
 * maximum of 11). `ptr` (offset 0) is passed unmodified into
 * func_02006c0c.s as an opaque handle/pointer argument; `value`
 * (offset 4) is deliberately not relocated (plain u32).
 *
 * Raw address-literal casts for the pointer targets, not `extern char
 * X; &X` -- none of the 11 targets are carved yet, and ground truth
 * for this symbol is `.rodata` (config/eur/arm9/overlays/ov002/
 * delinks.txt); see data_ov011_021d30f8.c for why a real relocation
 * would push this into `.data` instead. The struct's own `const`
 * qualifier (inherited by the array declaration) makes each element's
 * `ptr` field a fixed/immutable pointer value, the struct-level
 * equivalent of `void *const`.
 */

typedef struct {
    void *ptr;
    unsigned int value;
} Ov002Ca790Entry;

const Ov002Ca790Entry data_ov002_022ca790[11] = {
    { (void *)0x022cc938, 0x2680 },
    { (void *)0x022cc954, 0x2400 },
    { (void *)0x022cca58, 0x0000 },
    { (void *)0x022cc98c, 0x3480 },
    { (void *)0x022cc9a8, 0x3880 },
    { (void *)0x022cc9c4, 0x3b00 },
    { (void *)0x022cc970, 0x3d80 },
    { (void *)0x022cca18, 0x3f80 },
    { (void *)0x022cca38, 0x3280 },
    { (void *)0x022cc9e0, 0x4380 },
    { (void *)0x022cc9fc, 0x4380 },
};
