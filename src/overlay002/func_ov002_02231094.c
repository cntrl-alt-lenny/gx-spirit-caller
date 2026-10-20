typedef unsigned short u16;
typedef unsigned int u32;
struct Entry { u16 id; u16 player:1; u16 rest:15; u16 pad[2]; u16 index; u16 count; };
struct State { char pad[0x5a8]; int state; };
struct Data { char pad[0xd44]; int count; };
extern struct State data_ov002_022ce288;
extern struct Data data_ov002_022d016c;
extern void func_ov002_021ae400(int a, int b);
extern int func_ov002_021af9d0(int, int, int, int);
extern u32 *func_ov002_021b004c(int id);
extern int func_ov002_021bc618(int arg0);
/* Original supplies fewer arguments than these definitions' unused slots. */
extern int func_ov002_021ca2b8();
extern void func_ov002_021e2b3c();
extern void func_ov002_021e2c5c();
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int arg0);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_02231094(struct Entry *self) {
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_021ca2b8(self->player) == 0) return 0;
        if (func_ov002_021bc618(self->player) < 2) return 0;
        if (func_ov002_0225368c(self->player, self->id, 0) < 2) {
            func_ov002_021ae400(self->player, 0x15);
            return 0x6e;
        } else {
            func_ov002_021ae400(self->player, 0x11d);
            return 0x7f;
        }
    case 0x7f:
        func_ov002_021af9d0(self->player, 8, self->id, 0);
        return 0x7d;
    case 0x7d:
        self->index = 0;
        self->count = data_ov002_022d016c.count;
        func_ov002_021e2b3c();
        return 0x7c;
    case 0x7c:
        if (self->index < self->count) {
            u32 *p = func_ov002_021b004c(self->index + 1);
            func_ov002_0227adb8(self->player, (int)p, 1, self->id << 16);
            self->index++;
            return 0x7c;
        }
        func_ov002_021e2c5c();
        return 0x64;
    case 0x6e:
        func_ov002_0226b054(1 - self->player);
        return 0x64;
    case 0x64:
        func_ov002_021e286c(self->player);
        return 0;
    }
    return 0;
}
