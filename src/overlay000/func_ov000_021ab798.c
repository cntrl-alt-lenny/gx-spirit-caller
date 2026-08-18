/* func_ov000_021ab798: same stride-family register as func_ov000_021ab520,
 * a packed bitfield word. Bail if the byte0 count is 0; else derive a
 * signed +-16-scaled/255 ratio from fieldA/fieldB and push it to both
 * func_ov000_021ab520 (fixed 0x3f) and func_ov000_021ab5ac (the ratio),
 * then decay byte0 by byte12 (clamped at 0).
 */

typedef struct {
    unsigned int byte0  : 8;
    unsigned int fieldA : 2;
    unsigned int fieldB : 2;
    unsigned int byte12 : 8;
    unsigned int _pad   : 12;
} Bits_ov000_021ab798;

extern Bits_ov000_021ab798 data_ov000_021c7588;
extern void func_ov000_021ab520(int idx, int val);
extern void func_ov000_021ab5ac(int idx, int val);

void func_ov000_021ab798(void) {
    Bits_ov000_021ab798 *v = &data_ov000_021c7588;
    int byte0 = v->byte0;
    int a;
    int factor;
    int div;
    unsigned int raw12;

    if (byte0 == 0) {
        return;
    }

    a = (v->fieldA == 0) ? byte0 : (0xff - byte0);
    factor = (v->fieldB == 0) ? -1 : 1;
    factor = factor << 4;
    div = (a * factor) / 255;
    raw12 = *(unsigned int *)v << 12;

    func_ov000_021ab520(0, 0x3f);
    func_ov000_021ab520(1, 0x3f);
    func_ov000_021ab5ac(0, div);
    func_ov000_021ab5ac(1, div);

    byte0 = byte0 - (int)(raw12 >> 24);
    if (byte0 < 0) {
        byte0 = 0;
    }
    v->byte0 = byte0;
}
