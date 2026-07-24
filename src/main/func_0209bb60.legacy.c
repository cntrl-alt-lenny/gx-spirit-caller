typedef struct {
    unsigned char pad[0x20];
    int result;
} Data_021a8438;

extern Data_021a8438 data_021a8438;
extern void func_0209b54c(void);
extern void func_0209b534(void);
extern int func_0209bba4(void *, void (*)(void), int);

int func_0209bb60(void *a0) {
    int result = func_0209bba4(a0, func_0209b54c, 0);

    data_021a8438.result = result;
    if (result == 0) {
        func_0209b534();
    }
    return data_021a8438.result;
}
