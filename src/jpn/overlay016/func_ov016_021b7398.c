/* func_ov016_021b7398: redraw a card's stat panel — set its palette/name, then
 * draw the level (60cc) and the three 0..99 stat numbers (5fb0) at fixed VRAM
 * cells. arg0 is unused (the panel object is arg1). */
#include "ov016_core.h"
extern char data_02104e6c[];
extern void func_02001d48(int a);
extern void func_020aad04(int a, void *b);
extern void func_ov016_021b5f78(int a, int b, int c, int d);
extern void func_ov016_021b5e5c(int dst, int val);
void func_ov016_021b7398(int a0, void *a1, int a2, int a3, int a4) {
    char *p = a1;
    int v;
    unsigned c;
    func_02001d48(*(unsigned char *)(p + 16));
    func_020aad04(a4, p + 17);
    func_ov016_021b5f78((unsigned short)(a2 * 12 + 636), a3, a4, 1280);
    func_02001d48((unsigned)(*(int *)(data_02104e6c + 4) << 29) >> 29);
    c = *(unsigned char *)(p + 80); if (c > 99) c = 99;
    v = a2 * 3;
    func_ov016_021b5e5c(((v + 732) << 7) + 0x6600000, c);
    c = *(unsigned char *)(p + 81); if (c > 99) c = 99;
    func_ov016_021b5e5c(((v + 733) << 7) + 0x6600000, c);
    c = *(unsigned char *)(p + 82); if (c > 99) c = 99;
    func_ov016_021b5e5c(((v + 734) << 7) + 0x6600000, c);
}
