/* func_ov010_021b7004: thin forwarder, arg0 becomes the 3rd call arg. */
extern int func_ov010_021b2824(char *a, char *b, int c);
extern char data_ov010_021b97f0[];
extern char data_ov010_021b97a8[];

int func_ov010_021b7004(int arg0) {
    int ret = 0;
    ret = ret + func_ov010_021b2824(data_ov010_021b97f0, data_ov010_021b97a8, arg0);
    return ret;
}
