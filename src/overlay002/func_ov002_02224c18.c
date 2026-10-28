typedef unsigned short u16;
typedef unsigned char u8;
typedef unsigned int u32;
struct Ov002Self { u16 f0; u16 bit0:1; u16 field5:5; u16 rest:10; };
struct Flags { u32 bit0:1; u32 bit1:1; u32 rest:30; };
struct State { char pad[0xd0]; u32 flags; };
struct Context { int player; char pad[0x18]; int index; };
struct Slot { u32 value:13; u32 rest:19; };
extern struct State data_ov002_022d016c;
extern struct Context data_ov002_022cd3f4;
extern char data_ov002_022cf16c[];
extern int func_ov002_02257594(void *arg0, int arg1);
extern int func_ov002_021d5a08(struct Ov002Self *arg0, int arg1, int arg2, int arg3, u16 arg4, u16 arg5);
int func_ov002_02224c18(struct Ov002Self *self, int arg1) {
    if ((data_ov002_022d016c.flags & 1)) return 0;
    if (!((data_ov002_022d016c.flags >> 1) & 1)) return 0;
    if (func_ov002_02257594(self, arg1) != 2) return 0;
    if (((struct Slot *)(data_ov002_022cf16c + (data_ov002_022cd3f4.player & 1) * 0x868 + data_ov002_022cd3f4.index * 0x14 + 0x30))->value) {
        func_ov002_021d5a08(self, data_ov002_022cd3f4.player, data_ov002_022cd3f4.index, (u16)((u8)self->bit0 | ((u8)self->field5 << 8)), 8, 0);
    }
    return 0;
}

