/* data_ov015_021b5cc8 (28 bytes, 4-aligned): fn-ptr dispatch table for the
 * audio-phase step dispatcher -- 6 step handlers + NULL terminator, indexed
 * by data_021040ac.fb6c.
 * Consumer: src/overlay015/func_ov015_021b5a14.c:14
 *   (`Ov015StepFn fn = data_ov015_021b5cc8[data_021040ac.fb6c];`)
 * (config/eur/arm9/overlays/ov015/relocs.txt:437,
 *   from:0x021b5a60 kind:load to:0x021b5cc8 module:overlay(15)).
 * All 6 non-null words are confirmed function-start addresses in
 * config/eur/arm9/overlays/ov015/delinks.txt (021b47cc/4ba0/50b8/52c4/5818/59a4);
 * the last, func_ov015_021b59a4, is itself matched ("text-job teardown").
 * Section: config/eur/arm9/overlays/ov015/delinks.txt .data
 * start:0x021b5ba0 end:0x021b5d40 -- candidate is inside, so NOT const.
 */
typedef int (*Ov015StepFn)(void);

extern int func_ov015_021b47cc(void);
extern int func_ov015_021b4ba0(void);
extern int func_ov015_021b50b8(void);
extern int func_ov015_021b52c4(void);
extern int func_ov015_021b5818(void);
extern int func_ov015_021b59a4(void);

Ov015StepFn data_ov015_021b5cc8[7] = {
    func_ov015_021b47cc,
    func_ov015_021b4ba0,
    func_ov015_021b50b8,
    func_ov015_021b52c4,
    func_ov015_021b5818,
    func_ov015_021b59a4,
    0,
};
