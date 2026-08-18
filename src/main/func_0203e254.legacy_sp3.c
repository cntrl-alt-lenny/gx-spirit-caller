/* func_0203e254: fetch the shared 0x10-slot scratch object and dispatch
 * on selector a0 (0/1/2/other) to (re)initialize its d0f/d10 status
 * bytes, returning the final d10 byte. Style B epilogue with a pure-
 * padding sub sp,#4 (no r3 spill, no real local ever touched) =>
 * legacy_sp3 routing. */
typedef struct Obj0203e254 {
    char          pad_d0f[0xd0f];
    unsigned char f_d0f;  /* +0xd0f */
    unsigned char f_d10;  /* +0xd10 */
} Obj0203e254;

extern void *func_0203c900(int a);
extern void  Fill32(unsigned int value, void *dest, int size_bytes);
extern int   func_0203e198(void *p);
extern int   func_0203def0(void *p);
extern int   func_0203deac(void *p);
extern int   func_0203e0a0(void *p);

int func_0203e254(int a0) {
    void *raw = func_0203c900(0x10);
    Obj0203e254 *obj = (Obj0203e254 *)raw;
    switch (a0) {
    case 0:
        Fill32(0, (char *)raw + 0x300, 0x144);
        obj->f_d10 = (unsigned char)func_0203e198(raw);
        break;
    case 1:
        obj->f_d10 = (unsigned char)func_0203def0(raw);
        obj->f_d0f = (unsigned char)func_0203deac(raw);
        break;
    case 2:
        Fill32(0, (char *)raw + 0x300, 0x144);
        obj->f_d0f = 0;
        obj->f_d10 = (unsigned char)func_0203e0a0(raw);
        break;
    default:
        break;
    }
    return obj->f_d10;
}
