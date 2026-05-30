/* func_ov002_021e2b3c: per-tick count-UP hub (33 band-callers); sibling of
 * the count-DOWN func_ov002_021e2c5c. Same guard + card-list-slot test; when
 * the slot is in state 2 it fires func_ov002_021b1570(10, -1, &arg, 2) with
 * arg=1, otherwise it bumps the f1484 counter and (on the 0->1 edge only)
 * clears f1492/f1672 and bumps f1488.
 *
 * The || -inverted guard keeps the counter path inline and the dispatch path
 * out-of-line (else), matching the orig block order (mwcc emits the if-body
 * inline and the else branch out-of-line).
 */

struct ce288 {
    char _a[1484];
    int f1484;
    int f1488;
    int f1492;
    int f1496;
    char _b[172];
    int f1672;
};
struct d016c { char _a[3308]; int f3308; char _b[28]; int f3340; };

extern struct ce288 data_ov002_022ce288;
extern struct d016c data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern int func_ov002_021b1570(int a, int b, unsigned short *c, int d);

void func_ov002_021e2b3c(void) {
    unsigned short local;
    if (data_ov002_022ce288.f1496 != 0) return;
    if (data_ov002_022d016c.f3340 == 0 ||
        data_ov002_022cd744[data_ov002_022d016c.f3308] != 2) {
        int old = data_ov002_022ce288.f1484;
        data_ov002_022ce288.f1484 = old + 1;
        if (old != 0) return;
        data_ov002_022ce288.f1492 = 0;
        data_ov002_022ce288.f1672 = 0;
        data_ov002_022ce288.f1488++;
    } else {
        local = 1;
        func_ov002_021b1570(10, -1, &local, 2);
    }
}
