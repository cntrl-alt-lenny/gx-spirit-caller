/* func_ov002_0220b068: C-42 — sibling of 0220886c (different fn-ptr). */

extern int func_ov002_02257790(void *self, void *fn);
extern void func_ov002_021ea2a0(void);

int func_ov002_0220b068(void *self) {
    return func_ov002_02257790(self, (void *)func_ov002_021ea2a0) > 0;
}
