/* CAMPAIGN-PREP candidate for func_02294734 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C+D: side base bound to s; row :13 extract (lsl13/lsr13) then :16 for arg; i,j counters; do-while bcc
 *   risk:       orig binds r6=base(022cf16c), r4=0x868, recomputes mul(f0,0x868)=r1 each iter and adds r9(=j) + #0x120; bitfield r8=:13 reused as both :16 arg and func arg. mwcc loop reg-alloc (r5/r7/r8/r9/fp roles) is a scheduling coin-flip. permuter-class. struct-guessed Side offsets 0xc/0x120
 *   confidence: low
 */
typedef struct Unit {
    unsigned short field0;
    unsigned short f0 : 1;
    unsigned short f1 : 5;
    unsigned short pad6 : 6;
    unsigned short f12 : 2;
    unsigned short f14 : 1;
    unsigned short pad15 : 1;
} Unit;

typedef struct Side {
    int count;
    char pad4[8];
    int n;
    char pad10[0x110];
    int rows[1];
} Side;

extern unsigned char data_ov002_022cf16c[];
extern Side data_ov002_022cf178[];
extern int func_ov002_0227c678(int v, int one);
extern int func_ov002_02280980(int side);
extern int func_ov002_022815a4(int v, int j);

int func_ov002_02294734(Unit *u) {
    Side *s;
    int i, j;
    int field;
    if (func_ov002_02280980(u->f0) >= 0)
        return 0;
    s = (Side *)(data_ov002_022cf178 + u->f0 * 0x868);
    if ((unsigned int)s->count <= 3)
        return 0;
    if (s->count == 0)
        return 1;
    i = 0;
    j = 0;
    do {
        field = *(int *)(data_ov002_022cf16c + u->f0 * 0x868 + j + 0x120) << 0x13 >> 0x13;
        if (func_ov002_0227c678((field << 0x10) >> 0x10, 1) != 0)
            return 0;
        if (func_ov002_022815a4(field, i) != 0)
            return 0;
        i++;
        j += 4;
    } while ((unsigned int)i < (unsigned int)*(int *)(data_ov002_022cf16c + u->f0 * 0x868 + 0xc));
    return 1;
}
