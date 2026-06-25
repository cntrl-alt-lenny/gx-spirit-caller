/* CAMPAIGN-PREP candidate for func_0206eecc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     if/else literal select + tail call (return func)
 *   risk:       the &data vs data (value) form must match a pointer literal; unused a0 arg presence assumed from r1 usage
 *   confidence: med
 */
/* func_0206eecc (main, class A): if/else picks one of two literal
 * pointers, then tail-calls func_0206c46c with it. The dummy
 * `sub sp,#4 / add sp,#4` frame is mwcc's default for a leaf-ish body
 * that spills lr; reproduced by the lr-saving call.
 *
 *   cmp r1,#1; bne .L_24
 *     ldr r0,=data_02101e64; bl func_0206c46c   (arg1 == 1)
 *   .L_24:
 *     ldr r0,=data_02101e4c; bl func_0206c46c   (else)
 *
 * Both paths return whatever func_0206c46c returns (r0 untouched).
 */

extern void *data_02101e4c;
extern void *data_02101e64;
extern int func_0206c46c(void *p);

int func_0206eecc(int a0, int a1)
{
    (void)a0;
    if (a1 == 1)
        return func_0206c46c(&data_02101e64);
    return func_0206c46c(&data_02101e4c);
}
