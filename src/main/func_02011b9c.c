typedef unsigned short u16;

typedef struct {
    unsigned int n0;
    unsigned int n1;
    unsigned int n2;
    u16 a0[0x50];
    u16 a1[0xf];
    u16 a2[0x1f];
} Out;

typedef struct {
    char _pad[8];
    u16 n0;
    u16 data[1];
} Src;

extern Src *func_02006c0c(int a, int b, int c);
extern void func_0209448c(int val, void *dest, unsigned int size);
extern void Task_Invoke(void *p);

int func_02011b9c(Out *out, int id) {
    Src *src = func_02006c0c(id, 4, 0);
    u16 *p;
    unsigned int i;

    func_0209448c(0, out, 0x108);
    out->n0 = src->n0;
    p = src->data;
    for (i = 0; i < out->n0; i++) {
        out->a0[i] = *p++;
    }
    out->n2 = *p++;
    for (i = 0; i < out->n2; i++) {
        out->a2[i] = *p++;
    }
    out->n1 = *p++;
    for (i = 0; i < out->n1; i++) {
        out->a1[i] = *p++;
    }
    Task_Invoke(src);
    return 1;
}
