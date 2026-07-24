typedef unsigned char u8;
extern char data_ov002_022ce288[];
extern int func_ov002_0228a9a4(void *a, void *b);

int func_ov002_0228ac74(void *a, void *b) {
    int v = *(int *)(data_ov002_022ce288 + 0x5d4);
    if (v == 0) return 0;
    {
        u8 k = *(u8 *)(data_ov002_022ce288 + 0x5dc);
        if (k <= 5) return 0;
        switch (k) {
        case 0x12:
        case 0x13:
            return 0;
        }
    }
    return func_ov002_0228a9a4(a, b);
}
