/* func_ov006_021c30c4 — guard chain: for each live handle in self->f8/f0/f4,
 * kick its channel and post a config; the f4 arm additionally selects a value
 * from an s16 table indexed by self->f58 and self->f64, posting it via (3,v). */
extern int  func_0202160c(int a, int b, int c);
extern int  func_0202165c(int a, int b, int c);
extern void func_020221e0(int a, int b);
extern short data_ov006_021cdd0c[];

typedef struct {
    int  f0;             /* 0x00 */
    int  f4;             /* 0x04 */
    int  f8;             /* 0x08 */
    char _pad0c[0x4c];
    int  f58;            /* 0x58 */
    char _pad5c[0x8];
    int  f64;            /* 0x64 */
} Ov006GuardS;

int func_ov006_021c30c4(Ov006GuardS *self) {
    int v;
    if (self->f8 != 0) {
        func_0202165c(func_0202160c(self->f8, 4, 0), 0, 1);
        func_0202165c(func_0202160c(self->f8, 4, 1), 0, 1);
    }
    if (self->f0 != 0)
        func_0202165c(func_0202160c(self->f0, 4, 0), 0, 1);
    if (self->f4 != 0) {
        int h = func_0202160c(self->f4, 4, 0);
        if (data_ov006_021cdd0c[self->f58 * 2] == 2) {
            if (!self->f64) v = 0;
            else v = 1;
        } else
            v = 2;
        func_0202165c(h, 0, 0x801);
        func_020221e0(3, v);
    }
    return 1;
}
