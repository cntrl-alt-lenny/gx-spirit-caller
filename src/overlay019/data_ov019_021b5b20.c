/* data_ov019_021b5b20 (16 bytes, 4-aligned): fn-ptr dispatch table for the
 * ov019 phase dispatcher -- 3 step handlers + NULL terminator, indexed by
 * data_ov019_021b5e20.idx. Already forward-declared in ov019_core.h as
 * "step-handler fn-ptr table [idx<<2]".
 * Consumer: src/overlay019/func_ov019_021b26d0.c:15
 *   (`Ov019StepFn fn = data_ov019_021b5b20[data_ov019_021b5e20.idx];`)
 * (config/eur/arm9/overlays/ov019/relocs.txt:59,
 *   from:0x021b2724 kind:load to:0x021b5b20 module:overlay(19)).
 * Entries confirmed as function starts: 021b2280 (0x390-byte function; not
 * yet split into its own delinks.txt file, but a real, sized symbol per
 * config/eur/arm9/overlays/ov019/symbols.txt:1
 *   `func_ov019_021b2280 kind:function(arm,size=0x390) addr:0x021b2280`),
 * 021b2610 (matched, "paired-scene per-frame update"), 021b266c (matched,
 * "paired-scene teardown: direct-MMIO DISPCNT clear + call chain").
 * Section: .data start:0x021b5b20 end:0x021b5e20 -- candidate starts exactly
 * at section start, so NOT const.
 */
typedef int (*Ov019StepFn)(void);

extern int func_ov019_021b2280(void);
extern int func_ov019_021b2610(void);
extern int func_ov019_021b266c(void);

Ov019StepFn data_ov019_021b5b20[4] = {
    func_ov019_021b2280,
    func_ov019_021b2610,
    func_ov019_021b266c,
    0,
};
