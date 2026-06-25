/* CAMPAIGN-PREP candidate for func_02051f98 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind base e=(*g)+id*0x30 (r4) via mla; reload (*g)->x604/x608 per use; ble-guard if-form
 *   risk:       Two return paths use 'addeq sp/ldmeqia' fused conditional epilogues; if mwcc emits a branch-to-shared-epilogue instead, block layout diverges. Also Owner offsets struct-guessed. reshape-able/struct-guessed.
 *   confidence: med
 */
/* func_02051f98 — main, cls C. mla struct-index base (stride 0x30), store-order.
   COMPLETE source w/ pool: _LIT0=data_0219e3ec (T** -> *g is the array base),
   _LIT1=0xfffe82ac. Base e=(*g)+id*0x30 is bound to r4 across the body (bind);
   the (*g)->x604/x608 globals are RELOADED fresh each use (per-global reload). */
typedef struct Ring {
    unsigned char _p0[4];
    unsigned char *buf;   /* +0x04 */
    int           cap;    /* +0x08 */
    unsigned char _pc[4];
    int           count;  /* +0x10 */
    unsigned char _p14[4];
    int           max;    /* +0x18 */
    unsigned char _p1c;
    unsigned char flag;   /* +0x1d */
    unsigned char _p1e[6];
    int           x24;    /* +0x24 */
    int           x28;    /* +0x28 */
    int           x2c;    /* +0x2c */
} Ring;                   /* sizeof == 0x30 */

typedef struct Owner {
    unsigned char _p[0x604];
    void (*cb604)(int id, unsigned char *buf); /* +0x604 */
    int  x608;                                 /* +0x608 */
} Owner;

extern Owner *data_0219e3ec;          /* *g */
extern int  func_02052334(int id);
extern void func_0204525c(int a, int b);
extern void func_02094688(int a, unsigned char *dst, int n);
extern long long func_020930b0(void);

int func_02051f98(int id, int a, int c)
{
    Ring *e = (Ring *)((char *)data_0219e3ec + id * 0x30);

    if (func_02052334(id) == 2) {
        if (e->count + c > e->cap) {
            func_0204525c(6, (int)0xfffe82ac);
            return 0;
        }
        func_02094688(a, e->buf + e->count, c);
    }

    /* .L_bc */
    e->count += c;
    if (e->count == e->max) {
        e->flag = 1;
        e->count = 0;
        e->max = 0;
        if (data_0219e3ec->cb604 != 0)
            data_0219e3ec->cb604(id, e->buf);
    }

    /* .L_10c */
    if (data_0219e3ec->x608 == 0)
        return 0;
    if (e->x2c == 0)
        return 0;
    {
        long long v = func_020930b0();
        e->x24 = (int)v;
        e->x28 = (int)((unsigned long long)v >> 32);
    }
    return 0;
}
