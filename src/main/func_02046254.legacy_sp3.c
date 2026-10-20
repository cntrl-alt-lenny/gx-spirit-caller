typedef void (*Handler)(int, int, int);
typedef void (*WideHandler)(int, int, int, int, int, int);
typedef struct {
    char pad0[0x24];
    int state;
    int old_state;
    unsigned char selection;
    char pad2d[0x37];
    int current;
    char pad68[0x18];
    Handler handler;
    int handler_arg;
    WideHandler wide_handler;
    int wide_arg;
    char pad90[0x2d1];
    unsigned char count;
    char pad362[7];
    volatile unsigned char mode;
    char pad36a[0xde];
    int entries[43];
    int flag;
    char pad4f8[0x12c];
    unsigned char values[32];
    int mask;
} Context;
extern Context *data_0219daec;
extern int func_02046658(unsigned char *arr, int count);
extern void func_020466f4(int arg);
extern void func_0204f9cc(void);
extern void func_0205000c(void);
void func_02046254(int a, int b, int c, int d, int e) {
    int i;
    if (a == 0 && b != 0) {
        if (data_0219daec->flag == 0) {
            func_0205000c();
            func_020466f4(3);
        }
    } else if (a == 0) {
        func_020466f4(6);
        for (i = 0; i <= data_0219daec->count; i++) {
            if (data_0219daec->current == data_0219daec->entries[i]) {
                data_0219daec->selection = data_0219daec->values[i];
                break;
            }
        }
    }
    data_0219daec->mask = func_02046658(data_0219daec->values, data_0219daec->count + 1);
    func_0204f9cc();
    if (data_0219daec->mode == 2 || data_0219daec->mode == 3) {
        data_0219daec->wide_handler(a, b, c, d, e, data_0219daec->wide_arg);
    } else {
        data_0219daec->handler(a, b, data_0219daec->handler_arg);
    }
    if (a != 0 && data_0219daec != 0 && data_0219daec->state == 5) {
        func_020466f4(3);
    }
}

