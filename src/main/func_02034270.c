typedef struct {
    char         _pad[0x440];
    unsigned int bits[];
} flags_02034270_t;

extern flags_02034270_t *func_02034184(void);

void func_02034270(int idx, int set) {
    flags_02034270_t *f = func_02034184();

    if (f == 0) {
        return;
    }
    if (set != 0) {
        f->bits[idx / 32] |= 1 << (idx % 32);
    } else {
        f->bits[idx / 32] &= ~(1 << (idx % 32));
    }
}
