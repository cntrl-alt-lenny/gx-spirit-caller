/* data_ov001_021ca384 (20 bytes, 4-aligned): per-phase step-function
 * dispatch table (5 entries: 4 real handlers + a NULL sentinel).
 * Sole reader: func_ov001_021ca2f8 (src/overlay001/func_ov001_021ca2f8.c,
 * ALREADY SHIPPED/matched), which already declares and uses this exact
 * symbol: `extern Ov001StepFn data_ov001_021ca384[]; ... Ov001StepFn fn =
 * data_ov001_021ca384[data_021040ac.fb6c]; if (fn != 0) { if (fn() != 0)
 * data_021040ac.fb6c += 1; ... }` (relocs.txt ov001:67 from:0x021ca344
 * kind:load to:0x021ca384). Independently confirmed by
 * docs/research/retriage/SmallOverlaysRetriageR7.md:270-296.
 * Each element is itself a proven relocation (relocs.txt ov001:76-79):
 *   from:0x021ca384 to:0x021c9d60 -> func_ov001_021c9d60 (not yet split
 *     out of the ov001 gap region into its own delinked file, but a
 *     named function symbol per symbols.txt: kind:function(arm,size=0x1c4))
 *   from:0x021ca388 to:0x021ca074 -> func_ov001_021ca074 (matched C)
 *   from:0x021ca38c to:0x021ca144 -> func_ov001_021ca144 (matched C)
 *   from:0x021ca390 to:0x021ca2d8 -> func_ov001_021ca2d8 (matched C)
 * Element [4] (offset +0x10) has no reloc -- genuine NULL terminator,
 * matches the `if (fn != 0)` guard in the consumer.
 * Reuses the Ov001StepFn typedef exactly as declared in
 * func_ov001_021ca2f8.c (repeated here since each TU is self-contained
 * in this codebase's convention; not const -- .data, delinks.txt ov001
 * line 4: .data start:0x021ca380 end:0x021ca420).
 */
typedef int (*Ov001StepFn)(void);

extern int func_ov001_021c9d60(void);   /* unmatched gap function, named per symbols.txt */
extern int func_ov001_021ca074(void);
extern int func_ov001_021ca144(void);
extern int func_ov001_021ca2d8(void);

Ov001StepFn data_ov001_021ca384[5] = {
    func_ov001_021c9d60,
    func_ov001_021ca074,
    func_ov001_021ca144,
    func_ov001_021ca2d8,
    0,
};
