extern const short data_020bef80[];
void func_02011688(int *m, int angle) {
    int s = data_020bef80[(angle >> 4) * 2];
    int c = data_020bef80[(angle >> 4) * 2 + 1];
    m[0] = c;
    m[1] = 0;
    m[2] = -s;
    m[3] = 0;
    m[4] = 0x1000;
    m[5] = 0;
    m[6] = s;
    m[7] = 0;
    m[8] = c;
    m[9] = 0;
    m[10] = 0;
    m[11] = 0;
}
