typedef unsigned short u16;
struct Self { char pad[10]; u16 value; };
struct Row { char pad[0x30]; unsigned int id : 13; unsigned int rest : 19; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021c84e0(int a, int b, int unused, int d);
int func_ov002_021edd4c(struct Self *self, int player, int idx) {
    int off, slot;
    if (idx >= 5) return 0;
    off = (player & 1) * 0x868;
    slot = idx * 20;
    if (((struct Row *)((int)(data_ov002_022cf16c + off) + slot))->id == 0) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + off + slot) != 0) {
        if (self->value != 0) {
            if (self->value == func_ov002_021c84e0(player, idx, idx, (int)data_ov002_022cf16c)) return 1;
        }
        return 0;
    }
    return 0;
}



