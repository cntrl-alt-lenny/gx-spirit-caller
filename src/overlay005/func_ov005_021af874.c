typedef struct {
    unsigned int unk_00;
    unsigned int mode : 3;
    unsigned int unk_04 : 29;
} GlobalState;
extern GlobalState data_02104f4c;
extern const unsigned char data_ov005_021b1618[102][2];
extern void *func_0202c0c0(int index);

const void *func_ov005_021af874(unsigned char *p, unsigned int index)
{
    if (data_02104f4c.mode == 0) {
        switch (index) {
        case 0: return data_ov005_021b1618;
        case 1: return func_0202c0c0(0xf7);
        case 2: return func_0202c0c0(0xf9);
        case 3: return p + 0x8c;
        }
    } else {
        return func_0202c0c0(index + 0xf7);
    }
    return 0;
}
