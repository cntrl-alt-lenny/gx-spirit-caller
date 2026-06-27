/* CAMPAIGN-PREP candidate for func_02236728 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     phase if/elif chain; inverted-parity index; RELOAD h2 post-call (twin ip recompute); &0x1fff bitfield
 *   risk:       reshape-able: orig RELOADS h2+recomputes ip after 021b00d0 call (h2 re-read at asm L45); if mwcc CSEs my two '1-(o->b0&1)' into one bound reg, the second ldrh/ip diverges.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_02236728 (ov002, class D) — brief 494.
 * UNVERIFIED build-free draft. Phase state machine on *(int*)(ce288+0x5a8),
 * counter RMW at +0x5ac, INVERTED parity index ip = 1-(h2&1), stride 0x868.
 *   0x80 -> 021e2b3c(); ce288[0x5ac]=0; return 0x7f
 *   0x7f -> c=ce288[0x5ac]++; if c>=2 return 0x7e; else
 *           a=*(int*)(cf184 + ip*0x868); r=021b00d0(a);
 *           e=*(int*)(cf16c + ip*0x868 + r*4 + 0x3a0);   (ip RELOADED from h2)
 *           021e16a4(ip, e & 0x1fff, 0, 1); return 0x7f
 *   0x7e -> 021e2c5c(); return 0
 *   else -> return 0
 * NOTE: asm RELOADS h2 and RECOMPUTES ip after the 021b00d0 call (not bound);
 * obj reg r4 is reused for the call result (so h2 re-read happens pre-clobber). */
extern char data_ov002_022ce288[];   /* state global: +0x5a8 phase, +0x5ac counter */
extern char data_ov002_022cf184[];   /* int table, 0x868 parity stride            */
extern char data_ov002_022cf16c[];   /* record base, 0x868 parity stride          */
extern int  func_ov002_021b00d0(int a);
extern int  func_ov002_021e16a4(int a, int b, int c, int d);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);

struct Obj728 { unsigned short h0; unsigned short b0 : 1; unsigned short s5 : 5; };

int func_ov002_02236728(struct Obj728 *o) {
    int phase = *(int *)(data_ov002_022ce288 + 0x5a8);
    int ip, a, r, e, c;

    if (phase == 0x80) {
        func_ov002_021e2b3c();
        *(int *)(data_ov002_022ce288 + 0x5ac) = 0;
        return 0x7f;
    }
    if (phase == 0x7f) {
        c = *(int *)(data_ov002_022ce288 + 0x5ac);
        *(int *)(data_ov002_022ce288 + 0x5ac) = c + 1;
        if (c >= 2)
            return 0x7e;
        ip = 1 - (o->b0 & 1);
        a = *(int *)(data_ov002_022cf184 + ip * 0x868);
        r = func_ov002_021b00d0(a);
        ip = 1 - (o->b0 & 1);
        e = *(int *)(data_ov002_022cf16c + ip * 0x868 + r * 4 + 0x3a0);
        func_ov002_021e16a4(ip, e & 0x1fff, 0, 1);
        return 0x7f;
    }
    if (phase == 0x7e) {
        func_ov002_021e2c5c();
        return 0;
    }
    return 0;
}
