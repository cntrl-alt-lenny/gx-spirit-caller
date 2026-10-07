/* func_0207b18c: starting at x, find the first of 13 consecutive values
 * (mod 13, 1-based) whose bit is clear in the mask at data_021a088c + 0x2264;
 * return it. */
extern unsigned char *data_021a088c;

unsigned short func_0207b18c(int x) {
    int n;
    int k;
    int mask;

    k = x;
    n = 0;
    mask = *(int *)(data_021a088c + 0x2000 + 0x264);

    do {
        if ((mask & (1 << (k % 13 + 1))) != 0) {
            break;
        }
        n++;
        k++;
    } while (n < 13);
    return (x + n) % 13 + 1;
}
