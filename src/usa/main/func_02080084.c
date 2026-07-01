/* CAMPAIGN-PREP candidate for func_02080084 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     swapped-arg call; BIND-vs-RELOAD (reload u16 f8); if-assign select; fnptr store
 *   risk:       Order of fa-then-f4 stores may reorder; f8 reload depends on narrow-field reload.
 *   confidence: med
 */
/* func_02080084: p->f8=(u16)(func_020818a0(arg1,p)-1); reload p->f8;
 * sel = p->f8?2:3 (if-assign); p->fa=sel; p->f4=&func_02081a60. */

typedef struct {
    unsigned char  _pad00[0x04];
    void         (*f4)(void); /* 0x04 */
    unsigned char  _pad08[0x08 - 0x08];
    unsigned short f8;        /* 0x08 */
    unsigned short fa;        /* 0x0a */
} T;

extern int  func_020818a0(int a, T *p);
extern void func_02081a60(void);

void func_02080084(T *p, int arg1) {
    int sel;
    p->f8 = (unsigned short)(func_020818a0(arg1, p) - 1);
    if (p->f8 != 0)
        sel = 2;
    else
        sel = 3;
    p->fa = (unsigned short)sel;
    p->f4 = func_02081a60;
}
