typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 low:13; u32 flag:1; u32 mid:8; u32 value:8; u32 high:2; } Packed;
extern struct { char pad[0xd9c]; int state; } data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern struct { char pad[0xb0]; u16 result; } data_ov002_022d0e6c;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern int func_ov002_022806a4(int a, int b, int c);
int func_ov002_0226cc0c(int a, int b, int c) {
    Packed *p;
    switch (data_ov002_022d016c.state) {
    case 0:
        if (data_ov002_022cd744[a] == 1) {
            func_ov002_022806a4(a, b, c);
            p = (Packed *)func_ov002_021afb74();
            data_ov002_022d0e6c.result = ((Packed *)func_ov002_021afb74())->value * 2 + p->flag;
            return 1;
        }
        switch (b) {
        case 0x133b:
        case 0x1488:
        case 0x1990:
            func_ov002_021ae400(a, 0xf0);
            break;
        case 0x1365:
            func_ov002_021ae400(a, 0xef);
            break;
        default:
            return 1;
        }
        data_ov002_022d016c.state++;
        return 0;
    case 1:
        func_ov002_021af9d0(a, 6, b, c);
        data_ov002_022d016c.state++;
        return 0;
    default:
        p = (Packed *)func_ov002_021afb74();
        data_ov002_022d0e6c.result = ((Packed *)func_ov002_021afb74())->value * 2 + p->flag;
        return 1;
    }
}
