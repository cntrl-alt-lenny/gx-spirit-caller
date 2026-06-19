/* func_ov002_021e2b6c: per-tick countdown hub (33 band-callers).
 * Guarded by data_ov002_022ce1a8.f1496; if a card-list slot is in state 2,
 * fire func_ov002_021b1490(10, -1, &arg, 2) with arg=0; otherwise decrement
 * the f1484 countdown. Sibling func_ov002_021e2a4c is the count-UP form.
 *
 * Struct externs are the anti-fold form (base + [#offset]); orig keeps the
 * symbol in a base register and uses an ldr offset, never folding sym+const
 * into one pool word.
 */

struct ce288 { char _a[1484]; int f1484; char _b[8]; int f1496; };
struct d016c { char _a[3308]; int f3308; char _b[28]; int f3340; };

extern struct ce288 data_ov002_022ce1a8;
extern struct d016c data_ov002_022d008c;
extern int data_ov002_022cd664[];
extern int func_ov002_021b1490(int a, int b, unsigned short *c, int d);

void func_ov002_021e2b6c(void) {
    unsigned short local;
    if (data_ov002_022ce1a8.f1496 != 0) return;
    if (data_ov002_022d008c.f3340 == 0 ||
        data_ov002_022cd664[data_ov002_022d008c.f3308] != 2) {
        data_ov002_022ce1a8.f1484--;
    } else {
        local = 0;
        func_ov002_021b1490(10, -1, &local, 2);
    }
}
