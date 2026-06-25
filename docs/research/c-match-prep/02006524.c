/* CAMPAIGN-PREP candidate for func_02006524 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BIND struct base (data_02103da4) + guarded blx tail calls; RMW MMIO
 *   risk:       Three indirect calls reload data_02103da4 each time in orig; binding base would diverge; field offsets guessed.
 *   confidence: low
 */
/* func_02006524: VBlank/HBlank-ish handler. Sets bit0 of field 0x31c,
 * increments counter 0x334, sets bit0 of a control reg at
 * data_027e0000+0x3000+0xff8, then calls three optional handlers stored at
 * +0x314 / +0x310 / +0x30c (NULL-guarded), finally func_020919d8(field 0x0).
 *
 * IMPORTANT: orig RELOADS data_02103da4 before each indirect call (it is
 * NOT bound to a callee-saved reg), so reference the global directly each
 * time rather than binding a local — binding would add a diff.
 */
extern char data_02103da4[];
extern char data_027e0000[];
extern void func_020919d8(void *p);

typedef void (*handler_t)(void);

void func_02006524(void) {
    char *base = data_02103da4;
    char *ctl  = data_027e0000 + 0x3000;
    handler_t h;

    *(unsigned int *)(base + 0x31c) |= 1u;
    *(int *)(base + 0x334) += 1;
    *(unsigned int *)(ctl + 0xff8) |= 1u;

    h = *(handler_t *)(data_02103da4 + 0x314);
    if (h) h();
    h = *(handler_t *)(data_02103da4 + 0x310);
    if (h) h();
    h = *(handler_t *)(data_02103da4 + 0x30c);
    if (h) h();

    func_020919d8(*(void **)(data_02103da4 + 0x0));
}
