/* func_02001c98: Two adjacent 4-bit field updates at bits 17-20 and 21-24.
 * C-22 adjacent-bitfield recipe (brief 084).
 */

typedef union {
    unsigned int word;
    struct {
        unsigned int lo : 17;
        unsigned int f_a : 4;
        unsigned int f_b : 4;
        unsigned int hi : 7;
    } b;
} bitfield_38_t;

typedef struct {
    char         _pad0[0x4];
    unsigned int f_4;
    unsigned int f_8;
    char         _pad1[0x2c];
    bitfield_38_t f_38;
} state_02102c7c_t;

extern state_02102c7c_t data_02102c7c;

void func_02001c98(unsigned int a, unsigned int b) {
    data_02102c7c.f_38.b.f_a = a;
    data_02102c7c.f_38.b.f_b = b;
    data_02102c7c.f_8 = a;
    data_02102c7c.f_4 = b;
}
