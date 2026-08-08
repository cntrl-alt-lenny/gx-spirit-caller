/* data_ov017_021b8020 (16 bytes, 4-aligned): fn-ptr dispatch table for the
 * ov017 phase dispatcher -- 3 step handlers + NULL terminator, indexed by
 * data_ov017_021b8520.idx. Already forward-declared in ov017_core.h as
 * "step-handler fn-ptr table [idx<<2]".
 * Consumer: src/overlay017/func_ov017_021b2c8c.c:15
 *   (`Ov017StepFn fn = data_ov017_021b8020[data_ov017_021b8520.idx];`)
 * (config/eur/arm9/overlays/ov017/relocs.txt:109,
 *   from:0x021b2ce0 kind:load to:0x021b8020 module:overlay(17)).
 * Entries confirmed as function starts in delinks.txt: 021b22ec (.s,
 * unmatched, 0x8f0-byte main-scene controller), 021b2bdc (matched, "scene
 * enter/poll wrapper"), 021b2c48 (matched, "scene enter/poll wrapper").
 * Section: .data start:0x021b8020 end:0x021b8520 -- candidate starts exactly
 * at section start, so NOT const.
 */
typedef int (*Ov017StepFn)(void);

extern int func_ov017_021b22ec(void);
extern int func_ov017_021b2bdc(void);
extern int func_ov017_021b2c48(void);

Ov017StepFn data_ov017_021b8020[4] = {
    func_ov017_021b22ec,
    func_ov017_021b2bdc,
    func_ov017_021b2c48,
    0,
};
