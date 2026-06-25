/* CAMPAIGN-PREP candidate for func_0201b648 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Clear loop (split-bic via ~0x1ff) + single-field clear + tail call
 *   risk:       mwcc must split ~0x1ff as bic 0xff then 0x100 in that order; struct stride 0x18 guessed.
 *   confidence: med
 */
/* func_0201b648: clear loop + single field clear + tail call.
 *   GetSystemWork() -> r0 (base) and r3 (walk);
 *   for (i=0;i<0x56;i++){ e->f8 &= ~0x1ff; e++; }   (stride 0x18)
 *     ~0x1ff not encodable -> bic #0xff ; bic #0x100 (this order);
 *   base[0x8f8] &= ~0xff;
 *   func_0201b60c(0);   (tail)
 */

typedef struct {
    int a;
    int b;
    int f8;
    int c;
    int d;
    int e;
} Ent18;

extern char *GetSystemWork(void);
extern void func_0201b60c(int x);

void func_0201b648(void) {
    char *base = GetSystemWork();
    Ent18 *e = (Ent18 *)base;
    int i;
    for (i = 0; i < 0x56; i++) {
        e->f8 &= ~0x1ff;
        e++;
    }
    *(int *)(base + 0x8f8) &= ~0xff;
    func_0201b60c(0);
}
