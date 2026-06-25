/* CAMPAIGN-PREP candidate for func_02287cf4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted-loop scan, bit0/Slot.id bitfields, guard==, tail >0
 *   risk:       Slot +0x10 field bit6 test (f10>>6)&1 may fold to tst#0x40; loop induction reg-alloc
 *   confidence: med
 */
/* func_ov002_02287cf4: scan 11 slots of player (self->b0); for each
 * non-zero, non-flagged slot, return 1 if func_02267df4(slot.id) > 0.
 * Early-out: if d016c.f_cec == self->b0, return 0. */
typedef unsigned short u16;

struct S87cf4 { u16 f0; u16 b0 : 1; u16 rest : 15; };

struct Slot87cf4 {
    unsigned int id : 13;   /* +0x00 (rel slot), abs row+0x30 */
    char         pad[12];
    unsigned int f10;       /* +0x10 (rel slot), abs row+0x40 */
};

extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern int  func_ov002_02267df4(int id);

int func_ov002_02287cf4(struct S87cf4 *self) {
    char *base;
    int i;
    if (*(int *)(data_ov002_022d016c + 0xcec) == self->b0) return 0;
    base = data_ov002_022cf16c + (self->b0 & 1) * 0x868;
    for (i = 0; i <= 10; i++) {
        struct Slot87cf4 *s = (struct Slot87cf4 *)(base + i * 20 + 48);
        if (s->id == 0) continue;
        if ((s->f10 >> 6) & 1) continue;
        if (func_ov002_02267df4(s->id) > 0) return 1;
    }
    return 0;
}
