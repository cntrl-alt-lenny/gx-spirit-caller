extern int func_0204f998(int *a0);
extern int func_0204fa7c(int index, int count);

int func_02046694(int code) {
    int data;
    int count;
    int i;
    unsigned char *p;
    count = func_0204f998(&data);
    i = 0;
    if (count > 0) {
        p = (unsigned char *)data;
        do {
            if (code == *p) break;
            i++;
            p++;
        } while (i < count);
    }
    if (i == count) return 0;
    return func_0204fa7c(i, count);
}
