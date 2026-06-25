/* CAMPAIGN-PREP candidate for func_0206bcec (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     accessor + signed-guard (bmi) early return + guarded store
 *   risk:       data_02101e7c passed by address (array-vs-object) may differ; result-in-r4 across bmi may reorder; field 0x20 guessed
 *   confidence: med
 */
/* func_0206bcec: r = func_0206c074((*data_0219ecd8)->_20); if (r < 0)
 * return r; data_0219ece8 = func_0206c46c(data_02101e7c); return r.
 */

typedef struct {
    char _pad_00[0x20];
    int  f20;              /* +0x20 */
} Obj;

extern Obj  *data_0219ecd8;
extern unsigned char data_02101e7c[];
extern void *data_0219ece8;
extern int   func_0206c074(int x);
extern void *func_0206c46c(unsigned char *p);

int func_0206bcec(void) {
    int r = func_0206c074(data_0219ecd8->f20);
    if (r < 0)
        return r;
    data_0219ece8 = func_0206c46c(data_02101e7c);
    return r;
}
