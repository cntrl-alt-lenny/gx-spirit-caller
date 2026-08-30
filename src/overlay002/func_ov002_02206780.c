extern int func_ov002_021bc6e8(unsigned int a0);
extern int func_ov002_021ca2b8(unsigned int a0);
extern int func_ov002_021ca2c8(unsigned int a0, int a1);
extern int func_ov002_021ca2d0(unsigned int a0, int a1);

int func_ov002_02206780(void *arg0) {
    int r4;
    int r5;

    if (func_ov002_021bc6e8((unsigned int)(*(unsigned short *)((char *)arg0 + 2) << 0x1F) >> 0x1F) < 0) {
        return 0;
    }
    if (func_ov002_021ca2b8((unsigned int)(*(unsigned short *)((char *)arg0 + 2) << 0x1F) >> 0x1F) == 0) {
        return 0;
    }
    switch (*(unsigned short *)((char *)arg0 + 0)) {
    case 0x1472:
        r4 = 0x14;
        r5 = 5;
        break;
    case 0x1636:
        r4 = 0xE;
        r5 = 3;
        break;
    case 0x1809:
        r4 = 7;
        r5 = 5;
        break;
    case 0x1ACA:
        r4 = 7;
        r5 = 5;
        break;
    case 0x172F:
        r4 = 2;
        r5 = 2;
        break;
    }
    if (func_ov002_021ca2c8((unsigned int)(*(unsigned short *)((char *)arg0 + 2) << 0x1F) >> 0x1F, r4) == 0) {
        return 0;
    }
    if (func_ov002_021ca2d0((unsigned int)(*(unsigned short *)((char *)arg0 + 2) << 0x1F) >> 0x1F, r5) != 0) {
        return 1;
    }
    return 0;
}
