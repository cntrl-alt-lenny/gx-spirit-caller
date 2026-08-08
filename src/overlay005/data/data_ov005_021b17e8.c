/* data_ov005_021b17e8 (16 bytes, 4-aligned): CardList step-dispatch
 * function-pointer table -- 3 handler slots + a NULL sentinel, indexed by
 * data_ov005_021b1e4c.idx.
 *
 * Consumer: src/overlay005/func_ov005_021acfb0.c:14,17 (already declares
 *   `extern Ov005StepFn data_ov005_021b17e8[];` and reads
 *   `data_ov005_021b17e8[data_ov005_021b1e4c.idx]`) -- proven by
 *   config/eur/arm9/overlays/ov005/relocs.txt:219
 *   `from:0x021ad014 kind:load to:0x021b17e8 module:overlay(5)`.
 * Pointer fields (each a genuine relocation, not merely pointer-shaped
 * data), same relocs.txt:
 *   :646 from:0x021b17e8 to:0x021acb50 (func_ov005_021acb50 /
 *        CardList_InitHardware, still .s)
 *   :647 from:0x021b17ec to:0x021acf34 (func_ov005_021acf34 /
 *        CardList_Teardown, matched .c)
 *   :648 from:0x021b17f0 to:0x021acf78 (func_ov005_021acf78 /
 *        CardList_InitChannels, matched .c)
 *   word[3] = 0, no reloc -- genuine NULL terminator (matches the
 *   consumer's `if (fn != 0)` guard).
 * .data-resident: config/eur/arm9/overlays/ov005/delinks.txt
 *   `.data start:0x021b17e0 end:0x021b1d40` covers 0x021b17e8 -- NOT const.
 * extern-char + cast convention follows this project's established D-1
 * fn-ptr-table recipe (src/overlay011/data_ov011_021d38bc.c); typedef name
 * reused verbatim from the existing consumer, not invented.
 */
typedef int (*Ov005StepFn)(void);

extern char func_ov005_021acb50;
extern char func_ov005_021acf34;
extern char func_ov005_021acf78;

Ov005StepFn data_ov005_021b17e8[4] = {
    (Ov005StepFn)&func_ov005_021acb50,
    (Ov005StepFn)&func_ov005_021acf34,
    (Ov005StepFn)&func_ov005_021acf78,
    0,
};
