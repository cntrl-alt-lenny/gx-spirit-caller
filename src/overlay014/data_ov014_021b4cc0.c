/* data_ov014_021b4cc0 (24 bytes, 4-aligned): script-step fn-ptr table for
 * func_ov014_021b26ec (map name Ov014_StepScript) -- 6 slots; slot 3 is a
 * NULL sentinel, same convention as ov013's data_ov013_021cb9b0 and
 * ov005's data_ov005_021b17e8 (both step tables in this project use a
 * NULL entry to halt their stepper).
 *
 * Consumer (already landed): src/overlay014/func_ov014_021b26ec.c --
 *     typedef int (*Ov014StepFn)(void);
 *     extern Ov014StepFn data_ov014_021b4cc0[];
 *     Ov014StepFn fn = data_ov014_021b4cc0[data_ov014_021b5040.idx];
 *     if (fn != 0) { if (fn() != 0) { idx += 1; f4 = 0; } return 0; }
 *     return 1;
 * (docs/research/dossiers-high/021b26ec.md independently confirms the
 * same two literal-pool words, data_ov014_021b5040 then
 * data_ov014_021b4cc0.) relocs.txt: from:0x021b2740 kind:load to:
 * 0x021b4cc0 module:overlay(14) (config/eur/arm9/overlays/ov014/
 * relocs.txt:65) -- sole reader, matches the census count of 1.
 *
 * Each element individually reloc-proven (same file):
 *   :352 from:0x021b4cc0 to:0x021b2280   (func_ov014_021b2280, unmatched
 *        "big render/init builder")
 *   :353 from:0x021b4cc4 to:0x021b25b0   (Ov014_UpdatePanes, already
 *        matched/named)
 *   :354 from:0x021b4cc8 to:0x021b2644   (func_ov014_021b2644, unmatched)
 *   :355 from:0x021b4cd0 to:0x021acfb0   module:overlays(5,21) -- resolves
 *        to func_ov005_021acfb0 (ov005/symbols.txt: real function,
 *        size=0x68, itself an identical StepFn `int(void)`, already
 *        landed as src/overlay005/func_ov005_021acfb0.c); ov021's own
 *        symbols.txt marks the SAME numeric address `data_ov021_021acfb0
 *        kind:bss ... ambiguous`, i.e. not real code there, so ov005's
 *        function is the sensible cross-overlay target (both overlays
 *        alias the same physical RAM window, a known pattern in this
 *        project -- see CLAUDE.md's ov0/ov2 overlay-swap note).
 *   :356 from:0x021b4cd4 to:0x021b2280   (repeat of slot 0)
 * Slot 3's word is a plain zero, no reloc. No other module's relocs.txt
 * targets 0x021b4ccc/0x021b4cd0/0x021b4cd4 as an independent base (the
 * few hits at those literal numeric addresses in ov010/ov015/ov016's own
 * relocs.txt are unrelated code living at the same overlay-swapped RAM
 * range, not references into this table). Section: ov014's own .data
 * span is 0x021b4cc0-0x021b5040 (delinks.txt), which starts exactly at
 * this symbol -- kept non-const.
 */

typedef int (*Ov014StepFn)(void);

extern char func_ov014_021b2280;
extern char Ov014_UpdatePanes;
extern char func_ov014_021b2644;
extern char func_ov005_021acfb0;

Ov014StepFn data_ov014_021b4cc0[6] = {
    (Ov014StepFn)&func_ov014_021b2280,
    (Ov014StepFn)&Ov014_UpdatePanes,
    (Ov014StepFn)&func_ov014_021b2644,
    0,
    (Ov014StepFn)&func_ov005_021acfb0,
    (Ov014StepFn)&func_ov014_021b2280,
};
