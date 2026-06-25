/* CAMPAIGN-PREP candidate for func_021b6514 (ov010, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind r4 base (data_9260) held across; (w<<16)>>16 -> u16 cast; stack arg sp[0].
 *   risk:       struct-guessed: 0208c844's stack arg (str r1,[sp] = data_9484) ordering and the data_9260+0x10 base reg held in r4 across the call — if mwcc passes the stack arg differently or reloads the base, the prologue/sp-frame and ldr diverge.
 *   confidence: low
 */
/* func_ov010_021b6514: a linear OAM/text setup pass — build a char via
 * 0208c844 (one stack arg), run two pre-passes (0207ed94/0207ec68), measure
 * a string (021b4884 + 021b2924), and if the summed width is positive blit
 * it (0207f05c) with the width narrowed to u16; restore the blend MMIO
 * (0208c884) and, when a sibling counter is 0, clear the 0x1f00 bits.
 *
 *   sp[0]=data_9484; r6=func_0208c844(0x0400006c, ...stack=data_9484);
 *   func_0207ed94(data_9270); func_0207ec68(data_9270);
 *   r5=func_ov010_021b4884(&sp); w=r5+func_ov010_021b2924(data_9294,data_9270,&sp);
 *   if(w>0) func_0207f05c(&data_9260[0x10]/.., data_9484, (u16)w);
 *   func_0208c884(0x0400106c, r6);
 *   if(data_8d44.f64==0){ *(0x04001000)&=~0x1f00; func_0208c884(0x0400106c,-0x10);} return 1;
 */

typedef struct { char _pad64[0x64]; int f_64; } S_ov010_8d44b;
extern S_ov010_8d44b data_ov010_021b8d44;
extern char data_ov010_021b9260[];
extern char data_ov010_021b9270[];
extern char data_ov010_021b9294[];
extern char data_ov010_021b9484[];
extern int  func_0207ec68(void *p);
extern int  func_0207ed94(void *p);
extern void func_0207f05c(void *dst, void *src, int w);
extern int  func_0208c844(void *reg, int v);
extern void func_0208c884(void *reg, int v);
extern int  func_ov010_021b2924(void *a, void *b, void *c);
extern int  func_ov010_021b4884(void *p);

int func_ov010_021b6514(void) {
    int local;
    int r6, r5, w;

    r6 = func_0208c844((void *)0x0400006c, (int)data_ov010_021b9484);
    func_0207ed94(data_ov010_021b9270);
    func_0207ec68(data_ov010_021b9270);
    r5 = func_ov010_021b4884(&local);
    w  = r5 + func_ov010_021b2924(data_ov010_021b9294, data_ov010_021b9270, &local);
    if (w > 0)
        func_0207f05c(data_ov010_021b9260 + 0x10, data_ov010_021b9484,
                      (int)(unsigned short)w);

    func_0208c884((void *)0x0400106c, r6);
    if (data_ov010_021b8d44.f_64 == 0) {
        *(volatile unsigned int *)0x04001000 &= ~0x1f00;
        func_0208c884((void *)0x0400106c, -0x10);
    }
    return 1;
}
