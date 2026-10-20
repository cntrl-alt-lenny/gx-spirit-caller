typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short pad1 : 13;
    unsigned short bit14 : 1;
    unsigned short pad15 : 1;
    unsigned char pad4[16];
    unsigned pad20 : 9;
    unsigned bit9 : 1;
    unsigned pad22 : 1;
    unsigned bit11 : 1;
    unsigned rest : 20;
} S021ff3bc;
struct Ov002287Self;
extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);
/* The original supplies an extra second argument to this one-argument helper. */
extern int func_ov002_022287c4(struct Ov002287Self *self, int arg);
extern void func_ov002_021e2b3c(int unused0);
extern void func_ov002_021e2c5c(int unused0);
extern void func_ov002_0226afb4(int arg0, int arg1);
extern void func_ov002_0226b094(int arg0, int arg1);
extern void func_ov002_021d71e0(int player, int index, int mode);
extern struct { char pad[0x5a8]; int state; } data_ov002_022ce288;
extern struct { unsigned count; char pad[0x864]; } data_ov002_022cf178[];
extern struct { char pad[0xb0]; unsigned short id; } data_ov002_022d0e6c;
int func_ov002_022344c8(S021ff3bc *self, int arg) {
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_021ff3bc(self, arg) == 0) return 0;
        func_ov002_022287c4((struct Ov002287Self *)self, arg);
        if (self->bit0 != self->bit11 && self->bit0 == self->bit9) {
            if (data_ov002_022cf178[(1 - self->bit0) & 1].count >= 2) return 0x7f;
        }
        return 0;
    case 0x7f:
        func_ov002_021e2b3c((int)self);
        func_ov002_0226b094(1 - self->bit0, self->w0);
        return 0x7e;
    case 0x7c:
    case 0x7e:
        if (data_ov002_022cf178[(1 - self->bit0) & 1].count != 0)
            func_ov002_0226afb4(1 - self->bit0, self->w0);
        return data_ov002_022ce288.state - 1;
    case 0x7b:
    case 0x7d:
        if (data_ov002_022cf178[(1 - self->bit0) & 1].count != 0)
            func_ov002_021d71e0(1 - self->bit0, data_ov002_022d0e6c.id, 0);
        return data_ov002_022ce288.state - 1;
    case 0x7a:
        func_ov002_021e2c5c((int)self);
        return 0;
    default:
        return 0;
    }
}
