/* CAMPAIGN-PREP candidate for func_0208016c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     swapped-arg call; BIND-vs-RELOAD (reload u16 f8); if-assign select; fnptr store
 *   risk:       Order of fa-then-f4 stores may reorder; f8 reload depends on narrow-field reload.
 *   confidence: med
 */
/* func_0208016c: p->f8=(u16)(func_02081988(arg1,p)-1); reload p->f8;
 * sel = p->f8?2:3 (if-assign); p->fa=sel; p->f4=&func_02081b48. */

typedef struct {
    unsigned char  _pad00[0x04];
    void         (*f4)(void); /* 0x04 */
    unsigned char  _pad08[0x08 - 0x08];
    unsigned short f8;        /* 0x08 */
    unsigned short fa;        /* 0x0a */
} T;

extern int  func_02081988(int a, T *p);
extern void func_02081b48(void);

void func_0208016c(T *p, int arg1) {
    int sel;
    p->f8 = (unsigned short)(func_02081988(arg1, p) - 1);
    if (p->f8 != 0)
        sel = 2;
    else
        sel = 3;
    p->fa = (unsigned short)sel;
    p->f4 = func_02081b48;
}
