typedef unsigned short u16;
typedef unsigned int u32;
typedef unsigned char u8;
typedef struct Card {
    u16 id;
    u16 side:1; u16 slot:5; u16 kind:6; u16 pad2:4;
    u16 pad4:6; u16 value:9; u16 pad4b:1;
    u16 pad[9];
    u16 effect;
    u16 owner:1; u16 unused:15;
} Card;
typedef struct { u32 lo:13; u32 b:1; u32 mid:8; u32 a:8; u32 hi:2; char pad[16]; } Slot;
extern char data_ov002_022cf16c[];
extern int func_ov002_021b3618(int player, int idx);
extern int func_ov002_021c1d28(int a, int b, int c);
/* The original caller tests r0; the existing void definition loses this return. */
extern int func_ov002_021c229c(int a, int b, u16 c, int d, int e);
extern int func_ov002_021c8470(int a, int b);
extern int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021df818(Card *card, int side, int amount);
/* These hubs ignore their formal argument; this caller passes none. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern int func_ov002_02219f7c(Card *self, int arg1);
int func_ov002_02214394(Card *self, int arg1) {
    int player, idx;
    int pair;
    Slot *slot;
    if (self->kind == 2) {
        slot = (Slot *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x30);
        if (self->value != slot[self->slot].a * 2 + slot[self->slot].b) return 0;
        func_ov002_021e2b3c();
        pair = func_ov002_021b3618(self->side, self->slot);
        player = (u8)pair;
        idx = (u8)((u16)pair >> 8);
        if (self->id == 0x1286) func_ov002_021de480(self->side, self->slot, 0, 0);
        if (func_ov002_021c229c(player, idx, self->id, self->slot, 1)) {
            if (!func_ov002_021c1d28(player, idx, player != self->side))
                func_ov002_021de480(player, idx, player != self->side, self->id);
        }
        if (self->id == 0x1286)
            func_ov002_021df818(self, 1 - self->side, func_ov002_021c8470(player, idx));
        func_ov002_021e2c5c();
        return 0;
    }
    return func_ov002_02219f7c(self, arg1);
}


