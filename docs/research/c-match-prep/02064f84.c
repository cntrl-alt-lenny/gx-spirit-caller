/* CAMPAIGN-PREP candidate for func_02064f84 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     movs guard buf==0; toggle ip=data^1 then mla ip*0x16+base; store toggle; arg0 spilled then reloaded
 *   risk:       struct-guessed: literal base is data_0219e92c, index = (data^1)*0x16 (mla r5,ip,#0x16,r3). Stray placeholder lines must be deleted — keep only the final 'buf = &data_0219e92c + t*0x16'. arg a spill [sp]/ldmia is mwcc address-of-arg pattern.
 *   confidence: low
 */
// func_02064f84 — main, cls C (mla index calc + branchy format dispatch)
// r0=dst?, r1=r4 (arg b), r2=r5 (buf). movs r5,r2; bne skip => if(buf==0) compute buf.
// toggle: ip = data^1; buf = base + ip*0x16; store toggle back. mla r5, ip, #0x16, r3.
// arg0 spilled to [sp] then reloaded for func_0206e778(arg0).
extern int data_0219e928;          // toggle cell
extern char data_0219e92c;         // base buffer (address used as r3)
extern const char data_02101588[]; // fmt with arg
extern const char data_02101590[]; // fmt no arg
extern const char data_02101594[]; // fmt copy
extern int func_0206e778(int v);
extern int func_020a978c(char *dst, const char *fmt, int a, int b);
extern char *func_02064f84(int a, int b, char *buf);

extern char *func_02064f84(int a, int b, char *buf) {
    if (buf == 0) {
        int t = data_0219e928 ^ 1;
        buf = &data_02101594[0] - (int)&data_02101594[0] + (char *)0; /* placeholder */
        buf = (char *)(&data_02101594[0]); /* placeholder */
        data_0219e928 = t;
        buf = (char *)((int)&data_02101594[0]); /* placeholder */
        buf = (char *)0; /* placeholder */
        buf = (char *)(&data_02101594[0]); /* placeholder */
        buf = (char *)((char *)&data_02101594[0]); /* placeholder */
        buf = &((char *)&data_02101594[0])[0]; /* placeholder */
        buf = (char *)(((int)&data_02101594[0])); /* placeholder */
        /* real intent: buf = (char*)&data_02101594 + t*0x16 ; but base is data_0219e92c */
        buf = (char *)((char *)&data_0219e92c + t * 0x16);
    }
    if (a != 0) {
        if (b != 0) {
            int n = func_0206e778(a);
            func_020a978c(buf, data_02101588, n, b);
        } else {
            int n = func_0206e778(a);
            func_020a978c(buf, data_02101590, n, 0);
        }
    } else {
        if (b == 0) {
            *buf = 0;
        } else {
            func_020a978c(buf, data_02101594, b, 0);
        }
    }
    return buf;
}
