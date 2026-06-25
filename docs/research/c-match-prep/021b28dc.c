/* CAMPAIGN-PREP candidate for func_021b28dc (ov019, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     COMMUTATIVE operand-order pack + stack-struct + tail copy
 *   risk:       and/lsl-lsr pack may emit `and`+`lsl` instead of bitfield shifts; reg-alloc of ip/lr temps may flip
 *   confidence: low
 */
/* func_ov019_021b28dc: build a packed 6-byte OAM-ish descriptor on the stack
 * (word at +0, halfword at +4) from the args, hand it to func_02005dac, then
 * DMA-copy the 6 bytes via func_020944a4(dst=&local, src=ret, len=6).
 *
 *   add r1,r1,#2 ; sub lr,r0,#0xd ; and ip,r1,#0xff ; add r0,r3,#0x3a8
 *   orr r0,r0,r2,lsl#0xa ; orr r2,r0,r1,lsl#0xc        (-> strh [sp,#4])
 *   mov r1,lr,lsl#0x17 ; orr r0,ip,#0x40000000 ; orr r3,r0,r1,lsr#7 (-> str [sp])
 */

typedef unsigned int   u32;
typedef unsigned short u16;

extern int  func_02005dac(int a0, int a1, void *desc);
extern void func_020944a4(void *dst, int src, int len);

void func_ov019_021b28dc(int a0, int a1, int a2, int a3, int a4) {
    u32 lo;
    u16 hi;
    int ret;

    a1 = a1 + 2;
    hi = (a3 + 0x3a8) | (a2 << 0xa) | (a4 << 0xc);
    lo = (a1 & 0xff) | 0x40000000u | (((u32)((a0 - 0xd) << 0x17)) >> 7);

    {
        struct { u32 w; u16 h; } local;
        local.w = lo;
        local.h = hi;
        ret = func_02005dac(2, 0, &local);
        func_020944a4(&local, ret, 6);
    }
}
