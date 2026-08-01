/* func_0208dce4: leaf function (no push/pop), plain default tier.
 * Per-bit VRAM/WRAM control register writes: sets 0x80 into each
 * bank's control byte (0x04000240-246, 248, 249 -- skipping 247)
 * whose corresponding bit is set in the mask argument.
 */

void func_0208dce4(int mask) {
    if (mask & 0x1)
        *(volatile unsigned char *)0x04000240 = 0x80;
    if (mask & 0x2)
        *(volatile unsigned char *)0x04000241 = 0x80;
    if (mask & 0x4)
        *(volatile unsigned char *)0x04000242 = 0x80;
    if (mask & 0x8)
        *(volatile unsigned char *)0x04000243 = 0x80;
    if (mask & 0x10)
        *(volatile unsigned char *)0x04000244 = 0x80;
    if (mask & 0x20)
        *(volatile unsigned char *)0x04000245 = 0x80;
    if (mask & 0x40)
        *(volatile unsigned char *)0x04000246 = 0x80;
    if (mask & 0x80)
        *(volatile unsigned char *)0x04000248 = 0x80;
    if (mask & 0x100)
        *(volatile unsigned char *)0x04000249 = 0x80;
}
