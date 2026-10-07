typedef struct {
    int f0;
    int f4;
    short next;
    short f0a;
} Node_02005e20;

typedef struct {
    int a;
    int b;
} Out_02005e20;

typedef struct Pool_02005e20 Pool_02005e20;
struct Pool_02005e20 {
    Out_02005e20 out[128];
    Node_02005e20 nodes[128];
    unsigned short head;
    short tbl[32];
    char pad[0xa48 - 0xa42];
    void (*fn)(Pool_02005e20 *, int, int);
};

extern Pool_02005e20 *data_02103d6c[];
extern void func_020944a4(void *src, void *dst, int n);
extern void func_02092904(void *p, int n);

void func_02005e20(int which) {
    Pool_02005e20 *p;
    int i;
    int cnt;
    int idx;

    switch (which) {
    case 1:
        p = data_02103d6c[0];
        break;
    case 2:
        p = data_02103d6c[1];
        break;
    default:
        p = 0;
        break;
    }
    cnt = 0;
    for (i = 0; i < 32; i++) {
        idx = p->tbl[i];
        while (idx != -1) {
            func_020944a4(&p->nodes[idx], &p->out[cnt++], 6);
            idx = p->nodes[idx].next;
        }
    }
    func_02092904(p, 0x400);
    p->fn(p, 0, 0x400);
}
