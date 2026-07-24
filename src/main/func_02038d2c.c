typedef struct {
    int f0;
    int f4;
    int f8;
} Entry02038d2c;

extern Entry02038d2c data_0219c4a0[];

void *func_02038d2c(void *a) {
    int n = 0;
    Entry02038d2c *e;
    n += *((unsigned char *)a + 0x1f) << 1;
    e = data_0219c4a0 + n;
    n = 2;
    do {
        if (e->f4 == 0) {
            return e;
        }
        n--;
        e++;
    } while (n > 0);
    return 0;
}
