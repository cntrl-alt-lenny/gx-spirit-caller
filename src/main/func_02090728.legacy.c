extern void (*OSi_IrqCallbackTable[])(int);
extern unsigned char data_021a6354[];
void (*func_02090728(unsigned int mask))(int) {
    int index = 0;
    void (**entry)(int) = OSi_IrqCallbackTable;
    do {
        if (mask & 1) {
            if (index >= 8 && index <= 11) return *(void (**)(int))(data_021a6354 + (index - 8) * 12);
            if (index >= 3 && index <= 6) return *(void (**)(int))(data_021a6354 + (index + 1) * 12);
            return *entry;
        }
        index++;
        mask >>= 1;
        entry++;
    } while (index < 22);
    return 0;
}
