/* func_02062fc0: build a local event {f0=a0->field_58, f4=a2, f8=a1,
 * fc=func_02055330(a0->field_58)}, post it to a0->field_60's queue via
 * func_0205407c, and confirm the queue's count grew by exactly 1. */

extern int func_02055330(int a0);
extern int func_02054140(void *queue);
extern void func_0205407c(void *queue, void *evt);

typedef struct {
    int f0;
    int f4;
    short f8;
    int fc;
} Event_02062fc0_t;

typedef struct {
    unsigned char _pad_00[0x58];
    int field_58;
    unsigned char _pad_5c[0x4];
    void *field_60;
} Obj_02062fc0_t;

int func_02062fc0(Obj_02062fc0_t *a0, short a1, int a2) {
    Event_02062fc0_t evt = {0};
    int f58 = a0->field_58;
    int before;
    int after;

    evt.f0 = f58;
    evt.f4 = a2;
    evt.f8 = a1;
    evt.fc = func_02055330(f58);

    before = func_02054140(a0->field_60);
    func_0205407c(a0->field_60, &evt);
    after = func_02054140(a0->field_60);
    return (before + 1) == after;
}
