typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 id; u16 player:1; u16 unused:5; u16 kind:6; u16 rest:4; u32 pad; u16 masks[2]; u16 count; } Self;
typedef struct { u32 low:13; u32 flag:1; u32 mid:8; u32 value:8; u32 high:2; u32 pad[4]; } Entry;
typedef struct { char pad[0x30]; Entry entries[1]; } Table;
extern char data_ov002_022cf16c[];
extern struct { char pad[0x5b4]; int state; } data_ov002_022ce288;
extern struct { char pad[0xd70]; int player, a, b; } data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021deb84(int arg0, int arg1);
extern int func_ov002_021e7584(void *arg0, int arg1, int arg2);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern int func_ov002_0229ade0(int a, int b, int c, int d);
int func_ov002_021faf44(Self *self) {
    int count = 2;
    int player, a, b;
    Table *table;
    Entry *entry;
    if (self->kind == 0x23) return 1;
    if (self->id == 0x195c) count = 3;
    switch (data_ov002_022ce288.state) {
    case 0:
        self->masks[1] = 0;
        self->masks[0] = 0;
        self->count = 0;
        func_ov002_021ae400(self->player, 0x12);
        data_ov002_022ce288.state++;
        return 0;
    case 1:
        func_ov002_0225935c(self->player, 1, (int)func_ov002_021e7584);
        data_ov002_022ce288.state++;
        return 0;
    case 2:
        if (func_ov002_022593f4()) {
            player = data_ov002_022d016c.player;
            a = data_ov002_022d016c.a;
            b = data_ov002_022d016c.b;
            table = (Table *)(data_ov002_022cf16c + (player & 1) * 0x868);
            self->masks[player] |= 1 << (a + b);
            entry = &table->entries[a + b];
            func_ov002_0229ade0(0x28, player, a + b, entry->value * 2 + entry->flag);
            self->count++;
            if (self->count < count) {
                data_ov002_022ce288.state--;
                return 0;
            }
            func_ov002_021deb84(self->player, self->masks[0] | (self->masks[1] << 16));
            return 1;
        } else {
            data_ov002_022ce288.state = 0;
            func_ov002_0229ade0(0x29, 0, 0, 0);
            return 0;
        }
    }
    return 0;
}
