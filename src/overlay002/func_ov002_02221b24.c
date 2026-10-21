typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 id; u16 side:1; u16 rest:15; u16 f4; u16 low:8; u16 count:8; u16 masks[2]; u16 cost; u16 saved; };
struct State { char pad[0x5a8]; int state; int count; };
struct Request { char pad[0xd70]; int side; int base; int offset; };
struct Entry { u16 id:13; u16 rest:3; u16 extra; };
struct Node0223def4 { char pad[8]; u16 arr8[5]; u16 f18; };
typedef struct { u16 w0; u16 bit0:1; u16 pad1:13; u16 bit14:1; u16 pad15:1; } S021ff3bc;
struct Self0220e650;
extern struct State data_ov002_022ce288;
extern struct Request data_ov002_022d016c;
extern struct Entry data_ov002_022d0250[];
extern unsigned int func_0202b8a8(int id);
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021b947c(int key);
extern int func_ov002_021c33e4(int a, int b, int c);
/* Original supplies two arguments to this four-argument thunk. */
extern int func_ov002_021c84e0();
/* Original supplies one argument to this four-argument thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021d873c(int arg0, int arg1);
extern int func_ov002_021de8fc(int a, int b, int c);
extern int func_ov002_021e7584(void *arg0, int arg1, int arg2);
extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);
extern int func_ov002_0220e650(struct Self0220e650 *self);
extern int func_ov002_0223def4(struct Node0223def4 *self, int idx);
extern int func_ov002_022577dc(void *self);
/* Original supplies two arguments to this four-argument thunk. */
extern int func_ov002_02257878();
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
int func_ov002_02221b24(struct Self *self, int unused1) {
    int key;
    int side;
    int slot;
    int packed;
    unsigned int kind;
    unsigned int index;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_021ca2b8(self->side) == 0) return 0;
        if (self->count == 1) {
            key = func_ov002_0223def4((struct Node0223def4 *)self, 0);
            packed = func_ov002_021b947c(key);
            kind = ((u16)packed >> 8) & 0xff;
            index = (u16)((u32)packed >> 16);
            if (kind == 0xe && func_ov002_021c33e4(self->side, self->side, index) != 0) {
                self->cost = func_0202b8a8(data_ov002_022d0250[key].id);
                self->saved = self->masks[0];
                if (func_ov002_022577dc(self) != 0) return 0x7f;
            }
        }
        return 0;
    case 0x7f:
        self->masks[1] = 0;
        self->masks[0] = 0;
        func_ov002_021ae400(self->side, 0x46);
        return 0x7e;
    case 0x7e:
        if (func_ov002_02257878(self, func_ov002_021e7584) == 0) return 0x7c;
        func_ov002_0225935c(self->side, self->id, (int)func_ov002_021e7584);
        return 0x7d;
    case 0x7d:
        if (func_ov002_022593f4() != 0) {
            side = data_ov002_022d016c.side;
            slot = data_ov002_022d016c.base + data_ov002_022d016c.offset;
            self->masks[side] |= 1 << slot;
            self->cost -= func_ov002_021c84e0(side, slot);
            func_ov002_021d873c(side, slot);
            if (--data_ov002_022ce288.count != 0) return 0x7e;
            return 0x7c;
        }
        return 0x7e;
    case 0x7c:
        func_ov002_021de8fc((int)self, self->masks[0] | (self->masks[1] << 16), 0);
        return 0x7b;
    case 0x7b:
        if (func_ov002_021ff3bc((S021ff3bc *)self, unused1) != 0) {
            self->masks[0] = self->saved;
            func_ov002_0220e650((struct Self0220e650 *)self);
        }
        break;
    }
    return 0;
}
