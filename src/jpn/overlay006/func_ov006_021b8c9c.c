/* func_ov006_021b8c9c: card sort-key -> stride bitmask table bit test.
 * table = data_ov006_0224f2c0[1]; returns table[key*2 + slot/32] & (1 << slot%32). */
extern unsigned short func_0202b060(int id);
extern int data_ov006_0224f2c0[];

int func_ov006_021b8c9c(int id, int slot) {
    int key = func_0202b060(id);
    return ((int (*)[2])data_ov006_0224f2c0[1])[key][slot / 32] & (1 << slot % 32);
}
