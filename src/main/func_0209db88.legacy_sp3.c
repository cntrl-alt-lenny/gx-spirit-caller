typedef struct {
    int f0;
    unsigned short *id;
} Table;

extern Table *data_021a8d2c;
extern int func_0209dc8c(void);
extern void func_020928cc(void *ptr, int size);

int func_0209db88(int count, ...) {
    char *ap;
    int result;
    unsigned short id;
    int rc = func_0209dc8c();
    if (rc != 0) {
        return rc;
    }
    func_020928cc(data_021a8d2c->id, 2);
    id = *data_021a8d2c->id;
    ap = (char *)((((int)&count) & ~3) + 4);
    result = 3;
    if (count == 0) {
        return 3;
    }
    do {
        ap += 4;
        if (*(int *)(ap - 4) == id) {
            result = 0;
        }
    } while (--count != 0);
    return result;
}
