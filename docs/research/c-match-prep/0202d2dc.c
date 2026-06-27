/* CAMPAIGN-PREP candidate for func_0202d2dc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bic#0xf;orr nibble insert + ordered field stores (strh,str,str,strh)
 *   risk:       store-order must stay strh f34 -> str f28(-1) -> str f2c(0x2160) -> strh f30(0x60); mwcc may reorder struct stores by offset and re-fold the bic/orr. Offsets at sp+0x20.. are inferred (struct-guessed); the guard cmp [g+0x20]==arg0+0x16 also constrains addeq epilogue. struct-guessed + reshape-able (store order).
 *   confidence: low
 */
// func_0202d2dc — guarded one-shot UI build: if cached id at [g+0x20] already equals (arg0+0x16) bail;
// else store it, and either tear down (arg0==0) or build a window struct (bitfield-insert palette nibble) + stores.
extern struct { unsigned char _p[0x20]; int f20; unsigned char _q[0x48]; int f6c; } data_0219ad48;  // _LIT0
extern int data_020be9ac[];   // _LIT1 table indexed by (arg0-1)
extern unsigned char data_020c6cf8[];  // _LIT2
extern void func_02091554(void *dst, int a, void *b);
extern void func_0201d47c(void *p);
extern int  func_02006c0c(void *p, int a, int b);
extern void func_0201e5b8(void *p);
extern void func_02006e1c(int h);
extern int  func_0201d530(int x);
extern void func_02094504(int a, int b, int c);

struct WinBuild {
    unsigned char a[0x20];
    int handle;        // [+0x20]
    int f24;
    int f28;           // str r3 (mvn 0 = -1)
    int f2c;           // str r2 (_LIT3 0x2160)
    unsigned short f30;// strh 0x60
    unsigned short _p32;
    unsigned short f34;// bitfield-insert: (f34 & ~0xf) | (g.f6c & 0xf)
};

void func_0202d2dc(int arg0)
{
    int id = arg0 + 0x16;
    if (data_0219ad48.f20 == id) {
        return;
    }
    data_0219ad48.f20 = id;
    if (arg0 != 0) {
        struct WinBuild wb;
        int param;
        func_02091554(&wb.a[0], data_020be9ac[arg0 - 1], (void *)data_020c6cf8);
        func_0201d47c(&wb.handle);
        wb.handle = func_02006c0c(&wb.a[0], 4, 0);
        wb.f34 = (unsigned short)((wb.f34 & ~0xf) | ((unsigned short)data_0219ad48.f6c & 0xf));
        wb.f28 = -1;
        wb.f2c = 0x2160;
        wb.f30 = 0x60;
        func_0201e5b8(&wb.handle);
        func_02006e1c(wb.handle);
        return;
    }
    {
        int y = func_0201d530(data_0219ad48.f6c) + 0x160;
        func_02094504(0, y + 0x2000, 0x80);
    }
}
