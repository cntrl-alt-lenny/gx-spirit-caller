extern int func_ov002_021bb068(int);
extern int func_ov002_021e28fc(int arg0);
extern unsigned char data_ov002_022d016c[];

int func_ov002_02256108(void)
{
    int active = func_ov002_021bb068(0x1510) > 0;
    if (active == ((*(unsigned int *)(data_ov002_022d016c + 0xd0) >> 2) & 1)) {
        return 0;
    }
    func_ov002_021e28fc(active);
    return 1;
}
