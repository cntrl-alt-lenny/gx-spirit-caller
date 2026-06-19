/* func_ov000_021aa940: write two (x,y,z) triples into the active object —
 * a at +0x30 (live), b at +0x24. (set-object-params family, *021c73e0.) */
extern char data_ov000_021c7300[];
struct Ov000V3 { int x, y, z; };
struct Ov000Mid { struct Ov000V3 b; struct Ov000V3 a; };
void func_ov000_021aa940(struct Ov000V3 a, struct Ov000V3 b) {
    char *obj = *(char **)data_ov000_021c7300;
    struct Ov000Mid *m = (struct Ov000Mid *)(obj + 36);
    m->a = a;
    m->b = b;
}
