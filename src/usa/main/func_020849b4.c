/* CAMPAIGN-PREP candidate for func_020849b4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-check indirect call (blx) + orr-store flag
 *   risk:       blx is the indirect-call codegen; if callback arg/this differs reg-alloc on r4 may flip; offsets 0x8/0x10 guessed.
 *   confidence: med
 */
/* func_020849b4: optional callback at +0x10 (passed this), then OR 0x20 at +0x8. */
struct obj_84a9c {
    char pad8[0x8];
    int flags;      /* +0x8 */
    char pad10[0x4];
    void (*cb)(struct obj_84a9c *); /* +0x10 */
};

void func_020849b4(struct obj_84a9c *self) {
    if (self->cb != 0)
        self->cb(self);
    self->flags |= 0x20;
}
