/* func_ov000_021abfbc: decrement the 16-bit counter at +8 if it is nonzero. */
struct Ov000Ctr { char pad[8]; unsigned c : 16; unsigned : 16; };
void func_ov000_021abfbc(struct Ov000Ctr *p) {
    if (p->c != 0) {
        p->c--;
    }
}
