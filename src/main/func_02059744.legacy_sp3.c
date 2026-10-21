typedef struct { char pad0[0x10c]; int mode; char name[0x1f]; char text[0x15]; char path[0x33]; char extra[0x1f]; char pad1[0x42]; int state; } Owner;
typedef struct { int f0, f4, active, fc, f10, f14, id, status; void *next; } Node;
extern int func_020453e8(int a);
extern char *func_02055298(char *str);
extern int func_02056594(Owner **pp);
extern int func_020560a8(Owner **pp, int wait);
extern void func_020586c8(Owner **pp, int flag);
extern int func_0205999c(Owner **pp, Node *node);
extern int func_0205be60(void *obj, int a1, int a2, void **out, int a4, int a5, int a6);
extern int func_0205bf18(Owner **pp, Node *node);
extern int func_0205ffc0(int *p, int b);
extern void func_020604b0(char *dst, char *src, int n);
extern int func_020a73d4(int x, int unused1, int unused2);
extern char data_021005bc[], data_021005d0[], data_02100504[];
int func_02059744(Owner **pp, char *name, char *text, char *path, char *extra, char *a, char *b, char *c, int mode, int flag, int active, int callback, int arg) {
    Owner *ctx = *pp;
    char *buf;
    Node *node;
    int result;
    if (ctx->state == 4) {
        result = func_02056594(pp);
        if (result != 0) return result;
    }
    if (ctx->state != 0) {
        func_0205ffc0((int *)pp, (int)data_021005bc);
        return 2;
    }
    switch (mode) {
    case 1: ctx->mode = 1; break;
    case 0: ctx->mode = 0; break;
    default: func_0205ffc0((int *)pp, (int)data_021005d0); return 2;
    }
    ctx->mode = 1;
    func_020604b0(ctx->name, name, 0x1f);
    func_020604b0(ctx->text, text, 0x15);
    func_020604b0(ctx->path, path, 0x33);
    func_020604b0(ctx->extra, extra, 0x1f);
    func_02055298(ctx->path);
    buf = (char *)func_020453e8(0x308);
    if (buf == 0) { func_0205ffc0((int *)pp, (int)data_02100504); return 1; }
    func_020a73d4((int)buf, 0, 0x308);
    *(int *)(buf + 0x304) = flag;
    if (*(signed char *)a != 0 && *(signed char *)b != 0) {
        func_020604b0(buf + 0xc2, a, 0x100);
        func_020604b0(buf + 0x1c2, b, 0x100);
    }
    if (c != 0) func_020604b0(buf + 0x2c2, c, 0x41);
    result = func_0205be60(pp, 0, (int)buf, (void **)&node, active, callback, arg);
    if (result != 0) return result;
    result = func_0205999c(pp, node);
    if (result != 0) {
        node->status = result;
        func_0205bf18(pp, node);
        func_020586c8(pp, 0);
        return result;
    }
    if (node->active != 0) {
        result = func_020560a8(pp, node->id);
        if (result != 0) return result;
    }
    return 0;
}

