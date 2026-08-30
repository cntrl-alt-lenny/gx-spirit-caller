extern void func_ov002_021ae400(unsigned int a0, int a1);
extern void func_ov002_021af9d0(unsigned int a0, int a1, unsigned short a2, int a3);
extern int func_ov002_021afb74(void);
extern void func_ov002_021d7d0c(void *a0, unsigned int a1, int a2);
extern void func_ov002_021e276c(unsigned int a0, unsigned short a1, int a2, int a3);
extern int func_ov002_0225368c(unsigned int a0, unsigned short a1, int a2);
extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];

int func_ov002_0221c6e8(void *arg0) {
    if (*(int *)(data_ov002_022d016c + 0xCF8) != 5) {
        if (((unsigned int)(*(unsigned short *)((char *)arg0 + 4) << 0x1D) >> 0x1F) != 0) {
            return 0;
        }
        func_ov002_021e276c((unsigned int)(*(unsigned short *)((char *)arg0 + 2) << 0x1F) >> 0x1F, *(unsigned short *)((char *)arg0 + 0), 1, 0);
        return 0;
    }
    switch (*(int *)(data_ov002_022ce288 + 0x5A8)) {
    case 0x80:
        if (func_ov002_0225368c((unsigned int)(*(unsigned short *)((char *)arg0 + 2) << 0x1F) >> 0x1F, *(unsigned short *)((char *)arg0 + 0), 0) == 0) {
            return 0;
        }
        func_ov002_021ae400((unsigned int)(*(unsigned short *)((char *)arg0 + 2) << 0x1F) >> 0x1F, 0x4D);
        return 0x7F;
    case 0x7F:
        func_ov002_021af9d0((unsigned int)(*(unsigned short *)((char *)arg0 + 2) << 0x1F) >> 0x1F, 6, *(unsigned short *)((char *)arg0 + 0), 0);
        return 0x7E;
    case 0x7E:
        func_ov002_021d7d0c(arg0, (unsigned int)(*(unsigned short *)((char *)arg0 + 2) << 0x1F) >> 0x1F, func_ov002_021afb74());
        return 0x78;
    default:
        return 0;
    }
}
