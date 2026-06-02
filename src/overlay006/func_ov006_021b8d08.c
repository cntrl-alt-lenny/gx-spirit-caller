/* func_ov006_021b8d08: map idx through a main-arm9 helper, then index an
 * 8-byte-stride table stored at base+0xca88 and add the base+0xca8c scalar. */
extern int func_0202b0b4(int idx);
struct Ov006Pair { int a, b; };
int func_ov006_021b8d08(char *base, int idx) {
    int k = func_0202b0b4(idx);
    struct Ov006Pair *t = *(struct Ov006Pair **)(base + 0xca88);
    return *(int *)(base + 0xca8c) + t[k].a;
}
