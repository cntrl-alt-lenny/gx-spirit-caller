typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 id; u16 side:1; u16 index:5; u16 rest:10; u16 pad4:6; u16 card:9; u16 pad5:1; u16 pad6; u16 masks[2]; u16 count; };
struct Slot { u32 id:13; u32 flag:1; u32 pad:8; u32 sub:8; u32 end:2; char rest[16]; };
struct Player { char pad[0x30]; struct Slot slots[5]; char tail[0x7d4]; };
struct State { char pad[0x5a8]; int state; int remaining; };
struct Command { char pad[0xd70]; int side; int row; int column; };
extern struct State data_ov002_022ce288;
extern struct Player data_ov002_022cf16c[];
struct Counter { u16 value; char pad[18]; };
struct Counts { struct Counter entries[5]; char pad[0x804]; };
extern struct Counts data_ov002_022cf1a4[];
extern struct Command data_ov002_022d016c;
extern int func_0202eac8(int id);
extern int func_0202f578(void *self);
extern int func_ov002_021bc000(int player, int (*fn)(int));
extern int func_ov002_021b422c(int arg0, int arg1);
extern int func_ov002_021bb950(int self, int arg2);
extern int func_ov002_022577dc(void *self);
/* The original omits the thunk's unused third and fourth arguments. */
extern int func_ov002_02257878();
extern int func_ov002_021e7584(void *arg0, int arg1, int arg2);
extern void func_ov002_0225935c(int arg0, int arg1, int arg2);
extern int func_ov002_022593f4(void);
extern int func_ov002_021d873c(int arg0, int arg1);
extern int func_ov002_021de408(int a, int b);
extern void func_ov002_0229cf10(char *dst, const char *fmt, int val);
extern void func_ov002_021ae400(int a, int b);
int func_ov002_022321e0(struct Self *self) {
    char buffer[256];
    int count, mode, id;
    id = self->id;
    count = 0;
    mode = 1;
    int n;
    switch (id) {
    case 0x18e0: count = self->count; break;
    case 0x1a11: count = func_ov002_021bc000(self->side, func_0202eac8); break;
    case 0x1a28: count = func_ov002_021b422c(self->card, id); mode = 0; break;
    case 0x1a9f:
        count = func_ov002_021bb950(0, id);
        count += func_ov002_021bb950(1, id);
        break;
    case 0x1a80: {
        int index, offset;
        int side;
        n = func_ov002_021bc000(self->side, (int (*)(int))func_0202f578);
        side = self->side;
        offset = 0x868 * (side & 1);
        index = self->index * 20;
        count = n;
        if (data_ov002_022cf16c[self->side & 1].slots[self->index].sub * 2 + data_ov002_022cf16c[self->side & 1].slots[self->index].flag == self->card) {
            if (data_ov002_022cf1a4[self->side & 1].entries[self->index].value) count--;
        }
        mode = 0;
        break;
    }
    }
    switch (data_ov002_022ce288.state) {
    case 0x80:
        self->masks[1] = 0;
        self->masks[0] = 0;
        if (count <= 0) return 0;
        data_ov002_022ce288.remaining = count;
        n = func_ov002_022577dc(self);
        if (n == 0) return 0;
        if (mode && n < data_ov002_022ce288.remaining) return 0;
        if (mode) {
            func_ov002_0229cf10(buffer, (const char *)0x71, data_ov002_022ce288.remaining);
            func_ov002_021ae400(self->side, (int)buffer);
        } else {
            func_ov002_021ae400(self->side, 0x119);
        }
        return 0x7f;
    case 0x7f:
        if (func_ov002_02257878(self, func_ov002_021e7584) == 0) return 0x7c;
        func_ov002_0225935c(self->side, self->id, (int)func_ov002_021e7584);
        return 0x7d;
    case 0x7d:
        if (func_ov002_022593f4()) {
            int side = data_ov002_022d016c.side;
            int bit = data_ov002_022d016c.row + data_ov002_022d016c.column;
            self->masks[side] |= 1 << bit;
            func_ov002_021d873c(side, bit);
            if (--data_ov002_022ce288.remaining) return 0x7f;
            return 0x7c;
        }
        if (!mode && count != data_ov002_022ce288.remaining) return 0x7c;
        return 0x7f;
    case 0x7c:
        func_ov002_021de408((int)self, self->masks[0] | self->masks[1] << 16);
        return 0;
    }
    return 0;
}








