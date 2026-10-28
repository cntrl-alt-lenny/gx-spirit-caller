typedef unsigned short u16;
typedef unsigned int u32;
struct Obj1074c { u16 id; u16 a:1; u16 b:13; u16 c:1; u16 d:1; };
struct State { char pad[0x5a8]; int state; u32 value; };
struct Status { char pad[0xb0]; u16 index; u16 active; };
struct Slot { u32 value; char pad[0x864]; };
extern struct State data_ov002_022ce288;
extern struct Slot data_ov002_022cf178[];
extern struct Status data_ov002_022d0e6c;
extern int func_ov002_0221074c(struct Obj1074c *self, int unused1);
extern void func_ov002_0226afb4(int arg0, int arg1);
extern void func_ov002_021d71e0(int player, int index, unsigned int flag);
int func_ov002_022316a8(struct Obj1074c *self, int arg1) {
    switch (data_ov002_022ce288.state) {
    case 0x80:
        data_ov002_022ce288.value = data_ov002_022cf178[self->a & 1].value;
        func_ov002_0221074c(self, arg1);
        return 0x7f;
    case 0x7f: {
        u32 value = data_ov002_022cf178[self->a & 1].value;
        if (value == 0) return 0;
        if (value <= data_ov002_022ce288.value) return 0;
        func_ov002_0226afb4(self->a, self->id);
        return 0x7e;
    }
    case 0x7e:
        if (data_ov002_022d0e6c.active != 0)
            func_ov002_021d71e0(self->a, data_ov002_022d0e6c.index, 0);
        return 0;
    default: return 0;
    }
}
