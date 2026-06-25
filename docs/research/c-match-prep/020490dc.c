/* CAMPAIGN-PREP candidate for func_020490dc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-guard + clear + 64-bit tick split into two stores; sp3
 *   risk:       func_020930b0 must return r0:r1 as u64; the >>32 split could emit shifts instead of plain hi/lo. f_8=0 before call, reload after.
 *   confidence: med
 */
/* func_020490dc: guard on global ptr data_0219dc80; clear p->f_8, then
 * stamp a 64-bit tick from func_020930b0() into p->f_c (low) and
 * p->f_10 (high). sp3 routing.
 *
 *     ldr r0,=data_0219dc80; ldr r1,[r0]; cmp r1,#0; return if 0
 *     mov r0,#0 ; str r0,[r1,#0x8]        ; p->f_8 = 0
 *     bl func_020930b0                     ; r0:r1 = tick64
 *     ldr r2,=data_0219dc80; ldr r2,[r2]   ; reload *p
 *     str r0,[r2,#0xc] ; str r1,[r2,#0x10]  ; f_c=lo, f_10=hi
 *
 * *p is reloaded after the call (the held ptr was clobbered); the two
 * tick halves share the reloaded base. */

typedef struct {
    char         _pad0[0x8];
    int          f_8;           /* +0x08 */
    unsigned int f_c;           /* +0x0c tick low */
    unsigned int f_10;          /* +0x10 tick high */
} state_020490dc_t;

extern state_020490dc_t *data_0219dc80;
extern unsigned long long func_020930b0(void);

void func_020490dc(void) {
    if (data_0219dc80 == 0) return;
    data_0219dc80->f_8 = 0;
    {
        unsigned long long t = func_020930b0();
        data_0219dc80->f_c  = (unsigned int)t;
        data_0219dc80->f_10 = (unsigned int)(t >> 32);
    }
}
