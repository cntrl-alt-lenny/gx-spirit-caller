extern void func_020952e4(void *arr, int idx);
extern int func_020952d0(void);

int func_02095de0(char *arr, int idx) {
    int *row;
    int val;
    func_020952e4(arr, idx);
    row = (int *)(arr + idx * 4);
    val = *(int *)((char *)row + 0x3c);
    if (val == 0) {
        goto zero;
    }
    if ((unsigned int)val < 0x2000000) {
        val = (int)(arr + val);
    }
    goto done;
zero:
    val = 0;
done:
    func_020952d0();
    return val;
}
