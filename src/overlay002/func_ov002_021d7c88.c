struct SlotId {
    unsigned int id     : 13;
    unsigned int flag13 : 1;
    unsigned int _pad14 : 8;
    unsigned int val8   : 8;
    unsigned int _pad30 : 2;
};

extern int func_ov002_021c93f0(void *self, int kind, int arg1);
extern void func_ov002_021d7b44(void *self, void *node, int flag);
extern int func_ov002_021b3fd8(int a, int b, int c, int d);
extern void func_ov002_021df6d4(void *self, int a);
extern void func_ov002_021df938(void *self, int a, int b, int c);

/* func_ov002_021d7c88: on arg1>=0, spawn/find a node via
 * func_ov002_021c93f0(self,11,arg1), attach via func_ov002_021d7b44, then
 * decode the node's packed id-word's flag13/val8 composite (same shape as
 * the per-player slot id-word family) and gate func_ov002_021b3fd8(self,11,
 * 0x1379,composite); on success, func_ov002_021df6d4(self,0x1379) then
 * func_ov002_021df938(self,2000,0,0x1379). */
void func_ov002_021d7c88(void *self, int arg1) {
    if (arg1 < 0)
        return;

    void *node = (void *)func_ov002_021c93f0(self, 11, arg1);
    func_ov002_021d7b44(self, node, 0);

    struct SlotId *slot = (struct SlotId *)node;
    int composite = slot->flag13 + (slot->val8 << 1);

    if (func_ov002_021b3fd8(self, 11, 0x1379, composite) == 0)
        return;

    func_ov002_021df6d4(self, 0x1379);
    func_ov002_021df938(self, 2000, 0, 0x1379);
}
