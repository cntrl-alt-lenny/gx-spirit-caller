typedef unsigned short u16;
typedef unsigned int u32;
struct Obj { u16 id; u16 side:1; u16 rest:15; u16 pad[2]; u16 values[4]; u16 count; };
struct Card { u32 id:13; u32 flag:1; u32 pad:8; u32 value:8; u32 tail:2; };
struct Bank { char pad0[0x10]; u32 count; char pad1[0x24c]; struct Card cards[386]; };
struct State { char pad[0x5a8]; int state; int index; };
extern struct State data_ov002_022ce288;
extern struct Bank data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern unsigned int func_0202b8a8(int id);
extern int func_0202de9c(int unused0);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021c988c(int player, int kind, int extra);
/* Original supplies only r0 to the four-argument thunk. */
extern int func_ov002_021ca2b8();
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
extern void func_ov002_021d87dc(int arg0);
/* Original supplies only r0-r2; thunk replaces r3. */
extern int func_ov002_021e13f4();
extern void func_ov002_021e2818(int player);
extern int func_ov002_021e286c(int arg0);
/* Original supplies no arguments to these unused parameters. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_0222d6cc(struct Obj *self) {
    int i;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        for (i=0; i<4; i++) {
            if (i >= data_ov002_022cf16c[self->side & 1].count) break;
            self->values[i] = data_ov002_022cf16c[self->side & 1].cards[i].value * 2 + data_ov002_022cf16c[self->side & 1].cards[i].flag;
        }
        self->count = func_ov002_021ca2b8(self->side);
        data_ov002_022ce288.index = 0;
        func_ov002_021e2b3c();
        return 0x7f;
    case 0x7f:
        i = data_ov002_022ce288.index;
        if (i == 4) return 0x64;
        if (*(int *)(data_ov002_022cf17c + (self->side & 1) * 0x868) == 0) return 0x64;
        func_ov002_021d479c((u16)((self->side ? 0x8000 : 0) | 0x57), 0xd, self->values[i], 0);
        return 0x7e;
    case 0x7e:
        if (func_ov002_021c988c(self->side, 0xd, 0) == 0) func_ov002_021e2818(self->side);
        func_ov002_021d87dc(self->side);
        if (func_0202de9c(data_ov002_022cf16c[self->side & 1].cards[0].id) == 0 && (int)func_0202b8a8(data_ov002_022cf16c[self->side & 1].cards[0].id) <= 3) {
            if (self->count != 0 && func_ov002_021bc618(self->side) != 0) {
                func_ov002_0227adb8(self->side, (int)&data_ov002_022cf16c[self->side & 1].cards[0], 1, self->id << 16);
            } else {
                func_ov002_021e13f4(self->side, 1, 0);
            }
        } else {
            if (func_ov002_021c988c(self->side, 0xd, 0) == 0) func_ov002_021e2818(self->side);
        }
        data_ov002_022ce288.index++;
        return 0x7f;
    case 0x64:
        func_ov002_021e2c5c();
        func_ov002_021e286c(self->side);
        return 0;
    default: return 0;
    }
}
