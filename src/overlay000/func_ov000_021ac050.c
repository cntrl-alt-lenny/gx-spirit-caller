/* func_ov000_021ac050: saturating-subtract the margin byte at +12 from the
 * 16-bit lo counter at +8, flooring at 0. (021abfbc/abfec RMW family.) */
struct Ov000Ctr2 { char pad8[8]; unsigned lo : 16; unsigned hi : 16; unsigned b : 8; };
void func_ov000_021ac050(struct Ov000Ctr2 *p) {
    if (p->lo <= p->b) {
        p->lo = 0;
    } else {
        p->lo = p->lo - p->b;
    }
}
