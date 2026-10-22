typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { unsigned a:13; unsigned flag:1; unsigned b:8; unsigned id:8; unsigned c:2; } Flags;
typedef struct { Flags flags; int other; u16 active; char pad[10]; } Entry;
typedef struct { char pad[0x30]; Entry entry[5]; char tail[0x7d4]; } Bank;
typedef struct { u32 flags; char pad[0x864]; } Status;
extern Status data_ov002_022cf288[];
extern Bank data_ov002_022cf16c[];
extern int data_ov002_022cd744[];
extern struct State { char pad0[0xcec]; int player; char pad1[8]; u32 mode; char pad2[0x24]; u32 state; int f24; int f28; int step; int sub; int done; char pad3[0xc]; int choice; int f48; int f4c; int pending; int back; char pad4[0xc]; int reason; } data_ov002_022d016c;
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
extern int func_ov002_02299c9c(void);
extern void func_ov002_022592b8(int arg);
extern int func_ov002_02259f74(int x);
extern int func_ov002_0225a0e0(int x);
extern int func_ov002_021ae5d4(int x);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_0225a098(int player);
extern void func_ov002_02244fe4(int a, u32 b);
extern int func_ov002_022627ac(int a);
extern int func_ov002_021b9ecc(int player, int slot);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
int func_ov002_02265d24(void) {
    int i;
    int player = data_ov002_022d016c.player;
    int flag = (data_ov002_022cf288[player & 1].flags >> 24) & 1;
    int check = func_ov002_021b3ecc(player, 11, 0x13b1);
    switch (data_ov002_022d016c.state) {
    case 0:
        data_ov002_022d016c.done = 0;
        if (flag != 0) return 1;
        if (check) { data_ov002_022d016c.state = 10; return 0; }
        func_ov002_021d479c((player ? 0x8000 : 0) | 14, 0, 0, 0);
        data_ov002_022d016c.pending = 0;
        data_ov002_022d016c.state++;
        return 0;
    case 1:
        data_ov002_022d016c.state++;
    case 2:
        if (data_ov002_022cd744[player] == 1) {
            if (func_ov002_02299c9c()) data_ov002_022d016c.state = 30;
            return 0;
        }
        func_ov002_022592b8(2);
        data_ov002_022d016c.state++;
        return 0;
    case 3:
        if (data_ov002_022d016c.pending) {
            data_ov002_022d016c.back = 1;
            data_ov002_022d016c.state--;
            return 0;
        }
        switch (data_ov002_022d016c.reason - 13) {
        case 3:
            if (func_ov002_02259f74(player)) {
                data_ov002_022d016c.done = 0;
                data_ov002_022d016c.step = 0;
                data_ov002_022d016c.state = 21;
                return 0;
            }
            break;
        case 5:
            if (func_ov002_0225a0e0(player)) {
                data_ov002_022d016c.state = 30;
                return 0;
            }
            break;
        }
        {
            int a = func_ov002_0225a0e0(player) ? 32 : 0;
            int b = func_ov002_02259f74(player) ? 8 : 0;
            b |= 1 << data_ov002_022d016c.mode;
            b |= a;
            func_ov002_021ae5d4(b);
        }
        data_ov002_022d016c.state = 20;
        return 0;
    case 10:
        if (data_ov002_022cd744[player] == 1) {
            if (func_ov002_02259f74(player)) data_ov002_022d016c.choice = 3;
            else data_ov002_022d016c.choice = 5;
            data_ov002_022d016c.state = 20;
        } else {
            func_ov002_021ae400(player, 0x135);
            data_ov002_022d016c.state++;
        }
        return 0;
    case 11:
        {
            int a;
            if (!func_ov002_0225a098(player) && func_ov002_02259f74(player)) a = 8;
            else a = 0;
            { int b = func_ov002_0225a0e0(player) ? 32 : 0;
              b |= a;
              func_ov002_021ae5d4(b); }
        }
        data_ov002_022d016c.state = 20;
        return 0;
    case 20:
        switch (data_ov002_022d016c.choice) {
        case 3:
            if (func_ov002_02259f74(player)) {
                data_ov002_022d016c.done = 0;
                data_ov002_022d016c.step = 0;
                data_ov002_022d016c.state++;
                return 0;
            }
            break;
        case 5:
            data_ov002_022d016c.state = 30;
            return 0;
        }
        data_ov002_022d016c.state = 2;
        return 0;
    case 21:
        if (data_ov002_022d016c.mode == 2 || data_ov002_022d016c.mode == 4) func_ov002_02244fe4(3, 0);
        data_ov002_022d016c.state++;
        return 0;
    case 22:
        if (func_ov002_022627ac(player)) {
            if (data_ov002_022d016c.done) return 1;
            func_ov002_021d479c((player ? 0x8000 : 0) | 16, 0, 0, 0);
            data_ov002_022d016c.state = 2;
        }
        return 0;
    case 30:
        if (data_ov002_022d016c.mode == 2 || data_ov002_022d016c.mode == 4) {
            Bank *bank = &data_ov002_022cf16c[player & 1];

            for (i = 0; i <= 4; i++) {
                int id = func_ov002_021b9ecc(player, i);
                if (id == 0x1954 && bank->entry[i].active) {
                    Flags *f = &bank->entry[i].flags;
                    u32 packed = ((u32)(player << 31) & 0x80000000) | 0x600000 | (((u32)i << 16) & 0x1f0000) | (u16)id;
                    if (func_ov002_021e30b4(packed, (u16)(f->id * 2 + f->flag), 0)) return 0;
                }
            }
            func_ov002_02244fe4(4, 0);
        }
        return 1;
    }
    return 0;
}





