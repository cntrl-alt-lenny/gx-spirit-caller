/* func_ov002_021c9be8: false if func_ov002_021bd85c rejects arg1; else whether
 * player (arg0&1)'s cf16c counter exceeds func_ov002_021bb068(0x132c) * 500. */
extern int func_ov002_021bd85c(int a, int b);
extern int func_ov002_021bb068(int a);
extern int data_ov002_022cf16c[];
int func_ov002_021c9be8(int arg0, int arg1) {
    if (func_ov002_021bd85c(arg1, -1) != 0)
        return 0;
    return *(int *)((char *)data_ov002_022cf16c + (arg0 & 1) * 0x868) >
           func_ov002_021bb068(0x132c) * 500;
}
