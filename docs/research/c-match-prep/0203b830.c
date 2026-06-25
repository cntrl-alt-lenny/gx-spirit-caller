/* CAMPAIGN-PREP candidate for func_0203b830 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-returns-constants; bind reloaded half; max(d,0) if-assign
 *   risk:       fb0 must stay bound in one reg across both tsts; movle clamp vs ternary; sub r1,r0 operand order (f04 - f24)
 *   confidence: med
 */
/* func_0203b830: status dispatch returning small constants, else a
 * clamped halfword difference.
 *   if (!(p->fb0 & 0x8000)) return 8;
 *   if (p->fc1 == 0) return 2;
 *   if (p->fb0 & 0x2002) return 8;
 *   q = p->f78; d = (s16)q->f04 - (s16)q->f24;
 *   if (d <= 0) d = 0; return d;
 * fb0 read once (held in r2) across both bit tests -> bind, not reload.
 */

typedef struct Sub {
    char  _pad_00[0x04];
    short f04;   /* +0x04 */
    char  _pad_06[0x24 - 0x6];
    short f24;   /* +0x24 */
} Sub;

typedef struct Obj {
    char           _pad_00[0x78];
    Sub           *f78;   /* +0x78 */
    char           _pad_7c[0xb0 - 0x7c];
    unsigned short fb0;   /* +0xb0 */
    char           _pad_b2[0xc1 - 0xb2];
    unsigned char  fc1;   /* +0xc1 */
} Obj;

int func_0203b830(Obj *p) {
    unsigned short st = p->fb0;
    Sub *q;
    int d;

    if (!(st & 0x8000)) return 8;
    if (p->fc1 == 0) return 2;
    if (st & 0x2002) return 8;

    q = p->f78;
    d = q->f04 - q->f24;
    if (d <= 0) d = 0;
    return d;
}
