/* func_0207c990: take a reference on o for func_01ff8180: claim an unowned
 * slot (f8) for it, or add a reference when it already owns it; 1 on
 * success, 0 when another owner holds the slot. */
typedef struct {
    unsigned char _pad_00[8];
    void (*owner)(void);
    int refs;
} Obj;
extern void func_01ff8180(void);

int func_0207c990(Obj *o) {
    if (o->owner == 0) {
        o->owner = func_01ff8180;
        o->refs++;
        return 1;
    }
    if (o->owner == func_01ff8180) {
        o->refs++;
        return 1;
    }
    return 0;
}
