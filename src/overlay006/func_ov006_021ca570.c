extern void *func_0208e1ac(void);
extern void func_02094504(int value, void *dst, int size);

int func_ov006_021ca570(char *self) {
    int x, y;
    func_02094504(0, func_0208e1ac(), 0x800);
    for (y = 0; y < *(int *)(self + 0x5c); y++) {
        for (x = 0; x < *(int *)(self + 0x58); x++) {
            int tile;
            if (y == 0) {
                tile = x == 0 ? 0 : (x == *(int *)(self + 0x58) - 1 ? 2 : 1);
            } else if (y == *(int *)(self + 0x5c) - 1) {
                if (x == 0) tile = 6;
                else if (x == *(int *)(self + 0x58) - 1) tile = 8;
                else tile = 7;
            } else {
                if (x == 0) tile = 3;
                else if (x == *(int *)(self + 0x58) - 1) tile = 5;
                else tile = 4;
            }
            ((unsigned short (*)[32])func_0208e1ac())[y][x] =
                (*(int *)(self + 0x38) + tile) | (*(int *)(self + 0x3c) << 12);
        }
    }
    return 1;
}








