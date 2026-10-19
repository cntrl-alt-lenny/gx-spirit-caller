typedef unsigned short u16;
typedef unsigned int u32;
struct S0223dad0 {
    u16 id;
    u16 side:1;
    u16 index:5;
    u16 rest2:10;
    u16 low4:6;
    u16 value:9;
    u16 high4:1;
    unsigned char lo:8;
    unsigned char hi:8;
    u16 arr[1];
};
struct GState { char pad[0x5b8]; int state; };
struct Entry { u32 low:13; u32 bit:1; u32 mid:8; u32 upper:8; u32 high:2; char pad[0x10]; };
struct GSide { char pad[0x30]; struct Entry entries[16]; char tail[0x6f8]; };
struct GValue { char pad[0xb2]; u16 value; };
extern struct GState data_ov002_022ce288;
extern struct GSide data_ov002_022cf16c[];
extern struct GValue data_ov002_022d0e6c;
extern int func_ov002_021d90c0(int flag, int arg1, int arg2);
extern void func_ov002_0223dad0(struct S0223dad0 *self, unsigned short val);
extern void func_ov002_0226b0b0(int arg0, int arg1, int arg2);
extern void func_ov002_0226b0f0(int arg0, int arg1, int arg2, int arg3);
int func_ov002_022437b4(struct S0223dad0 *self) {
    switch (data_ov002_022ce288.state) {
    case 0:
        if (self->value != data_ov002_022cf16c[self->side & 1].entries[self->index].upper * 2 + data_ov002_022cf16c[self->side & 1].entries[self->index].bit)
            return 1;
        func_ov002_0226b0f0(self->side, self->id, 1, 0xff);
        data_ov002_022ce288.state++;
        return 0;
    case 1: {
        u16 value = data_ov002_022d0e6c.value;
        func_ov002_021d90c0(self->side, self->index, value);
        func_ov002_0223dad0(self, value);
        func_ov002_0226b0b0(1 - self->side, 0x171f, value);
        data_ov002_022ce288.state++;
        return 0;
    }
    }
    return 1;
}

