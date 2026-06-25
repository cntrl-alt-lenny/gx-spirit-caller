/* CAMPAIGN-PREP candidate for func_022933c4 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     :13 word bitfield, ptr-deref helper, magic-compare bool
 *   risk:       021afb74 returns int*, deref low-13 bits passed to 0202b920(int); >0x708 tail; field width 13 guessed
 *   confidence: low
 */
/* func_ov002_022933c4: if(helper1(f2.bit0, f0, 0) < 0) return 0; v=*helper2() low13; return helper3(v) > 0x708. */

struct F022933c4_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F022933c4_Self { unsigned short f0; struct F022933c4_F2 f2; };

struct F022933c4_Rec { unsigned int field : 13; unsigned int hi : 19; };

extern int func_ov002_022806a4(unsigned int bit, unsigned int f0, int zero);
extern struct F022933c4_Rec *func_ov002_021afb74(void);
extern int func_0202b920(unsigned int field);

int func_ov002_022933c4(struct F022933c4_Self *self) {
    if (func_ov002_022806a4(self->f2.bit0, self->f0, 0) < 0)
        return 0;
    if (func_0202b920(func_ov002_021afb74()->field) > 0x708)
        return 1;
    return 0;
}
