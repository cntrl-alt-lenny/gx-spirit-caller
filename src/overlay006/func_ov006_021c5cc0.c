/* func_ov006_021c5cc0: if a handle is live, retarget it and post a follow-up;
 * return 1. */
extern int  func_02021660(int a, int b, int c);
extern int  func_020216b0(int a, int b, int c);
extern void func_02022234(int a, int b);
int func_ov006_021c5cc0(int *base) {
    if (*base != 0) {
        func_020216b0(func_02021660(*base, 4, 0), 0, 0x801);
        func_02022234(3, 0);
    }
    return 1;
}
