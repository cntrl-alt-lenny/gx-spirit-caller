extern int data_02101354;
extern int data_0219e51c;
extern signed char *data_0219e514;
extern int data_0219e524;
extern int data_0219e510;
extern int func_020453cc(int x, int y);
/* Original supplies four arguments, despite the existing no-argument definition. */
extern int func_02054d4c(int, signed char *, int, int);
extern int func_02060728(char *cur, int remaining);
/* This thunk forwards func_02055000's int result, which this caller tests. */
extern int func_02060c90(int);
extern void func_02060f50(void);
extern signed char *func_020a7388(signed char *dst, signed char *src, int n);

int func_02060dd4(void) {
    int n;
    int used;
    if (data_02101354 == -1) return 0;
    if (data_0219e51c != 5) return 0;
    while (func_02060c90(data_02101354)) {
        if (data_0219e524 - data_0219e510 < 128) {
            if (data_0219e524 < 256) data_0219e524 = 256;
            else data_0219e524 *= 2;
            data_0219e514 = (signed char *)func_020453cc((int)data_0219e514, data_0219e524 + 1);
            if (data_0219e514 == 0) return 0;
        }
        n = data_0219e510;
        n = func_02054d4c(data_02101354, data_0219e514 + n, data_0219e524 - n, 0);
        if (n <= 0) {
            func_02060f50();
            return 0;
        }
        data_0219e510 += n;
        data_0219e514[data_0219e510] = 0;
        used = func_02060728((char *)data_0219e514, data_0219e510);
        if (used == data_0219e510) data_0219e510 = 0;
        else {
            func_020a7388(data_0219e514, data_0219e514 + used, data_0219e510 - used);
            data_0219e510 -= used;
        }
    }
    return data_02101354 != -1;
}
