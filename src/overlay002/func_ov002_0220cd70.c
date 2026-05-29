/* func_ov002_0220cd70: C-39 — guard on helper1(bit0, &func_0202f218) >= 3;
 * else tail helper2(self, arg). Pool word is a function pointer. */
typedef unsigned short u16;
struct S0220cd70 { u16 f0; u16 bit0:1; u16 rest:15; };
extern void func_0202f218(void);
extern int func_ov002_021bc000(int bit0, void *fn);
extern int func_ov002_021ff320(struct S0220cd70 *self, int arg);
int func_ov002_0220cd70(struct S0220cd70 *self, int arg) {
    if (func_ov002_021bc000(self->bit0, (void *)func_0202f218) < 3) return 0;
    return func_ov002_021ff320(self, arg);
}
