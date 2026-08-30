extern int func_ov002_021bb90c(unsigned int a0, int a1);
extern char data_ov002_022d016c[];

int func_ov002_02206eb0(void *arg0) {
    if (*(unsigned short *)((char *)arg0 + 0) == 0x16A3) {
        if (*(int *)(data_ov002_022d016c + 0xCEC) != (unsigned int)(*(unsigned short *)((char *)arg0 + 2) << 0x1F) >> 0x1F) {
            return 0;
        }
        if ((unsigned int)*(int *)(data_ov002_022d016c + 0xCF8) > 3U) {
            return 0;
        }
    }
    if (func_ov002_021bb90c((unsigned int)(*(unsigned short *)((char *)arg0 + 2) << 0x1F) >> 0x1F, 0x1532) == 0) {
        return 0;
    }
    if (func_ov002_021bb90c((unsigned int)(*(unsigned short *)((char *)arg0 + 2) << 0x1F) >> 0x1F, 0x161E) == 0) {
        return 0;
    }
    if (func_ov002_021bb90c((unsigned int)(*(unsigned short *)((char *)arg0 + 2) << 0x1F) >> 0x1F, 0x1656) == 0) {
        return 0;
    }
    if (func_ov002_021bb90c((unsigned int)(*(unsigned short *)((char *)arg0 + 2) << 0x1F) >> 0x1F, 0x1685) == 0) {
        return 0;
    }
    if (func_ov002_021bb90c((unsigned int)(*(unsigned short *)((char *)arg0 + 2) << 0x1F) >> 0x1F, 0x1686) != 0) {
        return 2;
    }
    return 0;
}
