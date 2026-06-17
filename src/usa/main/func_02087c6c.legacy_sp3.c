/* func_02087c6c: sub-shape 4 sibling — same recipe, different helper. */
extern void func_02095014(unsigned char x);

void func_02087c6c(unsigned char **pp) {
    unsigned char *p = *pp;
    if (p == 0) return;
    func_02095014(p[60]);
}
