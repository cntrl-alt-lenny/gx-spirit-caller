/* CAMPAIGN-PREP candidate for func_0228878c (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted-loop i<5, bit0/Slot.id bitfields, guard+sink, tail !=0
 *   risk:       loop induction reg-alloc (r5/r6/r7/r8) may flip; func_022536e8 arg order assumed
 *   confidence: med
 */
/* func_ov002_0228878c: scan slots i=0..4 of player b0; for each that
 * passes func_022575c8(self,b0,i), return 1 if
 * func_022536e8(b0, self->f0, slot.id) != 0. */
typedef unsigned short u16;
struct S8878c { u16 f0; u16 b0 : 1; u16 rest : 15; };
struct Slot8878c { unsigned int id : 13; };

extern char data_ov002_022cf16c[];
extern int  func_ov002_022575c8(struct S8878c *self, unsigned int b0, int i);
extern int  func_ov002_022536e8(unsigned int b0, unsigned int f0, unsigned int id);

int func_ov002_0228878c(struct S8878c *self) {
    char *base = data_ov002_022cf16c;
    int i;
    for (i = 0; i < 5; i++) {
        struct Slot8878c *s;
        if (func_ov002_022575c8(self, self->b0, i) == 0) continue;
        s = (struct Slot8878c *)(base + (self->b0 & 1) * 0x868 + i * 20 + 48);
        if (func_ov002_022536e8(self->b0, self->f0, s->id) != 0) return 1;
    }
    return 0;
}
