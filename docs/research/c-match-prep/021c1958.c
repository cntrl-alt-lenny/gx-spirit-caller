/* CAMPAIGN-PREP candidate for func_021c1958 (ov006, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     GUARD scan loop; do-while with pre-index ptr walk
 *   risk:       p++ then re-read may not fuse into ldrsh [r,#0x18]!; struct stride 0x18 guessed; first-arg-unused assumption.
 *   confidence: med
 */
/* func_ov006_021c1958: linear scan over fixed-stride (0x18) records whose
 * first field is a signed 16-bit key, terminated by a negative key. key_target
 * = func_0202bcb0(arg1). If the first record's key < 0 return NULL. Otherwise
 * walk: on key==target return the record pointer; advance (pre-indexed
 * ldrsh [r,#0x18]!) while key >= 0. The first parameter (r0) is unused. */

extern int func_0202bcb0(int x);

typedef struct {
    short key;
    char  _pad[0x16];
} ov006_021c1958_rec;

extern ov006_021c1958_rec data_020c9694[];

ov006_021c1958_rec *func_ov006_021c1958(int unused, int arg1) {
    int target = func_0202bcb0(arg1);
    ov006_021c1958_rec *p = data_020c9694;
    if (p->key < 0)
        return 0;
    do {
        if (p->key == target)
            return p;
        p++;
    } while (p->key >= 0);
    return 0;
}
