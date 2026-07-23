typedef int (*Fn)(int, int);

typedef struct {
    char pad[4];
    Fn fn4;
} Inner_02102958;

typedef struct {
    char pad[8];
    Inner_02102958 *inner;
} Outer_02102958;

extern Outer_02102958 data_02102958;

int func_020a724c(int a0, int a1, int a2) {
    return data_02102958.inner->fn4(a0, a1);
}
