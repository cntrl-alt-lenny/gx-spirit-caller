/* func_ov006_021be4d0: choose a result mode for obj based on a global counter
 * and a probe; write the (mode,arg,handle) triple at obj+0x88. */
extern int  func_ov006_021b70fc(void *p);
extern char data_ov006_02257548[];
extern char data_ov006_0224f448[];
int func_ov006_021be4d0(int *obj) {
    char *p = data_ov006_0224f448;
    int n = *(unsigned short *)(data_ov006_02257548 + 108);
    if (n < 40) {
        obj[34] = 6;
        obj[35] = 2;
        obj[36] = 0;
        return 0;
    }
    {
        int r = func_ov006_021b70fc(p);
        if (r != 0) {
            obj[34] = 6;
            obj[35] = 1;
            obj[36] = r;
            return 0;
        }
    }
    obj[34] = 6;
    obj[35] = 23;
    obj[36] = 0;
    return 1;
}
