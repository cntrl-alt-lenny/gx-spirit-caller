/* CAMPAIGN-PREP candidate for func_0200acf0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     mul-index init + BIND task ptr / RELOAD f_c + STORE-ORDER tail
 *   risk:       struct offsets guessed; two arg0*0x284 muls must not CSE (relies on f_c reload); store order assumed
 *   confidence: med
 */
/* func_0200acf0 — mul-index init: store id, post a task, Fill32 the buffer, clear fields.
   f_c is stored then RELOADED for the second arg0*0x284 (arg0 reg dead) -> read s->f_c. */

extern void *Task_PostLocked(int size, int align, int flags);
extern void Fill32(int val, void *dst, int n);
extern void func_0200ac28(void);
extern int  data_02186a20;

typedef struct {
    unsigned short f0;    /* 0x0 */
    unsigned short f2;    /* 0x2 */
    unsigned short f4;    /* 0x4 (pad) */
    unsigned short f6;    /* 0x6 */
    unsigned int   f8;    /* 0x8 */
    int            f_c;   /* 0xc id */
    unsigned int   f10;   /* 0x10 */
    void          *f14;   /* 0x14 task */
} S8;

extern S8 data_02186a08;

void func_0200acf0(int id)
{
    S8 *s = &data_02186a08;
    int n = id * 0x284;
    void *t;

    s->f_c = id;
    t = Task_PostLocked(n, 4, 0);
    s->f14 = t;
    Fill32(0, t, s->f_c * 0x284);
    Fill32(0, &data_02186a20, 0x30);
    func_0200ac28();

    s->f0  = 0;
    s->f6  = 0x40;
    s->f2  = 0;
    s->f8  = 0;
    s->f10 = 0;
}
