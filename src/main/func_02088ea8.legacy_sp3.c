/* func_02088ea8: sibling of 02088e6c (f4 != 1 check). */
struct F02088ea8 {
    void *f0;
    int f4;
};

extern struct F02088ea8 data_021a524c;
extern void func_02088874(void);

void func_02088ea8(void) {
    if (data_021a524c.f0 == 0) return;
    if (data_021a524c.f4 != 1) return;
    func_02088874();
}
