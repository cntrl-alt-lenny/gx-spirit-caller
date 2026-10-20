typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u32 id:13; u32 flag:1; u32 rest:8; u32 value:8; u32 tail:2; } Card;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1ac[];
extern char data_ov002_022d016c[];
extern int func_ov002_021b9e00(int arg0, int arg1);
extern int func_ov002_021b9ecc(int a, int b);
extern int func_020310d8(int x);
extern int func_ov002_021baca8(int a0, int a1, int a2);
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
void func_ov002_021d91e0(int a, int b, int c) {
    int v = func_ov002_021b9e00(a,b);
    int limit = func_020310d8(func_ov002_021b9ecc(a,b));
    if (limit == 0) return;
    if (c > 0) {
        int off = (a & 1) * 0x868;
        int row = b * 0x14;
        if ((*(u32 *)(data_ov002_022cf1ac + off + row) >> 6) & 1) return;
        if (v < limit) {
            func_ov002_021d479c((u16)((a ? 0x8000 : 0) | 0x3c), (u16)b, (short)c, 0);
        }
        if (func_ov002_021baca8(a,b,0x1817) && v < 5 && v + c >= 5) {
            func_ov002_021d59cc(a,b,0x181a,(u16)(((unsigned char)((*(int *)(data_ov002_022d016c + 0xcec) == a) + 1) << 4) | 2),0);
        }
        if (func_ov002_021baca8(a,b,0x16de) && v < 4 && v + c >= 4) {
            Card *p = (Card *)(data_ov002_022cf16c + off + 0x30 + row);
            u32 sign = ((u32)a << 31) & 0x80000000;
            u16 id = p->id;
            u16 power = p->value * 2 + p->flag;
            sign |= 0x200000;
            sign |= ((u32)b << 16) & 0x1f0000;
            sign |= id;
            func_ov002_021e30b4(sign, power, 0);
        }
    } else if (v > 0) {
        func_ov002_021d479c((u16)((a ? 0x8000 : 0) | 0x3c), (u16)b, (short)c, 0);
    }
}



