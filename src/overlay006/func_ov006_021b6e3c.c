/* func_ov006_021b6e3c: leaf, no callees (C-71: no prologue/epilogue signal
 * for tier). Jump-table dispatch on idx: cases 0-4 select a VRAM sub-bank
 * address; idx>=5 (or negative, via the unsigned LS bounds check) falls
 * through with the address left unset -- only safe because the shared tail
 * can early-return via the count<=0 path before ever reading it. Then reads
 * a u16 "count" from a parallel table (offset +0x62 when flag==0 or idx==0,
 * else +0x6c), and linearly searches `count` u16 values (stride 4 bytes)
 * starting at the selected address for `target`, returning the found index
 * or 0.
 */
int func_ov006_021b6e3c(void *base_, int idx, int target, int flag) {
    char *base = (char *)base_;
    unsigned short *addr;
    int count;
    int i;

    switch (idx) {
    case 0:
        addr = (unsigned short *)(base + 0x198 + 0x9800);
        break;
    case 1:
        if (flag != 0) {
            addr = (unsigned short *)(base + 0x158 + 0xb400);
        } else {
            addr = (unsigned short *)(base + 0x358 + 0xb000);
        }
        break;
    case 2:
        if (flag != 0) {
            addr = (unsigned short *)(base + 0x358);
        } else {
            addr = (unsigned short *)(base + 0x158);
        }
        addr = (unsigned short *)((char *)addr + 0xb800);
        break;
    case 3:
        if (flag != 0) {
            addr = (unsigned short *)(base + 0x158 + 0xc000);
        } else {
            addr = (unsigned short *)(base + 0x358 + 0xbc00);
        }
        break;
    case 4:
        if (flag != 0) {
            addr = (unsigned short *)(base + 0x158 + 0xc400);
        } else {
            addr = (unsigned short *)(base + 0x58 + 0xc400);
        }
        break;
    }

    if (flag != 0 && idx != 0) {
        count = *(unsigned short *)(base + idx * 2 + 0xc600 + 0x6c);
    } else {
        count = *(unsigned short *)(base + idx * 2 + 0xc600 + 0x62);
    }

    for (i = 0; i < count; i++) {
        if (*addr == target) break;
        addr += 2;
    }
    if (i >= count) i = 0;
    return i;
}
