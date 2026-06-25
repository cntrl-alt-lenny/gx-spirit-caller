/* CAMPAIGN-PREP candidate for func_0202d194 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     linear: ptr-chase, clear-call, two ordered stores
 *   risk:       the +0x24e0 may split into adds at 0x2000/0x4e0 in a different order; r1[0x6c] field type guessed
 *   confidence: med
 */
/* func_0202d194: chase a pointer out of a global, call a clear/fill
 * routine over [base+0x4e0 .. +0x24e0], then write two fields back
 * into the global in store-order (0x18 then 0x14).
 *
 *     ldr r1,_LIT0; mov r4,r0; ldr r0,[r1,#0x6c]; bl func_0201d530
 *     add r0,r0,#0x4e0; ldr r2,=0x2d20; add r1,r0,#0x2000; mov r0,#0
 *     bl func_02094504
 *     ldr r0,_LIT0; mov r1,#1; str r4,[r0,#0x18]; str r1,[r0,#0x14]
 *
 * 0x24e0 is not an ARM rotated-immediate, so base+0x24e0 splits into
 * two adds (#0x4e0 then #0x2000) naturally. arg0 (the saved r0) is
 * the value stored at +0x18; +0x14 gets 1. Global reloaded for the
 * stores (it was clobbered across the two bl's).
 */

typedef struct {
    char _pad_00[0x6c];
    void *handle;       /* +0x6c -> passed to func_0201d530 */
} G_0202d194;

extern G_0202d194 data_0219ad48;
extern unsigned char *func_0201d530(void *h);
extern void func_02094504(int val, unsigned char *end, int len);

void func_0202d194(int arg0) {
    unsigned char *base = func_0201d530(data_0219ad48.handle);

    func_02094504(0, base + 0x24e0, 0x2d20);

    *(int *)((char *)&data_0219ad48 + 0x18) = arg0;
    *(int *)((char *)&data_0219ad48 + 0x14) = 1;
}
