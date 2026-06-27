/* CAMPAIGN-PREP candidate for func_0202d3c4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: same bic#0xf;orr insert + ordered stores as d2dc; swapped sp slots (build@sp+0, scratch@sp+0x28)
 *   risk:       the two stack regions are swapped vs d2dc (struct at sp+0, marshal buffer at sp+0x28) so frame-slot assignment must mirror that; store order strh f14/str f8/str fc/strh f10 must hold. Offsets struct-guessed; reorder risk is reshape-able (declare/store order) but slot placement is permuter-adjacent.
 *   confidence: low
 */
// func_0202d3c4 — sibling of 0202d2dc: guard at [g+0x1c]==arg0 (no +0x16), different tables, mask 0x40/0x20e0, base 0xe0.
extern struct { unsigned char _p[0x1c]; int f1c; unsigned char _q[0x4c]; int f6c; } data_0219ad48;  // _LIT0
extern int data_020be9c4[];   // _LIT1
extern unsigned char data_020c6d10[];  // _LIT2
extern void func_02091554(void *dst, int a, void *b);
extern void func_0201d47c(void *p);
extern int  func_02006c0c(void *p, int a, int b);
extern void func_0201e5b8(void *p);
extern void func_02006e1c(int h);
extern int  func_0201d530(int x);
extern void func_02094504(int a, int b, int c);

struct WinBuild2 {
    int handle;        // [sp+0]
    int f4;
    int f8;            // str r3 (-1)
    int fc;            // str r2 (0x20e0)
    unsigned short f10;// strh 0x40
    unsigned short _p12;
    unsigned short f14;// bitfield insert (f14 & ~0xf)|(g.f6c & 0xf)
    unsigned char _rest[0x14];   // scratch passed at sp+0x28
};

void func_0202d3c4(int arg0)
{
    if (data_0219ad48.f1c == arg0) {
        return;
    }
    data_0219ad48.f1c = arg0;
    if (arg0 != 0) {
        struct WinBuild2 wb;
        func_02091554(&wb._rest[0], data_020be9c4[arg0 - 1], (void *)data_020c6d10);
        func_0201d47c(&wb.handle);
        wb.handle = func_02006c0c(&wb._rest[0], 4, 0);
        wb.f14 = (unsigned short)((wb.f14 & ~0xf) | ((unsigned short)data_0219ad48.f6c & 0xf));
        wb.f8 = -1;
        wb.fc = 0x20e0;
        wb.f10 = 0x40;
        func_0201e5b8(&wb.handle);
        func_02006e1c(wb.handle);
        return;
    }
    {
        int y = func_0201d530(data_0219ad48.f6c) + 0xe0;
        func_02094504(0, y + 0x2000, 0x80);
    }
}
