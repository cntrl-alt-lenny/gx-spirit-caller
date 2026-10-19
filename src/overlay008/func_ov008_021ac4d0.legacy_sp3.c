extern unsigned short data_ov008_021b2dc0[];
extern void func_ov008_021ac35c(int a, int b);

void func_ov008_021ac4d0(int count, int direction) {
    int i;
    if (direction != 0) {
        for (count--; count >= 0; count--) {
            int byte = (unsigned int)(data_ov008_021b2dc0[2] << 24) >> 24;
            int offset = 6 - count;
            int slot = byte % 8 + offset;
            if (slot >= 8) slot -= 8;
            if (byte + offset < 26) func_ov008_021ac35c(byte + offset, slot);
        }
    } else {
        for (i = 0; i < count; i++) {
            int byte = (unsigned int)(data_ov008_021b2dc0[2] << 24) >> 24;
            int slot = byte % 8 - 1 + i;
            if (slot < 0) slot += 8;
            if (slot >= 8) slot -= 8;
            if (byte - 1 + i >= 0) func_ov008_021ac35c(byte - 1 + i, slot);
        }
    }
}

