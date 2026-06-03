/* func_ov000_021ab8b4: clear the blend bits of the main/sub master-bright reg. */
void func_ov000_021ab8b4(int which) {
    switch (which) {
    case 0: *(volatile unsigned short *)0x04000050 &= ~0xc0; break;
    case 1: *(volatile unsigned short *)0x04001050 &= ~0xc0; break;
    }
}
