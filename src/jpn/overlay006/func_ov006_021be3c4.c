/* func_ov006_021be3c4: choose a result mode for obj based on a global counter
 * and a probe; write the (mode,arg,handle) triple at obj+0x88. */
extern int  func_ov006_021b6ffc(void *p);
extern char data_ov006_02257428[];
extern char data_ov006_0224f328[];
int func_ov006_021be3c4(int *obj) {
    char *p = data_ov006_0224f328;
    int n = *(unsigned short *)(data_ov006_02257428 + 108);
    if (n < 40) {
        obj[34] = 6;
        obj[35] = 2;
        obj[36] = 0;
        return 0;
    }
    {
        int r = func_ov006_021b6ffc(p);
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
