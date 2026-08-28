/* func_ov002_0220a700: field6 dispatch + state==2 guard + ternary-mapped call.
 *   if (field6(u16@+2) == 0x23) return 0;
 *   if (*(int*)(d016c+0xcf8) != 2)  return 0;
 *   return func_0220803c(self, x) ? 2 : 0;   (movne#2; moveq#0)
 *
 * C-14 lever (docs/research/codegen-walls.md): the orig picks r2 (not the
 * natural r1) for the cmp/load scratch across both predicated early
 * returns -- the target asm never sets up an extra register before the
 * final `bl`, meaning a second incoming arg `x` is already sitting in r1
 * and flows through untouched. A 2-arg signature with x actually used at
 * the call site (not merely declared) is what excludes r1 from the
 * scratch pool.
 */
extern char data_ov002_022d008c[];
extern int func_ov002_02207f4c(void *self, int x);

int func_ov002_0220a700(void *self, int x) {
    unsigned short v = *(unsigned short *)((char *)self + 2);
    if (((unsigned)(v << 0x14) >> 0x1a) == 0x23) return 0;
    if (*(int *)(data_ov002_022d008c + 0xcf8) != 2) return 0;
    return func_ov002_02207f4c(self, x) ? 2 : 0;
}
