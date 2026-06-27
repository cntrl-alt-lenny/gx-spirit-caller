/* CAMPAIGN-PREP candidate for func_02287e5c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     compute sel/nsel both, mul (not mla) two indices, parallel temps a3/b3 held across cmps
 *   risk:       permuter-class: orig keeps ia(r1),ib(r5),a3(r3),b3(lr) all live and reuses ia/ib for later ldrs — mwcc's register pairing of the two mul results + 4 reloads is a scheduling/alloc coin-flip a reshape won't pin.
 *   confidence: low
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct Ent { u16 f0; u16 f2; } Ent;

/* two parallel int arrays indexed by sel*0x868 */
extern int data_ov002_022cf17c[];   /* LIT1 */
extern int data_ov002_022cf180[];   /* LIT2 */
extern int func_ov002_021bbd14(int a, int b);
extern int func_ov002_021c3ae4(int a, int b);

int func_ov002_02287e5c(Ent *e)
{
    Ent *ent;            /* r4 */
    int bit;             /* r0 */
    int sel;             /* r3 = bit&1 */
    int nsel;            /* lr = (1-bit)&1 */
    int ia;              /* r1 = sel*0x868 */
    int ib;              /* r5 = nsel*0x868 */
    int a3;              /* r3 = data17c[ia] */
    int b3;              /* lr = data180[ib] */

    ent = e;
    bit = ent->f2 & 1;
    sel = bit & 1;
    nsel = (1 - bit) & 1;
    ia = sel * 0x868;
    ib = nsel * 0x868;
    a3 = *(int *)((char *)data_ov002_022cf17c + ia);
    b3 = *(int *)((char *)data_ov002_022cf180 + ib);
    if (a3 < 5) {
        if ((unsigned)*(int *)((char *)data_ov002_022cf17c + ib) > (unsigned)a3) return 1;
    } else {
        if ((unsigned)b3 >= (unsigned)*(int *)((char *)data_ov002_022cf17c + ib)) return 0;
        if ((unsigned)b3 >= (unsigned)*(int *)((char *)data_ov002_022cf180 + ia)) return 0;
        if (b3 != 0) {
            if (func_ov002_021c3ae4(b3, 0x12f9) != 0) return 0;
            if (func_ov002_021bbd14(ent->f2 & 1, 0x12f9) != 0) return 0;
        }
    }
    return 1;
}
