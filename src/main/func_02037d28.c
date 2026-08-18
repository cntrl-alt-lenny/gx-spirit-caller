/* func_02037d28: stash a1 into obj->f26, then branch on a 4-bit field
 * packed at bits 20-23 of obj->f34. field==5 drives an anim update
 * (func_020386f4) plus an optional follow-up; field==4 (after an
 * in-progress guard on obj->f68) forwards to func_0203c620; otherwise
 * forwards to func_02087e54. void — the tail calls' return values are
 * left in r0 unused by design (matches the target's no-op epilogue). */
typedef struct Obj02037d28 {
    char          pad_4[0x4];
    void         *f4;      /* +0x4 */
    char          pad_26[0x26 - 0x8];
    unsigned char f26;     /* +0x26 */
    char          pad_34[0x34 - 0x27];
    unsigned int  f34;     /* +0x34 */
    char          pad_68[0x68 - 0x38];
    unsigned short f68;    /* +0x68 */
} Obj02037d28;

extern int  func_02037ca0(void *obj);
extern int  func_020386f4(void *obj, int target, int frames);
extern void func_02087558(void *self, int arg);
extern int  func_0203c620(void *a, int b, int c);
extern void func_02087e54(void *p, int arg1, int arg2);

void func_02037d28(Obj02037d28 *obj, int a1, int a2) {
    obj->f26 = (unsigned char)a1;
    int field = (obj->f34 >> 20) & 0xf;
    if (field == 5) {
        int result = func_02037ca0(obj);
        func_020386f4((char *)obj + 0x40, result, a2);
        if (a2 != 0) {
            return;
        }
        func_02087558(obj->f4, result);
        return;
    }
    if (obj->f68 & 0x6000) {
        return;
    }
    if (field == 4) {
        int result2 = func_02037ca0(obj);
        func_0203c620(obj->f4, result2, a2);
        return;
    }
    int result3 = func_02037ca0(obj);
    func_02087e54((char *)obj + 0x4, result3, a2);
}
