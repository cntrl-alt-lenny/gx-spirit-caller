typedef void (*Fn02102958)(int, int);

typedef struct {
    Fn02102958 f0;
    Fn02102958 f1;
} VTable02102958;

typedef struct {
    int p0;
    int p1;
    VTable02102958 *vt;
} Data02102958_724c;

extern Data02102958_724c data_02102958;

void func_020a724c(int a, int b) {
    data_02102958.vt->f1(a, b);
}
