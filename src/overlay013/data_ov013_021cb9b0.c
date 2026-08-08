/* data_ov013_021cb9b0 (20 bytes, 4-aligned): audio/step-phase fn-ptr
 * table for func_ov013_021cb700 (map name Ov013_StepCallback) -- 4 real
 * phase handlers + a NULL sentinel at index 4 that halts the sequence.
 *
 * Consumer (already landed): src/overlay013/func_ov013_021cb700.c --
 *     typedef int (*Ov013StepFn)(void);
 *     extern Ov013StepFn data_ov013_021cb9b0[];
 *     Ov013StepFn fn = data_ov013_021cb9b0[data_021040ac.fb6c];
 *     if (fn != 0) { if (fn() != 0) { data_021040ac.fb6c += 1; } return 0; }
 *     return 1;
 * relocs.txt: from:0x021cb74c kind:load to:0x021cb9b0 module:overlay(13)
 * (config/eur/arm9/overlays/ov013/relocs.txt:271) -- the table's base
 * address, sole reader, matches the census count of 1.
 *
 * Each element is independently reloc-proven (same file):
 *   :331 from:0x021cb9b0 to:0x021c9d74   (func_ov013_021c9d74)
 *   :332 from:0x021cb9b4 to:0x021ca42c   (func_ov013_021ca42c)
 *   :333 from:0x021cb9b8 to:0x021ca7cc   (func_ov013_021ca7cc)
 *   :334 from:0x021cb9bc to:0x021cb674   (func_ov013_021cb674)
 * The trailing word is a plain zero, no reloc. All four targets are also
 * independently named in ov013_core.h's own notes ("021c9d74 / 021ca42c
 * / 021ca7cc ... are the big bodies"; "021cb674 has a relative bl ...
 * to a far helper"), corroborating these are real ov013 functions, not
 * coincidental data. Section: ov013's own .data span is
 * 0x021cb920-0x021cbc00 (delinks.txt), which contains 0x021cb9b0 --
 * kept non-const.
 */

typedef int (*Ov013StepFn)(void);

extern char func_ov013_021c9d74;
extern char func_ov013_021ca42c;
extern char func_ov013_021ca7cc;
extern char func_ov013_021cb674;

Ov013StepFn data_ov013_021cb9b0[5] = {
    (Ov013StepFn)&func_ov013_021c9d74,
    (Ov013StepFn)&func_ov013_021ca42c,
    (Ov013StepFn)&func_ov013_021ca7cc,
    (Ov013StepFn)&func_ov013_021cb674,
    0,
};
