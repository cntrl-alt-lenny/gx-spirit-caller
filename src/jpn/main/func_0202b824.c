/* func_0202b824: return entry.w1 bit-field [19:15] (5 bits). Sibling of
 * func_0202b884; see that file for the full w1 bit-field layout.
 */

typedef struct card_entry {
    unsigned int w0;
    unsigned int attr_a : 4;
    unsigned int attr_b : 4;
    unsigned int attr_c : 4;
    unsigned int attr_d : 3;
    unsigned int attr_e : 5;
    unsigned int attr_f : 3;
    unsigned int attr_g : 5;
    unsigned int _pad   : 4;
} card_entry_t;

extern card_entry_t *func_0202b2c8(int id);

unsigned int func_0202b824(int id) {
    return func_0202b2c8(id)->attr_e;
}
