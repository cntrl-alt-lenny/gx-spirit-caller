/* CAMPAIGN-PREP candidate for func_022b2fbc (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     STORE-ORDER initializer; adjacent [0]/[4] coalesce to stmia
 *   risk:       mwcc may reorder the unsorted store sequence or fail to coalesce [0]/[4]; if so, store-order/scheduling diff. -1 via sub r1,r2,#1 reuse must hold.
 *   confidence: med
 */
/* func_ov002_022b2fbc: pure struct field initializer. Stores follow the
 * exact STORE-ORDER of the asm. f0=1 & f4=0 coalesce into stmia r0,{r1,r2}
 * (adjacent, first two). Then the rest in literal order; f58/fc/f0c use -1
 * (sub r1,r2,#1), f10/f14 use 7.
 *
 *     mov r1,#1 ; mov r2,#0
 *     stmia r0,{r1,r2}            ; [0]=1 [4]=0
 *     str r2,[r0,#0x60] ; str r2,[r0,#0x8] ; str r2,[r0,#0x24]
 *     str r2,[r0,#0x28] ; str r2,[r0,#0x3c] ; str r2,[r0,#0x40]
 *     str r2,[r0,#0x34] ; str r2,[r0,#0x38] ; str r2,[r0,#0x44]
 *     str r2,[r0,#0x48] ; str r2,[r0,#0x4c] ; str r2,[r0,#0x50]
 *     sub r1,r2,#1 ; str r1,[r0,#0x58]
 *     str r2,[r0,#0x54] ; str r1,[r0,#0xc] ; str r2,[r0,#0x1c]
 *     mov r1,#7 ; str r1,[r0,#0x10] ; str r1,[r0,#0x14]
 *     str r2,[r0,#0x68]
 *     bx lr
 */

struct S022b2fbc {
    int f00;  /* 0x00 */ int f04;  /* 0x04 */ int f08;  /* 0x08 */ int f0c;  /* 0x0c */
    int f10;  /* 0x10 */ int f14;  /* 0x14 */ int f18;  /* 0x18 */ int f1c;  /* 0x1c */
    int f20;  /* 0x20 */ int f24;  /* 0x24 */ int f28;  /* 0x28 */ int f2c;  /* 0x2c */
    int f30;  /* 0x30 */ int f34;  /* 0x34 */ int f38;  /* 0x38 */ int f3c;  /* 0x3c */
    int f40;  /* 0x40 */ int f44;  /* 0x44 */ int f48;  /* 0x48 */ int f4c;  /* 0x4c */
    int f50;  /* 0x50 */ int f54;  /* 0x54 */ int f58;  /* 0x58 */ int f5c;  /* 0x5c */
    int f60;  /* 0x60 */ int f64;  /* 0x64 */ int f68;  /* 0x68 */
};

void func_ov002_022b2fbc(struct S022b2fbc *p) {
    p->f00 = 1;
    p->f04 = 0;
    p->f60 = 0;
    p->f08 = 0;
    p->f24 = 0;
    p->f28 = 0;
    p->f3c = 0;
    p->f40 = 0;
    p->f34 = 0;
    p->f38 = 0;
    p->f44 = 0;
    p->f48 = 0;
    p->f4c = 0;
    p->f50 = 0;
    p->f58 = -1;
    p->f54 = 0;
    p->f0c = -1;
    p->f1c = 0;
    p->f10 = 7;
    p->f14 = 7;
    p->f68 = 0;
}
