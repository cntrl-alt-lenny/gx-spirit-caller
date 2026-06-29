/* CAMPAIGN-PREP candidate for func_0203d524 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     field switch->strb constants (sparse cmp/beq), guard + tail call
 *   risk:       Struct field offsets/sign guessed (ldrsh f0/f2, ldr f4/f8); sparse switch must emit cmp;beq chain; base[0xd14] needs char* base.
 *   confidence: med
 */
/* func_0203d524: if p->f0==5 and p->f2!=0, set base[0xd14] by p->f8
 * (13->1,15->2,17->3,else 4); if p->f0==7, tail func_0203d39c(p->f4).
 * base = func_0203c900(0x10).
 */
extern char *func_0203c900(int sel);
extern void func_0203d39c(void *p);

typedef struct {
    short f0;   /* ldrsh [r4]    */
    short f2;   /* ldrsh [r4,#2] */
    void *f4;   /* ldr   [r4,#4] */
    int   f8;   /* ldr   [r4,#8] */
} Obj_d524;

void func_0203d524(Obj_d524 *p)
{
    char *base = func_0203c900(0x10);
    if (p->f0 == 5) {
        if (p->f2 == 0) return;
        switch (p->f8) {
        case 0xd:  base[0xd14] = 1; break;
        case 0xf:  base[0xd14] = 2; break;
        case 0x11: base[0xd14] = 3; break;
        default:   base[0xd14] = 4; break;
        }
    } else if (p->f0 == 7) {
        func_0203d39c(p->f4);
    }
}
