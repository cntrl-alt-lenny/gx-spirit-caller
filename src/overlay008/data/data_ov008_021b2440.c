/* data_ov008_021b2440 (16 bytes, 4-aligned): duel/audio phase
 * step-dispatch function-pointer table -- 3 handler slots + NULL
 * sentinel, indexed by data_021040ac.fb6c (GlobalAudioState).
 *
 * Consumer: src/overlay008/func_ov008_021aafa4.c:17,21 (already declares
 *   `extern Ov008StepFn data_ov008_021b2440[];` and reads
 *   `data_ov008_021b2440[data_021040ac.fb6c]`) -- proven by
 *   config/eur/arm9/overlays/ov008/relocs.txt:113
 *   `from:0x021ab000 kind:load to:0x021b2440 module:overlay(8)`.
 * Pointer fields (genuine relocations), same relocs.txt:
 *   :955 from:0x021b2440 to:0x021aa94c (func_ov008_021aa94c, matched .c)
 *   :956 from:0x021b2444 to:0x021aaab4 (func_ov008_021aaab4 /
 *        Ov008_DuelPhaseTick, still .s)
 *   :957 from:0x021b2448 to:0x021aae04 (func_ov008_021aae04 /
 *        Ov008_FieldSetup, still .s)
 *   word[3] = 0, no reloc -- NULL terminator.
 * .data-resident: config/eur/arm9/overlays/ov008/delinks.txt `.data
 *   start:0x021b2440 end:0x021b2780` (this symbol opens the section) --
 *   NOT const.
 * NOTE: docs/research/data/OverlayDataGlobs.md describes this address as
 * "ov008 BSS Block A ... at least 0xb6c bytes (large array)" -- that
 * appears to conflate this 16-byte table with the unrelated
 * `data_021040ac + 0xb6c` field (the actual dispatch-index counter, read
 * by the same function). Ground truth here (relocs.txt + the shipped
 * consumer) supersedes that speculative note.
 */
typedef int (*Ov008StepFn)(void);

extern char func_ov008_021aa94c;
extern char func_ov008_021aaab4;
extern char func_ov008_021aae04;

Ov008StepFn data_ov008_021b2440[4] = {
    (Ov008StepFn)&func_ov008_021aa94c,
    (Ov008StepFn)&func_ov008_021aaab4,
    (Ov008StepFn)&func_ov008_021aae04,
    0,
};
