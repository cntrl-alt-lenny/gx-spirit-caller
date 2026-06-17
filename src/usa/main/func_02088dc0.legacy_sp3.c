/* func_02088dc0: sibling of 02088e6c (f4 != 1 check). */
struct F02088ea8 {
    void *f0;
    int f4;
};

extern struct F02088ea8 data_021a516c;
extern void func_0208878c(void);

void func_02088dc0(void) {
    if (data_021a516c.f0 == 0) return;
    if (data_021a516c.f4 != 1) return;
    func_0208878c();
}
