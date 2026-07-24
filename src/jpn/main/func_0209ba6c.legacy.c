typedef struct {
    unsigned char pad[0x20];
    int result;
} Data_021a8438;

extern Data_021a8438 data_021a8358;
extern void func_0209b458(void);
extern void func_0209b440(void);
extern int func_0209bab0(void *, void (*)(void), int);

int func_0209ba6c(void *a0) {
    int result = func_0209bab0(a0, func_0209b458, 0);

    data_021a8358.result = result;
    if (result == 0) {
        func_0209b440();
    }
    return data_021a8358.result;
}
