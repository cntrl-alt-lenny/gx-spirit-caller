/* CAMPAIGN-PREP candidate for func_0203d0e0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Unrolled 6-byte memcmp table scan, stride 0xc0; not-found tail call + saturating inc
 *   risk:       Stride 0xc0 / offsets 0x474,0xd12 guessed; manual byte compares vs memcmp inlining; mvn==-1 sentinel
 *   confidence: med
 */
/* func_0203d0e0: scan a table of count=base->cnt (byte@0xd12) entries
 * (stride 0xc0, region starts at base+0x474) for one whose 6 bytes
 * [0..5] equal key[4..9]. On hit idx=i.
 *  if not found (idx==-1): func_0203d078(r0&0xff, base);
 *     then saturating-inc base->cnt up to 0xa; return 0xa.
 *  else: func_0203cff8(idx, ?, base); return idx.
 * The six explicit byte compares come from comparing fields one at a
 * time (do NOT use memcmp -> it would inline differently).
 */
extern void func_0203cff8(int idx, int r1, void *base);
extern void func_0203d078(int v, void *base);

typedef struct {
    unsigned char b[6];     /* +0x00..0x05 */
    char _pad06[0xc0 - 6];
} TblEnt;

typedef struct {
    char          _pad000[0x474];
    TblEnt        ents[1];      /* +0x474 */
    char          _pad[0xd12 - 0x474 - 0xc0];
    unsigned char cnt;          /* +0xd12 */
} Base;

int func_0203d0e0(unsigned int r0arg, unsigned char *key, int r2, Base *base) {
    int cnt = base->cnt;
    int idx = -1;
    int i;
    TblEnt *e = base->ents;
    for (i = 0; i < cnt; i++) {
        if (key[4] == e->b[0] && key[5] == e->b[1] &&
            key[6] == e->b[2] && key[7] == e->b[3] &&
            key[8] == e->b[4] && key[9] == e->b[5]) {
            idx = i;
            break;
        }
        e++;
    }
    if (idx == -1) {
        func_0203d078(r0arg & 0xff, base);
        if (base->cnt < 0xa) base->cnt = base->cnt + 1;
        return 0xa;
    }
    func_0203cff8(idx, r2, base);
    return idx;
}
