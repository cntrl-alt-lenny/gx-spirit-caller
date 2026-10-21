extern const short data_020bef80[];
void func_020116ec(int *m, int angle) {
    int s = data_020bef80[(angle >> 4) * 2];
    int c = data_020bef80[(angle >> 4) * 2 + 1];
    m[0] = c;
    m[1] = s;
    m[2] = 0;
    m[3] = -s;
    m[4] = c;
    m[5] = 0;
    m[6] = 0;
    m[7] = 0;
    m[8] = 0x1000;
    m[9] = 0;
    m[10] = 0;
    m[11] = 0;
}

