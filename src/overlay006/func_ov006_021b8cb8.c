/* func_ov006_021b8cb8: release and clear the two handle slots at base+0xca88 /
 * +0xca8c (if live); return 1. */
extern void Task_Invoke(int h);
int func_ov006_021b8cb8(char *base) {
    if (*(int *)(base + 0xca88) != 0) {
        Task_Invoke(*(int *)(base + 0xca88));
        *(int *)(base + 0xca88) = 0;
    }
    if (*(int *)(base + 0xca8c) != 0) {
        Task_Invoke(*(int *)(base + 0xca8c));
        *(int *)(base + 0xca8c) = 0;
    }
    return 1;
}
