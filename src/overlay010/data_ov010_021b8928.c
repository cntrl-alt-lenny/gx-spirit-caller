/* data_ov010_021b8928 (24 bytes, 4-aligned): NEW carve as part of
 * cm-data-inference-6, filling a previously-unclaimed 24-byte dsd
 * auto-fill gap between data_ov010_021b8908 (old end 0x021b8928) and
 * data_ov010_021b8940. Reverses wave 5's "spurious decomp-tool
 * artifact" hypothesis for this address range -- it is a genuine,
 * deliberately-consumed object, not linker padding.
 *
 * Sole consumer func_ov010_021b72c0.s:346-350 (walled .s, no C match):
 * loads the first 3 words via `ldmia r0,{r0,r1,r2}` and walks them in
 * an explicit `cmp r5,#0x3`-bounded loop, each value passed to
 * func_0202c0c0()/Strlen() -- a message/string-ID lookup idiom,
 * loop-bound-proof of exactly 3 IDs. The remaining 6 halfwords ("tail")
 * are fixed-offset ldrh-read via sibling data_ov010_021b8908's own base
 * pointer (`_LIT7`) at offsets +0x2c through +0x36 in
 * func_ov010_021b799c.s:107-123 -- the same consumer that reads
 * data_ov010_021b8908 continues past its 32-byte boundary directly into
 * this object, which is why the two are evidenced together even though
 * (per the sibling file's note) they are kept as separate TUs.
 */

typedef struct {
    unsigned int ids[3];
    unsigned short tail[6];
} Ov010Entry021b8928;

const Ov010Entry021b8928 data_ov010_021b8928 = {
    .ids = { 0x291, 0x292, 0x293 },
    .tail = { 2, 3, 4, 5, 6, 7 },
};
