/* func_ov003_021ced78: poll the touch UI — done (1) if no touch session is open;
 * not-done (0) if the pen is still down; once released, decode the gesture packet
 * and apply it to the scene state (+0x48/0x4c/0x54/0x58/0x5c), then report done.
 * (ov003_core.h) */
extern int func_02034734(void);
extern int func_02034768(void);
extern int func_0203499c(int, void *);
extern char data_ov003_021cf580[];
int func_ov003_021ced78(void) {
    short pkt[0x10];
    if (func_02034734() == 0)
        return 1;
    if (func_02034768() == 0)
        return 0;
    {
        char *s = data_ov003_021cf580;
        if (func_0203499c(4, pkt) == 0)
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
