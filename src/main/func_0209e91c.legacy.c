extern void *func_0209dca8(void);
extern int func_0209db88(int count, ...);
extern void func_020928cc(void *ptr, int size);
extern void func_0209de5c(int idx, int b);
/* The original supplies only the one payload word consumed by count=1. */
extern int func_0209dd30();
typedef struct { int f0; unsigned char *inner; } Obj;
int func_0209e91c(int arg, unsigned int index) {
    Obj *obj = func_0209dca8();
    int result = func_0209db88(5, 7, 9, 8, 10, 11);
    if (result != 0) return result;
    if (*(unsigned short *)obj->inner == 7 || *(unsigned short *)obj->inner == 9) {
        if (index < 1 || index > 15) return 6;
        func_020928cc(obj->inner + 0x182, 2);
        if ((*(unsigned short *)(obj->inner + 0x182) & (1 << index)) == 0) return 7;
    } else {
        if (index != 0) return 6;
    }
    func_0209de5c(13, arg);
    result = func_0209dd30(13, 1, 1 << index);
    return result == 0 ? 2 : result;
}
