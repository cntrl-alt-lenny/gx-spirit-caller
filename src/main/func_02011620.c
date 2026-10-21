extern const short data_020bef80[];
void func_02011620(int *m, int angle) {
    int s = data_020bef80[(angle >> 4) * 2];
    int c;
    m[0] = 0x1000;
    m[1] = 0;
    m[2] = 0;
    c = data_020bef80[(angle >> 4) * 2 + 1];
    m[3] = 0;
    m[4] = c;
    m[5] = s;
    m[6] = 0;
    m[7] = -s;
    m[8] = c;
    m[9] = 0;
    m[10] = 0;
    m[11] = 0;
}
