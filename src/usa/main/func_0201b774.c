/* func_0201b774: if bit 1 of state[0x8e0] is set, return; else copy u16
 * slice of state[0x8d4] into state[0x8dc].
 */

extern char *GetSystemWork(void);

void func_0201b774(void) {
    char *state = GetSystemWork();
    unsigned int bit1 = ((unsigned int)(*(int *)(state + 0x8e0)) << 30) >> 31;
    if (bit1) return;
    *(int *)(state + 0x8dc) =
        ((unsigned int)(*(int *)(state + 0x8d4)) << 16) >> 16;
}
