/* data_ov007_021b2fa0 (16 bytes, 4-aligned): script-step dispatch
 * function-pointer table -- 3 handler slots + NULL sentinel, indexed by
 * data_ov007_021b3480[0].
 *
 * NOTE: ov007_core.h's inline comment on this symbol ("script step state
 * [+0]=idx [+4]=timer") does not match the verified bytes/relocs below --
 * that description actually fits the STATE variable data_ov007_021b3480
 * (whose [0]/[1] are incremented/cleared by the consumer below), not this
 * fn-ptr table. The header's comments for 021b2fa0 and 021b3480 appear
 * swapped; flagging for a future header fix, not altering it here.
 *
 * Consumer: src/overlay007/func_ov007_021b2280.c:7,11 (`extern StepFn
 *   data_ov007_021b2fa0[]; ... StepFn fn =
 *   data_ov007_021b2fa0[data_ov007_021b3480[0]];`) -- proven by
 *   config/eur/arm9/overlays/ov007/relocs.txt:2
 *   `from:0x021b22d4 kind:load to:0x021b2fa0 module:overlay(7)`.
 * Pointer fields (genuine relocations), same relocs.txt:
 *   :161 from:0x021b2fa0 to:0x021b22d8 (func_ov007_021b22d8 / Ov007_Init,
 *        still .s)
 *   :162 from:0x021b2fa4 to:0x021b24e0 (func_ov007_021b24e0 /
 *        Ov007_Shutdown, matched)
 *   :163 from:0x021b2fa8 to:0x021b24a4 (func_ov007_021b24a4 /
 *        Ov007_Teardown, matched)
 *   word[3] = 0, no reloc -- NULL terminator.
 * .data-resident: config/eur/arm9/overlays/ov007/delinks.txt `.data
 *   start:0x021b2fa0 end:0x021b3480` (this symbol opens the section) --
 *   NOT const. Typedef name "StepFn" reused verbatim from the consumer.
 */
typedef int (*StepFn)(void);

extern char func_ov007_021b22d8;
extern char func_ov007_021b24e0;
extern char func_ov007_021b24a4;

StepFn data_ov007_021b2fa0[4] = {
    (StepFn)&func_ov007_021b22d8,
    (StepFn)&func_ov007_021b24e0,
    (StepFn)&func_ov007_021b24a4,
    0,
};
