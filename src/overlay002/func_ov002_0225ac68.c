typedef unsigned short u16;
typedef struct { char pad[0xd2c]; int f_d2c, f_d30, f_d34; } Control;
extern Control data_ov002_022d016c;
extern int func_ov002_0225a098(int player);
extern void func_ov002_021d5b80(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
extern int func_ov002_021b41a4(int arg0, int arg1, int arg2);
extern int func_ov002_021d5c50(int arg0, int arg1, int unused2, int unused3);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);

int func_ov002_0225ac68(int player) {
    int result;
    switch (data_ov002_022d016c.f_d30) {
    case 0:
        if (func_ov002_0225a098(player)) {
            func_ov002_021d5b80(player, 0xb, 0x16a1, 1);
            func_ov002_021ae400(player, 0x136);
            data_ov002_022d016c.f_d2c = 13;
            data_ov002_022d016c.f_d30 = 0;
            data_ov002_022d016c.f_d34 = 1;
            return 0;
        }
        func_ov002_021d479c((u16)((player ? 0x8000 : 0) | 0x18), 1, 0, 0);
        func_ov002_021d479c((u16)((player ? 0x8000 : 0) | 0xf), 0, 0, 0);
        data_ov002_022d016c.f_d30++;
    case 1:
        result = func_ov002_021b41a4(player, 0xb, 0x1a7a);
        if (result >= 0) {
            func_ov002_021d5c50(player, 0xb, 0x1a7a, result);
            func_ov002_021e30b4((((unsigned)player << 31) & 0x80000000) | 0x0a501a7a, 0, result);
            return 0;
        }
        break;
    }
    return 1;
}
