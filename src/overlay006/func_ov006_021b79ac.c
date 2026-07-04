/* func_ov006_021b79ac: clear slot's active-bit in the p+0x60b4 stride
 * bitmask table, zero its p+0x5fd0 u16 entry, and Fill32 its p+0x248
 * row (stride 0x124), then notify func_02009278. */
extern void Fill32(int val, void *dst, int n);
extern void func_02009278(int zero, int slot);

int func_ov006_021b79ac(void *p, int slot) {
    int *table;

    Fill32(0, (char *)p + 0x248 + slot * 0x124, 0x124);
    table = (int *)((char *)p + 0xb4 + 0x6000);
    *(unsigned short *)((char *)p + slot * 2 + 0x5fd0) = 0;
    table[slot / 32] &= ~(1 << (slot % 32));
    func_02009278(0, slot);
    return 1;
}
