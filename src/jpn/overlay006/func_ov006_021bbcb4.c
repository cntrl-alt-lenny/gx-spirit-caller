/* func_ov006_021bbcb4: jump-table dispatch on p->field_40.
 * Case bodies written in body-ADDRESS order (not ascending case value),
 * per docs/research/codegen-walls.md C-44/C-47: jump-table body layout
 * follows source (case-label) order, not case value.
 *   body order: L_1c0c (case 2,4,5,6,default) -> L_1c14 (case 0,3)
 *               -> L_1c28 (case 1)
 * All paths converge on computing r5, then:
 *   func_0202165c(func_0202160c(p->field_00, 4, 0), 0, 0x801);
 *   func_020221e0(2, p->field_40);
 *   func_020221e0(3, r5);
 *   return 1;
 */

typedef struct {
    int field_00;
    unsigned char _pad_04[0x40 - 4];
    int field_40;
    unsigned char _pad_44[0x50 - 0x44];
    int field_50;
    unsigned char _pad_54[0x5c - 0x54];
    int field_5c;
    unsigned char _pad_60[0x74 - 0x60];
    int field_74;
} obj_021bbdc0_t;

extern int func_0202160c(int a, int b, int c);
extern void func_0202165c(int a, int b, int c);
extern void func_020221e0(int a, int b);

int func_ov006_021bbcb4(obj_021bbdc0_t *p) {
    int cbresult;
    int r5;

    cbresult = func_0202160c(p->field_00, 4, 0);

    switch (p->field_40) {
    case 2:
    case 4:
    case 5:
    case 6:
    default:
        r5 = p->field_50;
        break;
    case 0:
    case 3:
        r5 = p->field_50;
        if (r5 == 4) {
            r5 = p->field_5c + 4;
        }
        break;
    case 1:
        if (p->field_74 != 0) {
            r5 = (p->field_50 == 1) ? 2 : 3;
        } else {
            r5 = (p->field_50 == 1) ? 0 : 1;
        }
        break;
    }

    func_0202165c(cbresult, 0, 0x801);
    func_020221e0(2, p->field_40);
    func_020221e0(3, r5);
    return 1;
}
