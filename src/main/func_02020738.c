typedef struct {
    char pad0[0x34];
    unsigned int seed;
} State;

extern State data_02191f40;

short func_02020738(unsigned short mask) {
    short i;
    short last = 0;
    unsigned short count = 0;
    unsigned short r;
    unsigned int s;
    for (i = 0; i < 16; i++) {
        if (mask & (1 << i)) {
            last = i + 1;
            count++;
        }
    }
    if (count <= 1) {
        return last;
    }
    s = data_02191f40.seed * 0x10dcd + 0x3039;
    data_02191f40.seed = s;
    r = ((s & 0xff) * count) >> 8;
    for (i = 0; i < 16; i++) {
        if (mask & 1) {
            if (r == 0) {
                return i + 1;
            }
            r--;
        }
        mask = mask >> 1;
    }
    return 0;
}
