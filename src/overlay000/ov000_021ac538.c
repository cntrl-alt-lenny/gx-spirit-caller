/* func_ov000_021ac538: sibling of func_ov000_021abf28 — identical
 * body, different TU. 1-bit setter at bit-0 of obj+0x0.
 */

void func_ov000_021ac538(void *p, unsigned val) {
    unsigned *word = (unsigned *)p;
    *word = (*word & ~1u) | (val & 1u);
}
