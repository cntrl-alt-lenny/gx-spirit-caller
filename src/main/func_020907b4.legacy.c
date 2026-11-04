typedef void (*IrqCallback)(int);
typedef struct {
    IrqCallback callback;
    int enabled;
    int argument;
} IrqCallbackInfo;
extern IrqCallback OSi_IrqCallbackTable[];
extern IrqCallbackInfo data_021a6354[];

void func_020907b4(unsigned int mask, IrqCallback callback) {
    int index;
    for (index = 0; index < 22; index++, mask >>= 1) {
        if (mask & 1) {
            IrqCallbackInfo *entry = 0;
            if (index >= 8 && index <= 11) {
                entry = &data_021a6354[index - 8];
            } else if (index >= 3 && index <= 6) {
                entry = &data_021a6354[index + 1];
            } else {
                OSi_IrqCallbackTable[index] = callback;
            }
            if (entry) {
                entry->callback = callback;
                entry->argument = 0;
                entry->enabled = 1;
            }
        }
    }
}
