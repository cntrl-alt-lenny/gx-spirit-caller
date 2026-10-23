typedef struct { signed char *data; int unk4; int size; int used; } SendBuffer;
typedef struct { unsigned char *data; int size; int used; } RecvBuffer;
typedef struct Session { char pad[0x1d4]; int sock, state; RecvBuffer recv; int unk1e8; unsigned char *line; int capacity; SendBuffer send; } Session;
typedef struct Owner Owner;
typedef struct Root2 Root2;
typedef struct Node2 Node2;
extern int func_020453cc(int x, int y);
extern void func_02055324(void *p);
extern int func_02056d1c(int *ctx, unsigned char *line);
extern int func_02057980(void *ctx, int sock, SendBuffer *buf, int *out, int compact, char *name);
extern int func_02057b00(int *ctx, int sock, RecvBuffer *buf, int *out, int *done, char *name);
extern void func_020585d4(void *ctx, int a, int b);
extern int func_0205aecc(Session **pp, void *out);
extern int func_0205bc24(int *ctx, Node2 *node, unsigned char *line);
extern int func_0205bccc(Owner **pp);
extern int func_0205bd0c(Root2 **pp, Node2 **out, int key);
extern int func_0205ffc0(int *p, int b);
extern void func_0205ffd4(int *a0, int a1, int a2);
extern int func_020603cc(char **ctx, char *line, int check);
extern void func_020604a4(int a, ...);
extern void *func_020a7368(void *dst, signed char *src, int count);
extern signed char *func_020a7388(signed char *dst, signed char *src, int n);
extern int func_020ab054(unsigned char *s1, unsigned char *s2, int n);
extern unsigned char *func_020ab0c4(unsigned char *haystack, const unsigned char *needle);
/* This caller supplies only r0, unlike the four-argument C thunk definition. */
extern int func_020ace00();
extern char data_020ffe54[], data_020ffe58[];
extern unsigned char data_020ffe84[], data_020ffe8c[], data_020ffe98[], data_020ffea8[], data_020ffeb0[], data_020ffed8[], data_020ffee0[], data_020ffee8[], data_020fff18[];
int func_02056264(int *ctx) {
    Node2 *node;
    int length;
    int done = 0;
    Session *s = *(Session **)ctx;
    int result;
    unsigned char *p;
    do {
        func_0205aecc((Session **)ctx, &s->send);
        result = func_02057980(ctx, s->sock, &s->send, &done, 1, data_020ffe54);
        if (result != 0) return result;
        result = func_02057b00(ctx, s->sock, &s->recv, &length, &done, data_020ffe54);
        if (result != 0) {
            if (result != 3) return result;
            func_0205ffd4(ctx, 5, (int)data_020ffe58);
            func_020585d4(ctx, 3, 1);
            return 3;
        }
        while ((p = func_020ab0c4(s->recv.data, data_020ffe84)) != 0) {
            *p = 0;
            func_020604a4((int)ctx, data_020ffe8c, s->recv.data);
            length = p - s->recv.data;
            if (length > s->capacity) {
                int growth = length;
                unsigned char *newbuf;
                if (growth < 0x800) growth = 0x800;
                s->capacity += growth;
                newbuf = (unsigned char *)func_020453cc((int)s->line, s->capacity + 1);
                if (newbuf == 0) {
                    func_0205ffc0(ctx, (int)data_020ffe98);
                    return 1;
                }
                s->line = newbuf;
            }
            func_020a7368(s->line, (signed char *)s->recv.data, length + 1);
            s->recv.used -= (p + 7) - s->recv.data;
            func_020a7388((signed char *)s->recv.data, (signed char *)(p + 7), s->recv.used + 1);
            p = s->line;
            {
                unsigned char *q = func_020ab0c4(p, data_020ffea8);
                if (q != 0) {
                    int key = func_020ace00((int)(q + 4));
                    if (func_0205bd0c((Root2 **)ctx, &node, key) == 0) {
                        func_020604a4((int)ctx, data_020ffeb0, key);
                    } else {
                        result = func_0205bc24(ctx, node, s->line);
                        if (result != 0) return result;
                    }
                } else {
                    if (func_020603cc((char **)ctx, (char *)p, 1) != 0) return 4;
                    p = s->line;
                    if (func_020ab054(p, data_020ffed8, 4) == 0) {
                        result = func_02056d1c(ctx, p);
                        if (result != 0) return result;
                    } else if (func_020ab054(p, data_020ffee0, 10) != 0) {
                        func_020604a4((int)ctx, data_020ffee8);
                    }
                }
            }
        }
        if (done != 0) {
            s->state = 4;
            func_0205ffd4(ctx, 7, (int)data_020fff18);
            func_020585d4(ctx, 3, 1);
            return 0;
        }
        result = func_0205bccc((Owner **)ctx);
        if (result != 0) func_02055324((void *)10);
    } while (result != 0);
    return 0;
}

