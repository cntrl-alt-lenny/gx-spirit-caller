typedef unsigned short u16;
struct SelfDE04;
struct SelfDE04 {
    u16 f0;
    u16 side : 1;
    u16 rest : 15;
};
struct State { char pad[0x5b8]; int phase; };
struct Data { char pad[0xb2]; u16 value; };
extern struct State data_ov002_022ce288;
extern struct Data data_ov002_022d0e6c;
extern int func_ov002_022536e8(int self, int arg1, int arg2);
extern int func_ov002_0226b194(int arg0, int arg1, int arg2);
extern void func_ov002_0223de04(struct SelfDE04 *self, int arg1, int arg2, int arg3);

int func_ov002_0224345c(struct SelfDE04 *self) {
    unsigned side = self->side;
    switch (data_ov002_022ce288.phase) {
    case 0:
        if (func_ov002_022536e8(side, self->f0, side) == 0) return -1;
        data_ov002_022ce288.phase++;
        return 0;
    case 1:
        func_ov002_0226b194(1 - side, self->f0, side);
        data_ov002_022ce288.phase++;
        return 0;
    case 2:
        func_ov002_0223de04(self, side, 0xe, data_ov002_022d0e6c.value);
    }
    return 1;
}

