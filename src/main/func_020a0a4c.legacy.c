typedef unsigned short u16;
typedef struct {
    char pad[0x14e8];
    int kinds[15];
} State;
extern State *data_021a98fc;
extern void func_0209448c(int, int, int);
extern int func_020a0bd8(void);
extern int func_020a0f38(int);
extern int func_020a10e8(int a, int b);
int func_020a0a4c(void) {
    u16 masks[5];
    u16 i;
    int result;
    func_0209448c(0, (int)masks, 10);
    for (i = 1; i <= 15; i++) {
        switch (data_021a98fc->kinds[i - 1]) {
        case 2: masks[0] |= 1 << i; break;
        case 5: masks[1] |= 1 << i; break;
        case 4: masks[2] |= 1 << i; break;
        case 8: masks[3] |= 1 << i; break;
        case 11: masks[4] |= 1 << i; break;
        }
    }
    if (masks[3]) result = func_020a10e8(5, masks[3]);
    else if (masks[0]) result = func_020a10e8(1, masks[0]);
    else if (masks[4]) result = func_020a10e8(6, masks[4]);
    else if (masks[2]) result = func_020a10e8(2, masks[2]);
    else if (masks[1]) result = func_020a0f38(masks[1]);
    else result = func_020a0bd8();
    if (result == 21) result = func_020a10e8(0, 65535);
    return result;
}
