/* CAMPAIGN-PREP candidate for func_021ab274 (ov005, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     entries via mla; do-while advance-at-top; out[1] RELOADS obj[8] not bound base
 *   risk:       out[1] deliberately re-reads obj[8] (orig `ldr r3,[r0,#0x8]`) rather than reusing the held entries reg -- if mwcc binds it instead, that ldr diverges. reshape-able (reload form).
 *   confidence: med
 */
/* func_ov005_021ab274: locate an entry in obj->entries[] (0x1c stride). Guard:
 * if entries[idx].fc==0 return 0. key = *(obj[4]+4). Starting at &entries[idx],
 * each step: if cur->f0==key wrap to entries[0] else cur++; stop when
 * cur->f4==idx || cur->f0==idx. out[0]=cur, out[1]=&entries[cur->f8] (entries
 * RELOADED), return cur->f0. */
typedef struct E { int f0, f4, f8, fc; char _r[0xc]; } E;  /* 0x1c bytes */

int func_ov005_021ab274(void *obj, int idx, int *out) {
    E *entries = *(E **)((char *)obj + 8);
    E *cur;
    int key;
    if (entries[idx].fc == 0)
        return 0;
    key = *(int *)(*(char **)((char *)obj + 4) + 4);
    cur = &entries[idx];
    do {
        if (cur->f0 == key)
            cur = entries;
        else
            cur = cur + 1;
    } while (cur->f4 != idx && cur->f0 != idx);
    out[0] = (int)cur;
    out[1] = (int)&((*(E **)((char *)obj + 8))[cur->f8]);
    return cur->f0;
}
