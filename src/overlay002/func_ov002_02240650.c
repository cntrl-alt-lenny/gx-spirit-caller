typedef unsigned short u16;
typedef unsigned int u32;
struct S0223f684 { u16 f0; u16 bit0:1; u16 b1_13:13; u16 bit14:1; u16 b15:1; };
struct Command {
    u16 id;
    u16 side:1; u16 slot:5; u16 pad1:10;
    u16 pad2:6; u16 value:9; u16 pad3:1;
};
struct Slot { u32 id:13; u32 flag:1; u32 pad:8; u32 value:8; u32 pad2:2; char rest[16]; };
extern char data_ov002_022cf16c[];
extern int func_ov002_0223f684(struct S0223f684 *self, int arg1);
int func_ov002_02240650(struct S0223f684 *self, int arg1) {
    struct Command *cmd = (struct Command *)self;
    struct Slot *slot = &((struct Slot *)(data_ov002_022cf16c + (cmd->side & 1) * 0x868 + 0x30))[cmd->slot];
    if (cmd->value != (slot->value * 2 + slot->flag)) return 1;
    return func_ov002_0223f684(self, arg1);
}
