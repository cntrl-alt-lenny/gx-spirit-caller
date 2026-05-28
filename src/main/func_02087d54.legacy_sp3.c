/* func_02087d54: sub-shape 4 sibling — same recipe, different helper. */
extern void func_02095108(unsigned char x);

void func_02087d54(unsigned char **pp) {
    unsigned char *p = *pp;
    if (p == 0) return;
    func_02095108(p[60]);
}
