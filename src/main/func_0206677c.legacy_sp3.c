/* func_0206677c: mark a1 busy (field_800=1), stamp byte0='\', run
 * func_020667e8 three times (modes 0,1,2), announce to func_02067294,
 * then release the busy mark (field_800-=1). */

extern void func_020667e8(void *a0, void *a1, int mode);
extern void func_02067294(void *a1, void *data);
extern char data_02101750[];

typedef struct {
    char byte0;
    unsigned char _pad_1[0x7ff];
    int field_800;
} Obj_0206677c_t;

void func_0206677c(void *a0, Obj_0206677c_t *a1) {
    a1->field_800 = 1;
    a1->byte0 = 0x5c;
    func_020667e8(a0, a1, 0);
    func_020667e8(a0, a1, 1);
    func_020667e8(a0, a1, 2);
    func_02067294(a1, data_02101750);
    a1->field_800 -= 1;
}
