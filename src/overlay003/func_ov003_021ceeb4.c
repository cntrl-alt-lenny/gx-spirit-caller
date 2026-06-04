/* func_ov003_021ceeb4: poll the touch UI — done (1) if no touch session is open;
 * not-done (0) if the pen is still down; once released, decode the gesture packet
 * and apply it to the scene state (+0x48/0x4c/0x54/0x58/0x5c), then report done.
 * (ov003_core.h) */
extern int func_02034784(void);
extern int func_020347b8(void);
extern int func_020349ec(int, void *);
extern char data_ov003_021cf6c0[];
int func_ov003_021ceeb4(void) {
    short pkt[0x10];
    if (func_02034784() == 0)
        return 1;
    if (func_020347b8() == 0)
        return 0;
    {
        char *s = data_ov003_021cf6c0;
        if (func_020349ec(4, pkt) == 0)
            return 1;
        switch ((unsigned short)pkt[0]) {
        case 0:
            *(int *)(s + 0x54) = 1;
            *(int *)(s + 0x48) = (unsigned short)pkt[1];
            break;
        case 1:
            *(int *)(s + 0x4c) = (unsigned short)pkt[1] ^ 1;
            break;
        case 2:
            *(int *)(s + 0x58) = 1;
            *(int *)(s + 0x4c) = (unsigned short)pkt[1] ^ 1;
            break;
        case 3:
            *(int *)(s + 0x5c) = 1;
            break;
        }
        return 1;
    }
}
