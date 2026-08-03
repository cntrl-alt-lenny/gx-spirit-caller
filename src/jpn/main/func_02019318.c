extern const unsigned char data_020be5d0[88];
extern char data_02104e6c[];

int func_02019318(int a) {
    int byte = data_020be5d0[a];
    int year = *(int *)(data_02104e6c + 0x928);
    int extra = *(int *)(data_02104e6c + 0x92c);

    switch (byte) {
    case 2:
        if (year >= 0x24) {
            return 0x4a;
        }
        return byte;
    case 3:
        if (year >= 0x29) {
            return 0x5e;
        }
        return byte;
    case 5:
        if (year >= 0x18) {
            byte = 0x4b;
        }
        if (year >= 0x17 && extra >= 0x4) {
            byte = 0x4b;
        }
        return byte;
    case 7:
        if (year >= 0x2c) {
            byte = 0x3f;
        }
        if (year >= 0x2b && extra >= 0x3) {
            byte = 0x3f;
        }
        return byte;
    case 0x49:
        if (year < 0xa) {
            byte = 0x2d;
        }
        if (year != 0xa) {
            return byte;
        }
        if (extra < 0x7) {
            byte = 0x2d;
        }
        return byte;
    case 0x3b:
        if (year == 0x21 && extra == 3) {
            byte = 0x3c;
        }
        if (year == 0x21 && extra == 4) {
            byte = 0x3d;
        }
        return byte;
    default:
        return byte;
    }
}
