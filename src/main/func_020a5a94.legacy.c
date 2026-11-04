extern unsigned char *data_021a9924;
extern struct { int stride,count; } data_021a9928;
extern void func_02094688(const void *src, void *dst, unsigned int size);
extern int func_020a5a34(int id);
unsigned char *func_020a5a94(unsigned char *a, int id) {
 unsigned char n;
 int i;
 int off;
 if (data_021a9924 == 0) return 0;
 n = a[2];
 if (n > data_021a9928.count) return 0;
 i = id - 1;
 off = i << 5;
 func_02094688(a + 3, data_021a9924 + off + n*data_021a9928.stride, data_021a9928.stride);
 *(unsigned int *)(data_021a9924 + 0x1e0 + i*4) |= 1 << n;
 if (func_020a5a34(id)) return data_021a9924 + off;
 return 0;
}
