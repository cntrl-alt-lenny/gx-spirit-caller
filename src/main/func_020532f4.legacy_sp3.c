extern void func_020945f4(void *dst, int value, unsigned int size);
extern void func_02053230(void *self);
extern void func_02053600(void *self, int flags);
extern void func_020a67cc(unsigned int *table, unsigned int poly);
extern int func_020a66e8(int a, int b, int c);

struct F020532f4 {
    unsigned int size;
    unsigned int state[3];
    unsigned int other[3];
    int count;
    unsigned int flags;
    int value;
    unsigned int reserved[5];
    int crc;
};

void func_020532f4(struct F020532f4 *self, int value) {
    unsigned int table[256];
    func_020945f4(self, 0, 0x40);
    self->size = 0x40;
    self->count = 0;
    self->value = value;
    func_02053230(self->state);
    func_02053600(self->other, 0);
    func_020a67cc(table, 0xedb88320);
    self->crc = func_020a66e8((int)table, (int)self, 0x3c);
    self->flags |= 1;
}
