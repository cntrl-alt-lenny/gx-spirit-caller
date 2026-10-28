struct Func021ff320F2 {
    unsigned short bit0 : 1;
    unsigned short field5 : 5;
    unsigned short rest : 10;
};
struct Func021ff320Self {
    unsigned short pad0;
    struct Func021ff320F2 f2;
    unsigned short pad4 : 6;
    unsigned short value : 9;
    unsigned short rest4 : 1;
};
struct Entry {
    unsigned int pad0 : 13;
    unsigned int low : 1;
    unsigned int pad1 : 8;
    unsigned int high : 8;
    unsigned int pad2 : 2;
};
struct Flags {
    unsigned int pad : 23;
    unsigned int flag : 1;
    unsigned int rest : 8;
};
extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022cf1ac[];
extern int func_ov002_021b4054(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021ff320(struct Func021ff320Self *self, int unused1);
int func_ov002_0220736c(struct Func021ff320Self *self, int arg) {
    struct Entry *entry = (struct Entry *)(data_ov002_022cf16c + (self->f2.bit0 & 1) * 0x868 + 0x30 + self->f2.field5 * 20);
    if (self->value != entry->high * 2 + entry->low) return 0;
    if (func_ov002_021b4054(self->f2.bit0, self->f2.field5, 0x16cb, 2) != 0) return 0;
    if (((*(unsigned int *)(data_ov002_022cf1ac + (self->f2.bit0 & 1) * 0x868 + self->f2.field5 * 20) >> 23) & 1)) return 0;
    return func_ov002_021ff320(self, arg);
}

