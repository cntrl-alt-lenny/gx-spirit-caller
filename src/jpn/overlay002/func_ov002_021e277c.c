/* func_ov002_021e277c: pack a card-list word + a flag into func_ov002_021d46ac
 * (27 band-callers; tail-call). Splits data_ov002_022d008c.f3300 into its low
 * and high u16 halves (args 2 and 3) and OR-folds a 0x8000 "set" bit (from
 * arg0) with the 0x54 command code into arg 1.
 */

struct d016c { char _pad[3300]; unsigned int f3300; };

extern struct d016c data_ov002_022d008c;
extern int func_ov002_021d46ac(int a, int b, int c, int d);

int func_ov002_021e277c(int arg0) {
    unsigned int v = data_ov002_022d008c.f3300;
    return func_ov002_021d46ac((unsigned short)((arg0 ? 0x8000 : 0) | 0x54),
                               (unsigned short)v,
                               (unsigned short)(v >> 16),
                               0);
}
