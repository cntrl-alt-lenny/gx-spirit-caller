/* CAMPAIGN-PREP candidate for func_0206f48c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     straight-line call chain; bind base to r4; reload other global; ptr-diff args
 *   risk:       arg widths / signatures guessed; scheduling of the *q=0xff store vs the two subtracts may reorder; ptr-diff scaling if base not char*
 *   confidence: low
 */
/* func_0206f48c (main, class A): straight-line setup sequence calling a
 * fixed chain of helpers, threading one result through. Saves {r4,lr}.
 * r4 holds the data_0219f262 base across calls (bound once).
 *
 *   func_02070f44(); func_02070fe8();
 *   r2 = *(int*)data_0219eeec;
 *   func_02070f78(0x44, 0x43, r2);
 *   r0 = func_0206fc6c(&data_0219f262, 7, 0);   r4 = &data_0219f262
 *   *r0 = 0xff; r2 = r0 + 1;
 *   func_0206fc2c(0, 0x12c, (r2 - r4));          r3 = r0+1-base
 *   func_02070430(&data_0219f262, (r0 - r4));    r1 = r0-base
 *   func_02070f24();
 *
 * data_0219f262 is bound to r4 (one ldr, reused as base for the two
 * pointer-difference args). data_0219eeec is loaded fresh (separate).
 */

extern unsigned int data_0219eeec;     /* read as *(int*) */
extern unsigned char data_0219f262[];
extern void func_02070f44(void);
extern void func_02070fe8(void);
extern void func_02070f78(int a, int b, int c);
extern unsigned char *func_0206fc6c(void *base, int a, int b);
extern void func_0206fc2c(int a, int b, int n);
extern void func_02070430(void *base, int n);
extern void func_02070f24(void);

void func_0206f48c(void)
{
    unsigned char *q;

    func_02070f44();
    func_02070fe8();
    func_02070f78(0x44, 0x43, data_0219eeec);

    q = func_0206fc6c(data_0219f262, 7, 0);
    *q = 0xff;
    func_0206fc2c(0, 0x12c, (int)(q + 1 - data_0219f262));
    func_02070430(data_0219f262, (int)(q - data_0219f262));
    func_02070f24();
}
