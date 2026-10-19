typedef unsigned short u16;
struct Self { u16 id; u16 player:1; u16 rest:15; };
struct SelfDE04;
struct Slot { unsigned pad:13; unsigned low:1; unsigned mid:8; unsigned high:8; unsigned end:2; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021c2e34(int player, int arg1);
extern void func_ov002_0223de04(struct SelfDE04 *self, int arg1, int arg2, int arg3);
int func_ov002_02241bf8(struct Self *self) {
    int ids[3];
    int i;
    int idx;
    switch (self->id) {
    case 0x138a:
        ids[0] = 0x1288;
        ids[1] = 0x129b;
        ids[2] = 0x12b8;
        break;
    case 0x18a4:
        ids[0] = 0x189e;
        ids[1] = 0x18a0;
        ids[2] = 0x189f;
        break;
    }
    for (i = 0; i < 3; i++) {
        idx = func_ov002_021c2e34(self->player, ids[i]);
        if (idx >= 0) {
            struct Slot *slots = (struct Slot *)(data_ov002_022cf16c + (self->player & 1) * 0x868 + 0x418);
            func_ov002_0223de04((struct SelfDE04 *)self, self->player, 0xe, slots[idx].high * 2 + slots[idx].low);
        } else {
            return -1;
        }
    }
    return 1;
}
