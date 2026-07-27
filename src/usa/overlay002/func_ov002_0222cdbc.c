/* func_ov002_0222cdbc: countdown loop `while (o->f14-- != 0) arg1 -= 0x18;`
 * then tail-call func_ov002_022303e4(o, arg1). The compiler hoists the
 * first read+decrement+test ahead of the loop (peels the while-test),
 * matching the raw disassembly's pre-loop read/store/cmp block. */
struct S0222ceac { char pad[0x14]; int f14; };
extern int func_ov002_022303e4(struct S0222ceac *o, void *e);

int func_ov002_0222cdbc(struct S0222ceac *o, char *arg1) {
    while (o->f14-- != 0) {
        arg1 -= 0x18;
    }
    return func_ov002_022303e4(o, arg1);
}
