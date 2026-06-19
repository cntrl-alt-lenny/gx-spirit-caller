/* func_ov002_02263f48: accept on either 021bb068 query, else report
 * 02263f04(arg0, 0x1481). */
extern int func_ov002_021baf88(int code);
extern int func_ov002_02263e1c(void *arg0, int code);

int func_ov002_02263f48(void *arg0) {
    if (func_ov002_021baf88(0x148E) != 0)
        return 1;
    if (func_ov002_021baf88(0x14DA) != 0)
        return 1;
    return func_ov002_02263e1c(arg0, 0x1481);
}
