/* func_ov006_021be558: seed three status fields from a global delta, return
 * whether the delta is zero. */
extern char data_ov006_02257548[];
int func_ov006_021be558(char *out) {
    int d = *(unsigned short *)(data_ov006_02257548 + 0x6c)
          - *(unsigned short *)(data_ov006_02257548 + 0x76);
    *(int *)(out + 0x88) = 6;
    *(int *)(out + 0x8c) = (d == 0) ? 18 : 19;
    *(int *)(out + 0x90) = 0;
    return d == 0 ? 1 : 0;
}
