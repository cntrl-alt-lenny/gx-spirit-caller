extern int func_ov002_021d8904(int bit9, int field4, int field9);
extern int func_ov002_021de134(void *self, unsigned int mask, int k1, int k2);

struct Self0 {
    char _pad[0x14];
    unsigned int f14lo9 : 9;
    unsigned int bit9 : 1;
    unsigned int f14mid4 : 4;
    unsigned int : 18;
};

int func_ov002_0223832c(struct Self0 *self) {
    func_ov002_021d8904(self->bit9, self->f14mid4, self->f14lo9);
    {
        unsigned int mask = 1u << (self->bit9 * 16 + self->f14mid4);
        func_ov002_021de134(self, mask, 0xb, 8);
    }
    return 0;
}
