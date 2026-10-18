extern int func_ov002_021ff46c(void *self, int arg);

struct F0220d7c0_Self {
    unsigned short pad0;
    unsigned short a : 1;
    unsigned short b : 5;
    unsigned short type : 6;
    unsigned short c : 4;
    unsigned char pad4[0x10];
    unsigned int w0 : 9;
    unsigned int bit : 1;
};

int func_ov002_0220d7c0(struct F0220d7c0_Self *self, int arg) {
    if (self->type == 8) {
        if (self->bit == self->a) return 0;
        return func_ov002_021ff46c(self, arg);
    }
    return 0;
}
