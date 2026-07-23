typedef void (*Fn)(int, int, int);

typedef struct {
    Fn fn0;
} Inner_02102958;

typedef struct {
    char pad[8];
    Inner_02102958 *inner;
} Outer_02102958;

extern Outer_02102958 data_02102958;

void func_020a71e4(int a0, int a1, int a2) {
    data_02102958.inner->fn0(a0, a1, a2);
}
