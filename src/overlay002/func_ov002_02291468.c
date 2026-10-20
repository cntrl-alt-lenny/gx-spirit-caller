struct Self { unsigned short f0; unsigned short player:1; unsigned short rest:15; };
struct Slot { unsigned int id:13; unsigned int rest:19; unsigned int f4; unsigned short active; unsigned short pad; unsigned int fc; unsigned int flags; };
struct Row { char pad[0x30]; struct Slot slots[11]; char rest[0x75c]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern int func_ov002_021bac38(int arg0, int arg1);
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_021bcf00(int a);
extern int func_ov002_021b3618(int player, int idx);
extern int func_ov002_022815a4(int id, int flag);
extern int func_ov002_022812ac(int arg0, int arg1);
int func_ov002_02291468(struct Self *self) {
    int i, v, player, score;
    struct Slot *slot;
    if (func_ov002_021bac38(self->player, 0x1366) >= 0) return 1;
    if (*(unsigned int *)(data_ov002_022d016c + 0xcf8) < 3 &&
        func_ov002_021bbf50(self->player) != 0 &&
        func_ov002_021bcf00(1 - self->player) > 0) {
        for (i = 0; i < 5; i++) {
            slot = (struct Slot *)(data_ov002_022cf16c + ((1 - self->player) & 1) * 0x868 + i * 0x14 + 0x30);
            if (slot->id != 0 && (slot->active != 0 || ((slot->flags >> 8) & 1))) {
                if (func_ov002_022815a4(slot->id, 0) != 0) return 0;
            }
        }
        player = self->player;
        score = func_ov002_022812ac(player, player);
        return score - func_ov002_022812ac(player, 1 - player) >= 4000;
    }
    v = func_ov002_021bac38(self->player, 0x137d);
    if (v >= 0) {
        v = func_ov002_021b3618(self->player, v);
        if (v == 0xffff) return 1;
        slot = &((struct Row *)data_ov002_022cf16c)[(unsigned char)v & 1].slots[(unsigned char)(v >> 8)];
        switch (slot->id) {
        case 0xfd6: case 0x11e4: return 1;
        }
    }
    return 0;
}






