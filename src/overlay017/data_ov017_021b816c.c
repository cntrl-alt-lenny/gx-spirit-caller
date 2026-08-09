/* data_ov017_021b816c (20 bytes total, 4-aligned at both ends: 0x021b816c
 * ..0x021b8180): TU-composition carve of 2 adjacent 2-byte-misaligned
 * candidates per docs/research/alignment-wall-tu-composition-recipe.md --
 * data_ov017_021b816c (mod4=0 start, 10-byte size, mod4=2 end) and
 * data_ov017_021b8176 (mod4=2 start, mod4=0 end). Individually each would
 * hit the ALIGNALL(2) wall; declared here as 2 separate named globals of
 * the same 10-byte record type, in address order, in ONE TU whose
 * combined .data section is 20 bytes (4-aligned) -- the exact n=2 case
 * gate-verified by src/overlay016/data/data_ov016_021b9000.c.
 *
 * Both are real, independently-addressed elements of ONE 10-byte-stride
 * 2-element array, confirmed by TWO independent whole-function .s
 * consumers:
 *
 * 1. src/overlay017/func_ov017_021b4df8.s (Ov017_DrawMainCardPanel, per
 *    docs/research/retriage/Ov017Ov019Retriage.md's 0x021B4DF8 section):
 *    loads each by its own literal-pool `.word` (relocs.txt:375-376,
 *    from:0x021b5128/0x021b512c kind:load to:0x021b816c/0x021b8176
 *    module:overlay(17)) as the direct arg to `bl func_ov017_021b2ce4`
 *    (hit-test, lines 182/190 for 816c, 203-204 for 8176) and, for 816c
 *    only, also directly to `bl func_ov017_021b4090` (box-offset forward,
 *    mode 0x13/0x14, lines 197-202: `mov r3,r5` where
 *    r5=data_ov017_021b816c). The same function ALSO indexes across the
 *    pair generically at the tail (lines 214-220):
 *    `ldr r1,[r9,#0x68]; ldr r3,_LIT4(=data_ov017_021b816c); mov r0,#0xa;
 *    mla r3,r1,r0,r3` -- stride=10, runtime index r1 in {0,1} (set by the
 *    two hit-tests above) -- before a 3rd func_ov017_021b4090 call
 *    (mode 0xb). At idx=1 this arithmetic reproduces data_ov017_021b8176's
 *    own address exactly (0x021b816c+1*10=0x021b8176), which is why 8176
 *    has no separate direct-literal Box-forward call of its own -- the
 *    compiler reused the computed address instead, the same pattern
 *    already documented for ov016's proven pair.
 * 2. src/overlay017/func_ov017_021b5130.s (Ov017_MainSceneUpdate): loads
 *    each by its own literal-pool `.word` (relocs.txt:459-460,
 *    from:0x021b5de0/0x021b5de4 kind:load to:0x021b816c/0x021b8176
 *    module:overlay(17)) as the direct arg to `bl func_ov017_021b2d5c`
 *    (lines 783-784 / 791-792 -- the alternate-input-source sibling of
 *    func_ov017_021b2ce4, same Rect layout), a "try touch-source A, else
 *    touch-source B" dual hit-test pair matching the retriage doc's
 *    description of this exact tail (0x021B5130 section: "a 2-source
 *    touch hit-test using the already-matched func_ov017_021b2d5c
 *    sibling").
 *
 * git grep across the whole src/ and config/ trees finds no consumer for
 * either symbol outside these two functions. The array does NOT extend to
 * a 3rd element: the next address, 0x021b8180, is confirmed a DIFFERENT,
 * unrelated symbol -- the first of a 5-entry, 0x1c(28)-byte-stride
 * task-template-pointer array (data_ov017_021b8180/_819c/_81b8/_81d4/
 * _81f0, per docs/research/retriage/Ov017Ov019Retriage.md's 0x021B4570
 * section and confirmed independently via the address deltas in
 * config/eur/arm9/overlays/ov017/symbols.txt: 8180->819c->81b8->81d4->81f0
 * are each +0x1c apart, not +0xa), with its own unrelated consumer
 * (relocs.txt:352, from:0x021b4d98 kind:load to:0x021b8180, inside
 * func_ov017_021b4570 -- not one of this run's two consumers).
 *
 * Field shape: identical evidenced layout to the sibling run
 * src/overlay017/data_ov017_021b80a0.c (see that file's header for the
 * full Rect+Box field-by-field citation) -- Rect{x,y,w,h} at +0/+2/+4/+5
 * (func_ov017_021b2ce4.c / func_ov017_021b2d5c.c, both MATCHED, byte-exact
 * `ldrb` at +4/+5) plus Box{f6,f8} at +6/+8 forwarded verbatim by
 * func_ov017_021b4090.c. All 10 bytes of each element accounted for; no
 * reuse of the 12-byte `Box` typedef (wrong size for a 10-byte stride).
 *
 * Values (both share y=165, w=h=26, f6=2, f8=1, matching every other
 * member of this same box/rect family already shipped or carved alongside
 * this wave; x=196/228, the same +32px-class spacing as the sibling run):
 * extracted via extract_bytes.py from extract/eur/arm9_overlays/ov017.bin
 * (pristine) and cross-checked identical against build/eur/build/
 * arm9_ov017.bin.
 *
 * Section: config/eur/arm9/overlays/ov017/delinks.txt line 5,
 * `.data start:0x021b8020 end:0x021b8520` -- this 20-byte span falls
 * inside, so neither may be `const`. No field's value falls in the
 * 0x02xxxxxx ARM9/overlay address range and relocs.txt has zero `from:`
 * entries originating inside 0x021b816c-0x021b8180, so none of the 10
 * bytes per element is itself a relocated pointer.
 */

typedef struct {
    unsigned short f0;  /* Rect x  == Box f0 */
    unsigned short f2;  /* Rect y  == Box f2 */
    unsigned char  f4;  /* Rect w */
    unsigned char  f5;  /* Rect h */
    unsigned short f6;  /* Box f6, forwarded verbatim by func_ov017_021b4090 */
    unsigned short f8;  /* Box f8, forwarded verbatim by func_ov017_021b4090 */
} Ov017Record021b816c; /* sizeof = 10 */

Ov017Record021b816c data_ov017_021b816c = { 196, 165, 26, 26, 2, 1 };
Ov017Record021b816c data_ov017_021b8176 = { 228, 165, 26, 26, 2, 1 };
