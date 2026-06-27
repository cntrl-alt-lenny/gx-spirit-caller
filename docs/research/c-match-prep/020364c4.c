/* CAMPAIGN-PREP candidate for func_020364c4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order r9,r8,r7=id,cb,arg; (u16) normalize; stride-0x78 ptr walk; blx via fn-ptr
 *   risk:       struct-guessed/reshape-able: the OR test reads (u16)w34 then h74 — orig short-circuits with cmpne after a NE on the first; if mwcc evaluates h74 unconditionally the ldrneh/cmpne pattern diverges. Confirm field offsets 0x34/0x74 and short-circuit order.
 *   confidence: med
 */
extern unsigned char data_0219b760[];   /* array base, stride 0x78, 0x1c entries */
extern unsigned char data_0219c408[];   /* upper bound sentinel */

typedef struct {
    char pad34[0x34];
    int w34;            /* +0x34 */
    char pad6a[0x6a - 0x38];
    signed char b6a;    /* +0x6a */
    char pad74[0x74 - 0x6b];
    unsigned short h74; /* +0x74 */
} Ent364;

int func_020364c4(unsigned int id, int (*cb)(void *, int), int arg) {
    int found = 0;
    int i;
    Ent364 *e;
    if (id > 0x0000ffff) {
        if (!(id & 0x8000000)) {
            if (id < (unsigned int)data_0219b760 || id > (unsigned int)data_0219c408) {
                return 0;
            }
            id = ((Ent364 *)id)->w34;
        }
        id = (unsigned short)id;
    }
    e = (Ent364 *)data_0219b760;
    for (i = 0; i < 0x1c; i++) {
        if (e->b6a >= 0) {
            if ((unsigned short)e->w34 == id || e->h74 == id) {
                cb(e, arg);
                found++;
            }
        }
        e = (Ent364 *)((char *)e + 0x78);
    }
    return found > 0 ? 1 : 0;
}
