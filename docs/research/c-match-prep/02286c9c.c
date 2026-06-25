/* CAMPAIGN-PREP candidate for func_02286c9c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     cursor cur(+=1)/par(+=4); count re-read from fixed base; id via :13 shift pair
 *   risk:       struct-guessed: ce288 (byte cursor, kind@+0x5dc, count@+0x5d4 read from fixed r9) and ce884 (stride-4 parallel) offsets are inferred from raw ldrb/ldr — must confirm real struct; loop-bound reg (r9 vs r6) and bcc-unsigned compare may also flip.
 *   confidence: low
 */
/* func_ov002_02286c9c (ov002, class C) — single counted-loop scan, struct accessors.
 * Two early guards, fetch a pair of out-params, then walk a count-bounded event log;
 * for each entry of kind 0x16 resolve a card id and return 1 on any of three predicates. */
typedef unsigned short u16;
typedef unsigned int   u32;

struct Self86c9c { u16 f0; u16 b0 : 1; u16 rest : 15; };

extern char data_ov002_022ce288[];   /* {... ; u8 kind[]@0x5dc ; u32 count@0x5d4 } cursor */
extern char data_ov002_022ce884[];   /* parallel u32 array, stride 4 */
extern char data_ov002_022cf178[];
extern char data_ov002_022d0250[];   /* halfword card table */
extern int  func_0202b8a8(int id);
extern int  func_0202b8f0(int id);
extern int  func_0203058c(int id);
extern int  func_ov002_02280a1c(int opp, int *outA, int *outB, int one);
extern int  func_ov002_02281a74(struct Self86c9c *self);

int func_ov002_02286c9c(struct Self86c9c *self) {
    int outA, outB;
    int i;
    char *cur;
    u32 *par;
    if (*(int *)(data_ov002_022cf178 + (self->b0 & 1) * 0x868) > 2) return 0;
    if (func_ov002_02281a74(self) == 0) return 0;
    func_ov002_02280a1c(1 - self->b0, &outA, &outB, 1);
    cur = data_ov002_022ce288;
    par = (u32 *)data_ov002_022ce884;
    for (i = 0; (u32)i < *(u32 *)(data_ov002_022ce288 + 0x5d4); i++) {
        u32 idx, id;
        if (cur[0x5dc] != 0x16) goto next;
        idx = (*par << 0x17) >> 0x15;
        id  = (u32)(*(u16 *)(data_ov002_022d0250 + idx) << 0x13) >> 0x13;
        if (func_0202b8a8(id) > 4) return 1;
        if (func_0203058c(id) != 0) return 1;
        if (func_0202b8f0(id) > 0x578) {
            if (func_0202b8f0(id) + 0x320 >= outA) return 1;
        }
    next:
        cur += 1;
        par += 1;
    }
    return 0;
}
