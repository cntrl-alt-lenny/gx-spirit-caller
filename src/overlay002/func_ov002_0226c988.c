typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;
extern struct { char pad[0xd70]; int player, kind, extra; char gap[0x20]; int state; } data_ov002_022d016c;
extern struct { char pad[0xa2]; u16 request; char gap[0xc]; u16 packed, result; } data_ov002_022d0e6c;
extern int data_ov002_022cd3f4[];
extern int data_ov002_022cd744[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021c9650(int player, int kind, int extra);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_0229ade0(int a, int b, int c, int d);
extern void func_ov002_02290500(int a, int b, int c);
extern int func_ov002_0226c584(int arg0, int arg1, int arg2);
extern int func_ov002_0226c5f4(u32 a, int b, int c);
extern int func_ov002_0226c6a8(int arg0, int arg1, int arg2);
extern int func_ov002_0226c708(u32 a, int b, int c);
extern int func_ov002_0226c7cc(u32 a, int b, int c);
extern int func_ov002_0226c884(int player, int a1, int a2);
extern int func_ov002_0226c930(int a, int b, int c);
int func_ov002_0226c988(int a, int b, int c)
{
    int x, y, kind, extra;
    switch (data_ov002_022d016c.state) {
    case 0:
        switch (b) {
        case 0x12dc:
            func_ov002_021ae400(a, 0x12);
            c = (int)func_ov002_0226c584;
            break;
        case 0x139c:
            data_ov002_022cd3f4[0] = 1 - a;
            data_ov002_022cd3f4[7] = data_ov002_022d0e6c.request;
            func_ov002_0229ade0(11, data_ov002_022d0e6c.request, a, -1);
            func_ov002_0229ade0(10, 0, 0, 0);
            func_ov002_021ae400(a, 0xde);
            c = (int)func_ov002_0226c930;
            break;
        case 0x142a:
        case 0x18b5:
            func_ov002_021ae400(a, 0x95);
            c = (int)func_ov002_0226c5f4;
            break;
        case 0x1516:
            c = (int)func_ov002_0226c7cc;
            break;
        case 0x151a:
            func_ov002_021ae400(a, 0x4d);
            c = (int)func_ov002_0226c6a8;
            break;
        case 0x1544:
        case 0x15f3:
            func_ov002_021ae400(a, 0x7b);
            c = (int)func_ov002_0226c6a8;
            break;
        case 0x16df:
            c = (int)func_ov002_0226c884;
            break;
        case 0x198e:
            func_ov002_021ae400(a, 0x7c);
            c = (int)func_ov002_0226c708;
            break;
        }
        if (data_ov002_022cd744[a] == 1)
            func_ov002_02290500(a, b, c);
        else
            func_ov002_022592ec(c);
        data_ov002_022d016c.state++;
        return 0;
    case 1:
        if (func_ov002_022593f4() != 0) {
            kind = data_ov002_022d016c.kind;
            extra = data_ov002_022d016c.extra;
            x = data_ov002_022d016c.player;
            y = kind + extra;
            data_ov002_022d0e6c.packed = (u8)x | ((u8)y << 8);
            data_ov002_022d0e6c.result = func_ov002_021c9650(x, kind, extra);
            data_ov002_022d016c.state++;
            return 0;
        } else {
            data_ov002_022d016c.state--;
        }
        return 0;
    default:
        return 1;
    }
}



