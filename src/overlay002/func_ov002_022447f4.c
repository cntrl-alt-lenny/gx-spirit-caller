typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 id; u16 side:1; u16 pad:15; u16 x4; struct { u16 low:8; u16 high:8; } x6; char p[12]; u32 a:9; u32 b:1; u32 c:1; u32 d:1; u32 rest:20; };
struct State { char pad[0x5b8]; int state; };
struct Request { char pad[0xd44]; int ready; char pad2[0x28]; int player; int slot; int extra; };
extern struct State data_ov002_022ce288;
extern int data_ov002_022cd744[];
extern struct Request data_ov002_022d016c;
extern int func_ov002_021ae484(int x);
extern void func_ov002_0223dcc0(struct Self *self, int side, int slot);
extern int func_ov002_0223fd74(void *arg0, int arg1, int arg2);
extern int func_ov002_022577dc(void *self);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
int func_ov002_022447f4(struct Self *self) {
    switch (data_ov002_022ce288.state) {
    case 0:
        if (self->side != self->d && self->side == self->b && func_ov002_022577dc(self)) {
            if (data_ov002_022cd744[self->side] == 1) data_ov002_022d016c.ready = 1;
            else func_ov002_021ae484(0x13a);
            data_ov002_022ce288.state++;
            return 0;
        }
        return 1;
    case 1:
    case 4:
        if (!data_ov002_022d016c.ready) return 1;
        func_ov002_0225935c(self->side, self->id, (int)func_ov002_0223fd74);
        data_ov002_022ce288.state++;
        return 0;
    case 2:
    case 5:
        if (func_ov002_022593f4()) {
            func_ov002_0223dcc0(self, data_ov002_022d016c.player, data_ov002_022d016c.slot + data_ov002_022d016c.extra);
            if (func_ov002_022577dc(self) >= 2 && self->x6.high < 2) {
                data_ov002_022ce288.state++;
                return 0;
            }
            return 1;
        }
        data_ov002_022ce288.state -= 2;
        return 0;
    case 3:
        if (data_ov002_022cd744[self->side] == 1) data_ov002_022d016c.ready = 1;
        else func_ov002_021ae484(0x13b);
        data_ov002_022ce288.state++;
        return 0;
    default: return 0;
    }
}


