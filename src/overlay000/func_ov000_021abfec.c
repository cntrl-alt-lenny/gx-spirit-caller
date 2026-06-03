/* func_ov000_021abfec: advance the 16-bit lo field at +8 by the signed margin
 * byte at +12, then clamp it down to (hi - margin) if it overshot. */
struct Ov000LH {
    char pad8[8];
    unsigned lo : 16;   /* +8  bits[15:0]  */
    unsigned hi : 16;   /* +8  bits[31:16] */
    unsigned margin : 8; /* +12 bits[7:0]  */
};
void func_ov000_021abfec(struct Ov000LH *p) {
    p->lo = p->lo + p->margin;
    if ((unsigned)(p->hi - p->margin) < (unsigned)p->lo) {
        p->lo = p->hi - p->margin;
    }
}
