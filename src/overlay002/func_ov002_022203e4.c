typedef unsigned short u16;
typedef struct {
    u16 id;
    u16 side : 1;
    u16 pad2 : 15;
    u16 pad4 : 2;
    u16 blocked : 1;
    u16 pad5 : 13;
} S;
typedef struct { char pad[0x5a8]; int state; } State;
typedef struct { char pad[0xb0]; u16 id; } Global;
typedef struct { char pad[0x418]; int entries[0x114]; } Player;
extern State data_ov002_022ce288;
extern Global data_ov002_022d0e6c;
extern char data_ov002_022cf16c[];
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern int func_ov002_021bc618(int arg0);
/* Original caller supplies only r0 to this four-argument thunk. */
extern int func_ov002_021ca2b8();
extern void func_ov002_0226b094(int arg0, int arg1);
extern int func_ov002_0226b174(int arg0, int arg1, int arg2);
extern int func_ov002_021b99b4(int player, int id);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_022203e4(S *p) {
    if (p->blocked) return 0;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_0225368c(1 - p->side, p->id, 0) == 0) return 0;
        if (func_ov002_021bc618(1 - p->side) == 0) return 0;
        if (func_ov002_021ca2b8(1 - p->side) == 0) return 0;
        func_ov002_0226b094(1 - p->side, p->id);
        return 0x7f;
    case 0x7f:
        if (data_ov002_022d0e6c.id == 0) return 0;
        func_ov002_0226b174(1 - p->side, p->id, 0);
        return 0x7e;
    case 0x7e:
        {
            int idx;
            int side = 1 - p->side;
            idx = func_ov002_021b99b4(side, data_ov002_022d0e6c.id);
            idx = (int)data_ov002_022cf16c + (side & 1) * 0x868 + 0x418 + idx * 4;
            func_ov002_0227adb8(side, idx, 1, 0);
            return 0x7d;
        }
    }
    return 0;
}






