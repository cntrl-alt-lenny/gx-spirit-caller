struct Ov000LH {
    char pad8[8];
    unsigned lo : 16;
    unsigned hi : 16;
    unsigned margin : 8;
};
void func_ov000_021abf78(struct Ov000LH *p) {
    if ((unsigned)(p->hi - p->margin) > (unsigned)p->lo) {
        p->lo++;
    }
}
