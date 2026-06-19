/* func_ov002_021c9b08: false if func_ov002_021bd77c rejects arg1; else whether
 * player (arg0&1)'s cf16c counter exceeds func_ov002_021baf88(0x132c) * 500. */
extern int func_ov002_021bd77c(int a, int b);
extern int func_ov002_021baf88(int a);
extern int data_ov002_022cf08c[];
int func_ov002_021c9b08(int arg0, int arg1) {
    if (func_ov002_021bd77c(arg1, -1) != 0)
        return 0;
    return *(int *)((char *)data_ov002_022cf08c + (arg0 & 1) * 0x868) >
           func_ov002_021baf88(0x132c) * 500;
}
