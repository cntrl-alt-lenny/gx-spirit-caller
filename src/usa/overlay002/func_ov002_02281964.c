/* func_ov002_02281964: call a helper with a function-pointer literal
 * argument, bail if negative; else index an int-stride-4 array at
 * row+0x120 by the result, extract its 13-bit id, forward through a
 * (unsigned short) cast to a second sink. */
extern char data_ov002_022cf08c[];
extern void func_ov002_02281910(void);
extern int func_ov002_0228d434(int arg0, void *fn, int a, int b);
extern int func_ov002_0227c588(int arg0, int one, unsigned short field);

struct Slot { unsigned int id : 13; };

int func_ov002_02281964(int arg0) {
    int result;
    struct Slot *slot;
    result = func_ov002_0228d434(arg0, (void *)func_ov002_02281910, 1, 1);
    if (result < 0)
        return 0;
    slot = (struct Slot *)(data_ov002_022cf08c + (arg0 & 1) * 0x868 + result * 4 + 0x120);
    return func_ov002_0227c588(arg0, 1, (unsigned short)slot->id) == 0;
}
