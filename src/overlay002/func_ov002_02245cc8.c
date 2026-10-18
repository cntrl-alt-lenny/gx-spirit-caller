typedef unsigned short u16;

int func_ov002_02245cc8(u16 *self, int value) {
    switch (*self) {
    case 0x17bc:
        return 1;
    default:
        switch (value) {
        case 0x14e6:
        case 0x15a7:
        case 0x15ab:
        case 0x183e:
        case 0x198f:
        case 0x19b7:
        case 0x1af8:
        case 0x1af9:
        case 0x1afa:
        case 0x1b02:
        case 0x1b03:
        case 0x1b04:
            return 1;
        default:
            return 0;
        }
    }
}
