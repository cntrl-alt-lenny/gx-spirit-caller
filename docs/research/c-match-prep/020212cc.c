/* CAMPAIGN-PREP candidate for func_020212cc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: switch(item->type) 0..6 dense -> addls-pc table; loop reloads count each iter
 *   risk:       struct-guessed AND incomplete: batch asm is TRUNCATED past .L_020213a0, so the tail (f0c/f10 flush, Fill32, real return values) is unknown and the stubbed return is a guess. Loop+switch head should match; tail will diverge until full asm is fetched.
 *   confidence: low
 */
/* func_020212cc (class D) -- WARNING: source asm TRUNCATED at 90 lines (size=352,
 * ~88 instrs); only the head + dispatch loop are visible. Tail (from .L_020213a0
 * onward: [r5+0xc] flush, [r5+0x10], Fill32, epilogue) is NOT in the batch and is
 * reconstructed as a best-effort stub -- DO NOT trust past the loop.
 *   r5=arg; if([data_02194340+0]==0) return 1; if([r5+4]==0) return 0;
 *   n=[r5+0x14]; if(n>0){ p=r5+0x18; for(i=0;i<n;i++,p+=0xc){ switch(p[0]) 0..6: handlers(p[1]); } }
 *   ...TRUNCATED: if([r5+0xc]) { x=[r5+0x10]; ... } ...
 */
typedef struct Item {
    int  type;   /* +0x00 */
    int  arg;    /* +0x04 */
    int  _pad8;  /* +0x08 */
} Item;          /* stride 0xc */
typedef struct Obj {
    char _pad00[0x04];
    int  f04;            /* +0x04 */
    char _pad08[0x0c - 0x08];
    int  f0c;            /* +0x0c */
    int  f10;            /* +0x10 */
    int  count;          /* +0x14 */
    Item items[1];       /* +0x18 */
} Obj;

extern int  data_02194340;
extern void Fill32(int val, void *dst, int len);
extern void func_020211a4(void);
extern int  func_02021cbc(int);
extern int  func_02023574(int);
extern int  func_020240a0(int);
extern int  func_020245e8(int);
extern int  func_02027144(int);
extern int  func_02028804(int);
extern int  func_0202a2f8(int);

int func_020212cc(Obj *o) {
    int i, n;
    Item *p;
    if (data_02194340 == 0) return 1;
    if (o->f04 == 0) return 0;
    n = o->count;
    if (n > 0) {
        p = &o->items[0];
        for (i = 0; i < n; i++, p++) {
            switch (p->type) {
            case 0: func_02021cbc(p->arg); break;
            case 1: func_02023574(p->arg); break;
            case 2: func_020240a0(p->arg); break;
            case 3: func_020245e8(p->arg); break;
            case 4: func_02027144(p->arg); break;
            case 5: func_02028804(p->arg); break;
            case 6: func_0202a2f8(p->arg); break;
            default: break;
            }
            n = o->count; /* orig reloads [r5+0x14] each iter */
        }
    }
    /* TRUNCATED tail -- reconstructed stub only */
    return 0;
}
