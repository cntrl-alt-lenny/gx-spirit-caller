typedef struct {
    char pad[2];
    unsigned short bit0 : 1;
    unsigned short rest : 15;
} Inner_ov002_02216530;

typedef struct {
    char pad[0x48c];
    Inner_ov002_02216530 *ptr;
} Outer_ov002_02216530;

extern Outer_ov002_02216530 data_ov002_022ce1a8;

int func_ov002_02216440(int a0, int a1) {
    if (a0 != data_ov002_022ce1a8.ptr->bit0) {
        if (a1 == 0xb) {
            return 0x800;
        }
    }
    return 0;
}
