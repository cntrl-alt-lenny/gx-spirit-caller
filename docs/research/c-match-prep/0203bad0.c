/* CAMPAIGN-PREP candidate for func_0203bad0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl r7 then r6; hold pool(r8)+list(r5); signed-byte pool for ldrsb
 *   risk:       permuter-class: heavy 8-reg loop (r4=1,r5=list,r7=count,r8=pool,r9=scan cursor). mwcc likely rotates r9 vs r5 and may not keep r4=1 hoisted; r6/r7 dual-decrement split also coin-flips register choice.
 *   confidence: low
 */
/* func_0203bad0: claim two free marker slots from a shared pool.
 * sl=self. Reset self[+0xaf]/[+0xae]=0xff. count r7=halfword[+0xb8].
 * pool = data_0219d9a8 (signed-byte occupancy). For idx r6 = count-1
 * down to 0: candidate list base = data_020bec1c, +0x11 if
 * func_02088d7c(self)!=0; scan bytes until 0xff; first id whose
 * pool[id]==0 -> claim (pool[id]=1), record id at self[+0xae+r6],
 * count--. If after all slots count still nonzero, undo the two
 * recorded ids and re-init, return 0/cleanup. Else (count==0) finalize
 * via func_02088540 and return its bool. */

extern signed char data_0219d9a8[];
extern unsigned char data_020bec1c[];
extern int func_02088540(void *list, int count, void *out);
extern int func_02088d7c(void *self);

typedef struct Self_0203bad0 {
    char           _pad0[0x4];
    unsigned char  list[0xaa];   /* +0x04 */
    unsigned char  f_ae;         /* +0xae */
    unsigned char  f_af;         /* +0xaf */
    char           _pad1[0x8];
    unsigned short f_b8;         /* +0xb8 */
} Self_0203bad0;

int func_0203bad0(Self_0203bad0 *self) {
    int r7 = self->f_b8;
    int r6;
    self->f_af = 0xff;
    self->f_ae = 0xff;
    for (r6 = r7 - 1; r6 >= 0; r6--) {
        unsigned char *p = data_020bec1c;
        if (func_02088d7c(self) != 0) p = data_020bec1c + 0x11;
        for (;;) {
            unsigned char id = *p;
            if (id == 0xff) break;
            if (data_0219d9a8[id] == 0) {
                data_0219d9a8[id] = 1;
                (&self->f_ae)[r6] = id;
                r7--;
                break;
            }
            p++;
        }
    }
    if (r7 != 0) {
        unsigned char id = self->f_af;
        if (id != 0xff) data_0219d9a8[id] = 0;
        id = self->f_ae;
        if (id != 0xff) data_0219d9a8[id] = 0;
        self->f_af = 0xff;
        self->f_ae = 0xff;
        return 0;
    }
    return func_02088540(&self->list[0], self->f_b8, &self->f_ae) != 0 ? 1 : 0;
}
