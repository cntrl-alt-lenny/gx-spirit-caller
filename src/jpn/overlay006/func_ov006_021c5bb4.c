/* func_ov006_021c5bb4: if a handle is live, retarget it and post a follow-up;
 * return 1. */
extern int  func_0202160c(int a, int b, int c);
extern int  func_0202165c(int a, int b, int c);
extern void func_020221e0(int a, int b);
int func_ov006_021c5bb4(int *base) {
    if (*base != 0) {
        func_0202165c(func_0202160c(*base, 4, 0), 0, 0x801);
        func_020221e0(3, 0);
    }
    return 1;
}
