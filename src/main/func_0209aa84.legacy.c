extern int data_021a83dc;
extern void func_0209b014(int a);
extern void func_0209b050(int a, int b, int c);

int func_0209aa84(int mode, int a, int skip, int flag) {
    if (mode != 0) {
        if (mode == 1) {
            if (skip == 0 && (unsigned int)(*(int *)0x027ffc3c - data_021a83dc) <= 7) {
                return 0;
            }
            if (a != 0) {
                if (flag != 0) {
                    func_0209b014(a);
                } else {
                    func_0209b050(a, 0, 0);
                }
            }
            *(unsigned short *)0x04000304 |= 1;
        }
    } else {
        *(unsigned short *)0x04000304 &= ~1;
        data_021a83dc = *(int *)0x027ffc3c;
        if (a != 0) {
            if (flag != 0) {
                func_0209b014(a);
            } else {
                func_0209b050(a, 0, 0);
            }
        }
    }
    return 1;
}
