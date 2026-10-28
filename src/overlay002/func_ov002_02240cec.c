typedef unsigned int u32;
typedef unsigned short u16;
struct SelfDE04 { u16 id; u16 side:1; u16 rest:15; };
struct State { char pad[0x5b8]; int state; int counter; };
struct Request { char pad[0xd44]; u32 count; };
extern struct State data_ov002_022ce288;
extern struct Request data_ov002_022d016c;
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int player, int phase, int card, int arg);
extern u32 *func_ov002_021b004c(int id);
extern void func_ov002_0223de04(struct SelfDE04 *self, int arg1, int arg2, int arg3);
int func_ov002_02240cec(struct SelfDE04 *self) {
    int phase = 0;
    u32 i;
    struct Bits { u32 low:13; u32 side:1; u32 gap:8; u32 slot:8; u32 rest:2; } *value;
    switch (self->id) {
    case 0x12ed: case 0x1480: phase = 2; break;
    case 0x12f9: case 0x1996: phase = 5; break;
    case 0x1515: case 0x1b44: phase = 1; break;
    case 0x183c: phase = 3; break;
    }
    switch (data_ov002_022ce288.state) {
    case 0:
        if (func_ov002_022536e8(self->side, self->id, 0) == 0) return 1;
        data_ov002_022d016c.count = 1;
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        if (data_ov002_022d016c.count == 0) return 1;
        data_ov002_022ce288.counter = 0;
        func_ov002_021ae400(self->side, 0x56);
        data_ov002_022ce288.state++;
        return 0;
    case 2:
        func_ov002_021af9d0(self->side, (phase < 32 ? phase : 32) + 0x27, self->id, 0);
        data_ov002_022ce288.state++;
        return 0;
    case 3:
        for (i = 0; i < data_ov002_022d016c.count; i++) {
            value = (struct Bits *)func_ov002_021b004c(i + 1);
            func_ov002_0223de04(self, value->side, 14, value->slot * 2 + value->side);
        }
        return 1;
    }
    return 1;
}


