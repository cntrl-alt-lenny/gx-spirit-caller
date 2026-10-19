typedef unsigned short u16;
typedef unsigned char u8;
typedef struct {
    u16 f_0;
    u16 bit0:1;
    u16 index:5;
    u16 pad1:6;
    u16 hibits:2;
    u16 pad2:2;
} Self;
typedef Self Card021c1e44;
struct node { char pad[8]; u16 arr8[5]; u16 f18; };
struct State { char pad[0x5b8]; int state; };
struct Entry { unsigned int id:13; unsigned int rest:19; char pad[0x10]; };
struct Side { char pad[0x30]; struct Entry entries[16]; char tail[0x6f8]; };
extern struct State data_ov002_022ce288;
extern struct Side data_ov002_022cf16c[];
extern int func_0202e2f8(int unused0);
extern int func_ov002_021b90a8(int arg0, int arg1);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021d90c0(int flag, int arg1, int arg2);
extern void func_ov002_021deb28(int a, int b);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0223fb48(Self *self, int arg1);
static inline int high_byte(int packed) {
    return (u8)((u16)packed >> 8);
}
int func_ov002_022439b4(Self *self, int arg1) {
    int i;
    int count;
    int offset;
    int index;
    u16 value;
    if (data_ov002_022ce288.state != 10) {
        if (func_ov002_0223fb48(self, arg1) != 0)
            data_ov002_022ce288.state = 10;
        return 0;
    }
    index = high_byte(func_ov002_0223de94((struct node *)self, 0));
    count = 0;
    for (i = 0, offset = 0; i <= 4; i++, offset += 0x14) {
        int id = ((struct Entry *)((char *)data_ov002_022cf16c[self->bit0 & 1].entries + offset))->id;
        if (i != index && id != 0 && func_0202e2f8(id) == 0 &&
            func_ov002_021b90a8(self->bit0, i) != 0 &&
            func_ov002_021c1e44(self, self->bit0, i) == 0) {
            func_ov002_021deb28(self->bit0, i);
            count++;
        }
    }
    func_ov002_021d90c0(self->bit0, self->index, count);
    return 1;
}





