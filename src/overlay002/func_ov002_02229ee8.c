typedef unsigned short u16;
typedef unsigned int u32;
struct Context { u16 f0; u16 bit0:1; u16 rest:15; u16 f4; u16 f6; u16 flags; };
struct State { char pad[0x5a8]; int state; int f5ac; int index; };
struct Request { char pad[0xd78]; int result; };
struct Row { char pad[0xc]; u32 count; char pad2[0x110]; int cards[0x1d2]; };
extern struct State data_ov002_022ce288;
extern struct Request data_ov002_022d016c;
extern struct Row data_ov002_022cf16c;
extern char data_ov002_022cf178[];
extern int data_ov002_022cd744[];
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021bc618(int arg0);
/* Original supplies only player; the thunk's other parameters are unused here. */
extern int func_ov002_021ca2b8();
/* These functions ignore their nominal argument; original passes none. */
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern int func_ov002_02229dcc(int player, int kind, int index);
extern void func_ov002_022592ec(int arg0);
extern int func_ov002_022593f4(void);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
extern void func_ov002_02290500(int player, int card, int (*callback)(int,int,int));
int func_ov002_02229ee8(struct Context *self) {
    u32 i;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_021ca2b8(self->bit0) == 0) return 0;
        if (func_ov002_021bc618(self->bit0) != 0) {
            i = 0;
            if (i < *(u32 *)(data_ov002_022cf178 + (self->bit0 & 1) * 0x868)) do {
                if (func_ov002_02229dcc(self->bit0, 0xb, i) != 0) {
                    func_ov002_021ae400(self->bit0, 0x11e);
                    func_ov002_021e2b3c();
                    return 0x7f;
                }
                i++;
            } while (i < *(u32 *)((char *)&data_ov002_022cf16c + (self->bit0 & 1) * 0x868 + 0xc));
        }
        func_ov002_021ae400(self->bit0, 0x122);
        return 0;
    case 0x7f:
        if (func_ov002_021bc618(self->bit0) != 0) {
            i = 0;
            if (i < *(u32 *)(data_ov002_022cf178 + (self->bit0 & 1) * 0x868)) do {
                if (func_ov002_02229dcc(self->bit0, 0xb, i) != 0) {
                    if (data_ov002_022cd744[self->bit0] == 1)
                        func_ov002_02290500(self->bit0, self->f0, func_ov002_02229dcc);
                    else
                        func_ov002_022592ec((int)func_ov002_02229dcc);
                    return 0x7e;
                }
                i++;
            } while (i < *(u32 *)((char *)&data_ov002_022cf16c + (self->bit0 & 1) * 0x868 + 0xc));
        }
        return 0x7c;
    case 0x7e:
        if (func_ov002_022593f4() == 0) return 0x7c;
        data_ov002_022ce288.index = data_ov002_022d016c.result;
        return 0x7d;
    case 0x7d: {
        struct Row *row = (struct Row *)((char *)&data_ov002_022cf16c + (self->bit0 & 1) * 0x868);
        switch ((unsigned)(row->cards[data_ov002_022ce288.index] << 19) >> 19) {
        case 0x1531: self->flags |= 1; break;
        case 0x161e: self->flags |= 2; break;
        case 0x1656: self->flags |= 4; break;
        case 0x1685: self->flags |= 8; break;
        case 0x1686: self->flags |= 0x10; break;
        }
        func_ov002_0227adb8(self->bit0, (int)((char *)&data_ov002_022cf16c + (self->bit0 & 1) * 0x868 + 0x120 + data_ov002_022ce288.index * 4), 1, 0);
        return 0x7f;
    }
    case 0x7c:
        func_ov002_021e2c5c();
        return 0;
    }
    return 0;
}









