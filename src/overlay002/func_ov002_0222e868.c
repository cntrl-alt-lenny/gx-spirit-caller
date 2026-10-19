typedef unsigned short u16;
typedef struct { u16 value; u16 bit0:1; u16 rest:15; } Self;
struct State { char pad[0x5a8]; int state; int count; };
struct Player { char pad[0xcec]; int side; };
struct Selection { char pad[0xb0]; u16 index; };
extern struct State data_ov002_022ce288;
extern struct Player data_ov002_022d016c;
extern struct Selection data_ov002_022d0e6c;
extern int data_ov002_022cd744[];
extern char data_ov002_022cf16c[];
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern int func_ov002_021ff46c(Self *self, int unused1);
extern void func_ov002_0226afb4(int arg0, int arg1);
extern void func_ov002_0226b094(int arg0, int arg1);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_0222e868(Self *self, int unused1) {
    int side = data_ov002_022d016c.side ^ data_ov002_022ce288.count;
    switch (data_ov002_022ce288.state) {
    case 128:
        func_ov002_021e2b3c((int)self);
        data_ov002_022ce288.count = 0;
        return 127;
    case 127: {
        int saved = self->bit0;
        int result;
        self->bit0 = (u16)side;
        result = func_ov002_021ff46c(self, unused1);
        self->bit0 = (u16)saved;
        if (result == 0) return 100;
        if (data_ov002_022cd744[side] == 1)
            data_ov002_022d0e6c.index = 1;
        else
            func_ov002_0226b094(side, self->value);
        return 126;
    }
    case 126:
        if (data_ov002_022d0e6c.index == 0) return 100;
        func_ov002_0226afb4(side, self->value);
        return 125;
    case 125:
        func_ov002_0227adb8(side, (int)(data_ov002_022cf16c + (side & 1) * 0x868 + 0x120 + data_ov002_022d0e6c.index * 4), 1, self->value << 16);
        return 100;
    case 100: {
        int count = ++data_ov002_022ce288.count;
        if (count < 2) return 127;
        func_ov002_021e2c5c(count);
        return 0;
    }
    default: return 0;
    }
}
