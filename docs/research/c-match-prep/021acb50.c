/* CAMPAIGN-PREP candidate for func_021acb50 (ov005, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     straight-line VRAM/MMIO init; absolute+neg-index MMIO RMW; chan :3 bitfield; channel dispatch
 *   risk:       996B reg-alloc-walled (ships as .s by design); mwcc derives nearby MMIO addrs via sub from a live base, exact base/offset choice + 0x20 stack-buffer alloc + call scheduling will diverge
 *   confidence: low
 */
/* func_ov005_021acb50: overlay-005 boot/init. VRAM bank clears, engine
 * resets, a long run of 2D-engine MMIO RMW, a channel-dependent sound init,
 * palette uploads through a 0x20 stack buffer, then seed a state word.
 * NOTE: this function ships as hand-.s (reg-alloc-walled, brief 302); this is
 * the best clean-C reconstruction. MMIO uses absolute addresses except the two
 * BGnCNT half-word blocks, modelled as negative indices off a high base to
 * reproduce the orig's `sub rN, base, #k` address derivation. */
typedef unsigned int   u32;
typedef unsigned short u16;

extern int  func_02094504(int a, void *b, int c);
extern void func_02094550(void *a, void *b, int c);
extern void func_02001bc8(void *buf, int a, int b);
extern void func_0200592c(void);
extern void func_0208d1e4(int a);
extern void func_0208cc90(void);
extern void func_0208c8cc(int a, int b, int c);
extern void func_0208da2c(int a);
extern void func_0208d7ac(int a);
extern void func_0208d8c0(int a);
extern void func_0208d6f4(int a);
extern void func_0201d5c0(int a, int b);
extern void func_0208c940(void);
extern void func_0208c8b0(int a);
extern void func_0208d138(int a);
extern void func_0208d030(int a);
extern void func_0208d0bc(int a);
extern void func_0208cfa4(int a);
extern void func_02005bfc(void);
extern void func_02005ee0(void);
extern void func_02001d68(int a);
extern void func_0200197c(int a, int b, int c);
extern void func_020018d4(int a);
extern void func_02001b18(int a);
extern void func_0208c884(int a, int b);
extern void func_ov005_021ad060(void *a);

extern struct { int w0; unsigned chan : 3; } data_02104f4c;
extern int  data_ov005_021b1e4c[];
extern char data_ov005_021b1e6c[];
extern char data_020b4728[];

int func_ov005_021acb50(void) {
    unsigned char buf[0x20];
    volatile u16 *h;
    volatile u32 *w;

    func_02094504(0xc0, (void *)0x07000000, 0x400);
    func_02094504(0xc0, (void *)0x07000400, 0x400);
    func_02094504(0x00, (void *)0x05000000, 0x400);
    func_02094504(0x00, (void *)0x05000400, 0x400);
    func_0200592c();
    func_0208d1e4(0x1ff);
    func_02094504(0x00, (void *)0x06800000, 0xa4000);
    func_0208cc90();

    *(volatile u16 *)0x04000304 |= 0x8000;
    func_0208c8cc(1, 0, 0);
    func_0208da2c(1);
    func_0208d7ac(0x10);
    func_0208d8c0(2);
    func_0208d6f4(0x20);

    w = (volatile u32 *)0x04000000;
    *w = (*w & 0xffcfffef) | 0x10 | 0x200000;
    func_0201d5c0(4, 2);

    h = (volatile u16 *)0x0400000e;
    h[0]  = (h[0]  & 0x43) | 0x84;
    h[0]  = (h[0]  & ~3)   | 3;
    h[-1] = (h[-1] & 0x43) | 0x10c;
    h[-1] = (h[-1] & ~3)   | 2;
    w = (volatile u32 *)0x04000000;
    *w &= ~0x1f00;

    func_0208c940();
    func_0208c8b0(0);
    func_0208d138(4);
    func_0208d030(0x80);
    func_0208d0bc(8);
    func_0208cfa4(0x100);

    w = (volatile u32 *)0x04001000;
    *w = (*w & 0xffcfffef) | 0x10 | 0x200000;
    func_0201d5c0(9, 2);

    h = (volatile u16 *)0x0400100e;
    h[0]  = (h[0]  & 0x43) | 0x84;
    h[0]  = (h[0]  & ~3)   | 3;
    h[-1] = (h[-1] & 0x43) | 0x10c;
    h[-1] = (h[-1] & ~3)   | 3;
    h[-2] = (h[-2] & 0x43) | 0x204 | 0x8000;
    h[-2] = (h[-2] & ~3)   | 1;
    h[-3] = (h[-3] & 0x43) | 0x8404;
    h[-3] = (h[-3] & ~3);
    w = (volatile u32 *)((char *)h - 0xe);
    *w &= ~0x1f00;
    *w |= 0x10000;

    func_02005bfc();
    func_02005ee0();

    func_02001d68(data_02104f4c.chan);
    if (data_02104f4c.chan != 0) {
        func_02001b18(0xc);
    } else {
        int handle = data_ov005_021b1e4c[2];
        if (handle != 0)
            func_0200197c(4, handle, data_ov005_021b1e4c[3]);
        else
            func_020018d4(4);
    }

    func_02094550(data_020b4728, (void *)0x05000000, 0x20);
    func_02094550(data_020b4728, (void *)0x05000400, 0x20);

    func_02001bc8(buf, 0, 0x7fff);
    func_02094550(buf, (void *)0x05000640, 0x20);
    func_02001bc8(buf, 0x3c00, 0x7fff);
    func_02094550(buf, (void *)0x05000620, 0x20);
    func_02001bc8(buf, 0x248b, 0x563f);
    func_02094550(buf, (void *)0x05000680, 0x20);
    func_02001bc8(buf, 0x248b, 0x7f3f);
    func_02094550(buf, (void *)0x05000660, 0x20);

    func_0208c884(0x0400006c, ~0xf);
    func_0208c884(0x0400106c, ~0xf);

    *(volatile u16 *)0x04000050 = 0;
    *(volatile u16 *)0x04001050 = 0;
    func_ov005_021ad060(data_ov005_021b1e6c);

    data_ov005_021b1e4c[4] = 0;
    return 1;
}
