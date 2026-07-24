/* func_ov010_021b7104: thin forwarder, arg0 becomes the 3rd call arg. */
extern int func_ov010_021b2924(char *a, char *b, int c);
extern char data_ov010_021b98f0[];
extern char data_ov010_021b98a8[];

int func_ov010_021b7104(int arg0) {
    int ret = 0;
    ret = ret + func_ov010_021b2924(data_ov010_021b98f0, data_ov010_021b98a8, arg0);
    return ret;
}
