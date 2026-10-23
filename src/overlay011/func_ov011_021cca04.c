extern char *GetSystemWork(void);
extern char data_ov011_021d4000[];
extern char data_ov011_021d403c[];
extern unsigned char data_ov011_021d2fc8[];
extern unsigned char data_ov011_021d2fc9[];
void func_ov011_021cca04(void) {
    char *s = data_ov011_021d403c;
    int width, height, xmin, ymin;
    int index;

    
    if (*(int *)(data_ov011_021d4000 + 0x2a0) == 0) index = 0;
    else index = (unsigned int)(*(unsigned int *)(s + 0x268) << 23) >> 28;
    xmin = 0; ymin = xmin;
    width = data_ov011_021d2fc8[index * 2] << 3;
    height = data_ov011_021d2fc9[index * 2] << 3;

    if (*(int *)(s + 0x264) == 1 && ((unsigned int)(*(unsigned int *)(s + 0x268) << 23) >> 28) == 5) {
        if (((unsigned int)(*(unsigned int *)(GetSystemWork() + 0x8f8) << 19) >> 31) == 0) ymin = 232; else xmin = ymin;
    }
    if (*(int *)(s + 0x1fc) > ((width - 256) << 12)) *(int *)(s + 0x1fc) = (width - 256) << 12;
    else if (*(int *)(s + 0x1fc) < (xmin << 12)) *(int *)(s + 0x1fc) = xmin << 12;
    if (*(int *)(s + 0x200) > ((height - 192) << 12)) *(int *)(s + 0x200) = (height - 192) << 12;
    else if (*(int *)(s + 0x200) < (ymin << 12)) *(int *)(s + 0x200) = ymin << 12;
}











