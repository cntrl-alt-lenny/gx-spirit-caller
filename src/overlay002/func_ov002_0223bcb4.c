extern int func_02030b84(void);
extern int func_02031684(int a0);
extern void func_ov002_0223b584(void);
extern int func_ov002_0223b5cc(unsigned int a0, int a1);
extern char data_ov002_022ce288[];
extern char data_ov002_022d0250[];

int func_ov002_0223bcb4(int arg0, int arg1, int *arg2) {
    int *p;
    int val;
    int i;

    p = arg2;
    if (func_02030b84() == 0) {
        return 0;
    }
    *(int *)(data_ov002_022ce288 + 0x69C) = arg0;
    *(int *)(data_ov002_022ce288 + 0x6A4) = arg1;
    *(int *)(data_ov002_022ce288 + 0x6B0) = (func_02031684(arg0) == 0) ? 1 : 0;
    *(int *)(data_ov002_022ce288 + 0x6A8) = 0;
    func_ov002_0223b584();
    i = 0;
    if (*(int *)(data_ov002_022ce288 + 0x6A4) > 0) {
        do {
            val = *p;
            if (func_ov002_0223b5cc((unsigned int)(*(unsigned short *)(data_ov002_022d0250 +
                    ((((unsigned int)(val * 4) >> 0x18) * 2) + ((unsigned int)(val << 0x12) >> 0x1F)) * 4) << 0x13) >> 0x13, 2) == 0) {
                return 0;
            }
            i += 1;
            p += 1;
        } while (i < *(int *)(data_ov002_022ce288 + 0x6A4));
    }
    if (*(int *)(data_ov002_022ce288 + 0x69C) == 0x1A4E &&
        *(int *)(data_ov002_022ce288 + 0x6B4) != 0 &&
        *(int *)(data_ov002_022ce288 + 0x6A8) == 0) {
        return 0;
    }
    return 1;
}
