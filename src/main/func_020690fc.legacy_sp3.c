typedef struct { char pad[0x14]; unsigned char flags, flags2; } Rec;
typedef struct { char pad0[0x10]; int active; char pad14[0x2c]; int f40; char pad44[8]; int f4c; char pad50[0x49c]; int f4ec; char pad4f0[0x130]; int f620, f624, f628; unsigned short f62c; char pad62e[2]; void (*callback)(void *, int, Rec *, int); int arg; } Obj;
typedef struct { int a; void *p; } Context;
typedef struct { char _0[0x14]; unsigned char flags; } rec_0206803c_t;
typedef struct { char _0[4]; int max; char _8[8]; int active; int queue[2]; } obj_0206803c_t;
struct S;
extern int func_02054140(void *p);
extern void func_02067b54(void *self, int param2);
extern void func_0206803c(obj_0206803c_t *o, rec_0206803c_t *rec, int front, int mode);
extern void func_02068114(void *p, int value);
extern void func_0206aa68(struct S *p);
void func_020690fc(Context *ctx, unsigned int state, Rec *rec, Obj *o) {
    int mode;
    switch (state) {
    case 0:
        o->callback(o, 0, rec, o->arg);
        if ((rec->flags & 3) && (rec->flags & 0x40)) break;
        if (rec->flags & 0x2c) break;
        if (o->f624) break;
        if (rec->flags2 & 1) {
            if (!o->f4c || !o->f40) mode = 1;
            else mode = 0;
        } else mode = 2;
        func_0206803c((obj_0206803c_t *)o, (rec_0206803c_t *)rec, 0, mode);
        break;
    case 1:
        if (!(rec->flags & 0x43)) o->callback(o, 2, rec, o->arg);
        else o->callback(o, 1, rec, o->arg);
        break;
    case 2:
        if (rec->flags & 0x2c) func_02067b54(o, (int)rec);
        o->callback(o, 3, rec, o->arg);
        break;
    case 3:
        if (o->f620) func_0206aa68((struct S *)ctx);
        if (!func_02054140(ctx->p) || !o->active) o->callback(o, 4, 0, o->arg);
        break;
    case 5: o->callback(o, 5, 0, o->arg); break;
    case 6: func_02068114(o, o->f4ec); break;
    }
    if (rec && *(int *)rec == o->f628 && *(unsigned short *)((char *)rec + 4) == o->f62c) o->f628 = 0;
}
