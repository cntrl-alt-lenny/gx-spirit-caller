/* CAMPAIGN-PREP candidate for func_0207fda4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     void early-return guards; cache self; sel=f18->f4&0xff (f4 bound for r2); if/elseif(sel==2)/else dispatch; tail func_0207fea8(rec[ev->h0]); eng=self->f30 reused for fc test+array
 *   risk:       struct-guessed: ev offsets (0x0 h0,0x2 h2,0x4 int|s16,0x6/0x8/0xc/0xe) and self layout inferred from ldr widths; offset 0x4 dual-width forces casts. Confirm real structs. void-ness inferred (early returns leave r0).
 *   confidence: med
 */
/* func_0207fda4: guarded event dispatch + early-return chain (void).
 * ev fields overlap by access width: offset 0x4 is read as int (default
 * path) AND as s16 (sel==2 path) — use a byte base + casted reads. */
typedef char ev_t;   /* opaque byte base; access via casts at fixed offsets */

typedef struct { int f0; int f4; } rec_t;   /* 8-byte array element */
typedef struct { int fc; } eng_t;            /* fc at 0xc */
typedef struct { int f4; } cfg_t;            /* f4 at 0x4 */

typedef struct {
    cfg_t *f0;           /* 0x0   (f0->h4 at byte 0x4) */
    char  _pad04[0x14];  /* 0x4..0x17 */
    cfg_t *f18;          /* 0x18  (->f4 selector source) */
    char  _pad1c[0x10];  /* 0x1c..0x2b */
    int   f2c;           /* 0x2c */
    eng_t *f30;          /* 0x30 */
    int   f34;           /* 0x34 */
    char  f38;           /* 0x38 (&self->f38 passed to helpers) */
} self_t;

extern ev_t *func_0207ead8(self_t *self);
extern int   func_0207e638(eng_t *eng, int id);
extern void  func_0207f8c8(void *p, int a, int b);
extern void  func_0207f8d8(void *p, int a, int b);
extern void  func_0207f8f8(void *p, int a);
extern void  func_0207f914(void *p, int a, int b);
extern int   func_0207fea8(int a, int b, int c);

void func_0207fda4(self_t *self) {
    ev_t *ev;
    int sel;
    int f4v;
    eng_t *eng;

    if (((unsigned short *)self->f0)[2] == 0) return;   /* self->f0->h4 @0x4 */

    ev = func_0207ead8(self);
    self->f2c = func_0207e638(self->f30, *(unsigned short *)ev);  /* ev->h0 @0x0 */

    f4v = self->f18->f4;
    sel = f4v & 0xff;
    func_0207f8c8(&self->f38, 1, f4v);

    if (sel != 0) {
        if (sel == 2) {
            func_0207f914(&self->f38,
                          *(short *)(ev + 0x4),
                          *(short *)(ev + 0x6));
        } else {
            func_0207f8d8(&self->f38,
                          *(int *)(ev + 0x4),
                          *(int *)(ev + 0x8));
            func_0207f8f8(&self->f38, *(unsigned short *)(ev + 0x2));
            func_0207f914(&self->f38,
                          *(short *)(ev + 0xc),
                          *(short *)(ev + 0xe));
        }
    }

    eng = self->f30;
    if (eng->fc == 0) return;
    if (self->f34 == -1) return;
    {
        rec_t *rec = (rec_t *)((int *)((char *)eng->fc + 4))[0]; /* eng->fc->f4 */
        unsigned short idx = *(unsigned short *)ev;             /* ev->h0 @0x0 */
        func_0207fea8(self->f34, rec[idx].f0, rec[idx].f4);
    }
}
