extern int data_021026dc;
extern void func_0209bcdc(void);
extern int func_0209bb60(int *time);

unsigned short func_0209e124(void) {
    int time[3];
    unsigned int value;
    if (data_021026dc == 0x10000) {
        func_0209bcdc();
        if (func_0209bb60(time) == 0) {
            data_021026dc = (unsigned short)(time[2] + (time[1] << 8));
        }
    }
    value = (unsigned short)(data_021026dc + 1);
    data_021026dc = value;
    return value;
}
