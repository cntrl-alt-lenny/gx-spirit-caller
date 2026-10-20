typedef unsigned short u16;
struct Self { u16 id; u16 unused; u16 pad:6; u16 value:9; u16 tail:1; };
struct SelfDE04;
struct Slot { unsigned pad:13; unsigned low:1; unsigned mid:8; unsigned high:8; unsigned end:2; };
struct State { char pad[0x5b8]; int state; int count; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];
extern char data_ov002_022cf16c[];
extern int func_ov002_021bc618(int arg0);
/* Original caller supplies only r0 to the forwarding thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern int func_ov002_0226b174(int arg0, int arg1, int arg2);
extern int func_ov002_021b99b4(int player, int id);
extern void func_ov002_0223de04(struct SelfDE04 *self, int arg1, int arg2, int arg3);
int func_ov002_022418a0(struct Self *self) {
    int player = *(int *)(data_ov002_022d016c + 0xcec) ^ data_ov002_022ce288.count;
    switch (data_ov002_022ce288.state) {
    case 0:
        data_ov002_022ce288.count = 0;
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        if (func_ov002_021bc618(player) && func_ov002_021ca2b8(player) && func_ov002_022536e8(player, self->id, self->value)) {
            func_ov002_0226b174(player, self->id, self->value);
            data_ov002_022ce288.state++;
        } else {
            data_ov002_022ce288.state += 2;
        }
        return 0;
    case 2: {
        int idx = func_ov002_021b99b4(player, *(u16 *)(data_ov002_022d0e6c + 0xb0));
        struct Slot *slots = (struct Slot *)(data_ov002_022cf16c + (player & 1) * 0x868 + 0x418);
        func_ov002_0223de04((struct SelfDE04 *)self, slots[idx].low, 0xe, slots[idx].high * 2 + slots[idx].low);
        data_ov002_022ce288.state++;
        return 0;
    }
    case 3:
        if (++data_ov002_022ce288.count >= 2) data_ov002_022ce288.state++;
        else data_ov002_022ce288.state = 1;
        return 0;
    default: return 1;
    }
}

