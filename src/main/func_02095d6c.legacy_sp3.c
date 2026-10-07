extern const unsigned char data_020c32f8[];

unsigned short func_02095d6c(int v) {
    int level;
    unsigned int base;
    if (v < -723) {
        v = -723;
    } else if (v > 0) {
        v = 0;
    }
    base = data_020c32f8[v + 723];
    if (v < -240) {
        level = 3;
    } else if (v < -120) {
        level = 2;
    } else if (v < -60) {
        level = 1;
    } else {
        level = 0;
    }
    return base | (level << 8);
}
