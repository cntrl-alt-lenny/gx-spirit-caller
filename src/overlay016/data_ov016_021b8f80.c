/* data_ov016_021b8f80 (16 bytes, 4-aligned): fn-ptr dispatch table for the
 * ov016 phase dispatcher -- 3 step handlers + NULL terminator, indexed by
 * data_ov016_021b9740.idx. Already forward-declared in ov016_core.h as
 * "fn-ptr dispatch table (indexed by 9740)".
 * Consumer: src/overlay016/func_ov016_021b2824.c:15
 *   (`Ov016StepFn fn = data_ov016_021b8f80[data_ov016_021b9740.idx];`)
 * (config/eur/arm9/overlays/ov016/relocs.txt:69,
 *   from:0x021b2878 kind:load to:0x021b8f80 module:overlay(16)).
 * Entries confirmed as function starts in delinks.txt: 021b23f0 (.s,
 * unmatched), 021b2788 (matched, "subsystem-A teardown"), 021b27cc (matched,
 * "blank BG + shutdown sequence").
 * Section: .data start:0x021b8f80 end:0x021b9740 -- candidate starts exactly
 * at section start, so NOT const.
 */
typedef int (*Ov016StepFn)(void);

extern int func_ov016_021b23f0(void);
extern int func_ov016_021b2788(void);
extern int func_ov016_021b27cc(void);

Ov016StepFn data_ov016_021b8f80[4] = {
    func_ov016_021b23f0,
    func_ov016_021b2788,
    func_ov016_021b27cc,
    0,
};
