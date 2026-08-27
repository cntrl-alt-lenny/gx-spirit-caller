struct SlotId {
    unsigned int id     : 13;
    unsigned int flag13 : 1;
    unsigned int _pad14 : 8;
    unsigned int val8   : 8;
    unsigned int _pad30 : 2;
};

extern int func_ov002_021c9310(void *self, int kind, int arg1);
extern void func_ov002_021d7a54(void *self, void *node, int flag);
extern int func_ov002_021b3ef8(int a, int b, int c, int d);
extern void func_ov002_021df5e4(void *self, int a);
extern void func_ov002_021df848(void *self, int a, int b, int c);

/* func_ov002_021d7b98: on arg1>=0, spawn/find a node via
 * func_ov002_021c9310(self,11,arg1), attach via func_ov002_021d7a54, then
 * decode the node's packed id-word's flag13/val8 composite (same shape as
 * the per-player slot id-word family) and gate func_ov002_021b3ef8(self,11,
 * 0x1379,composite); on success, func_ov002_021df5e4(self,0x1379) then
 * func_ov002_021df848(self,2000,0,0x1379). */
void func_ov002_021d7b98(void *self, int arg1) {
    if (arg1 < 0)
        return;

    void *node = (void *)func_ov002_021c9310(self, 11, arg1);
    func_ov002_021d7a54(self, node, 0);

    struct SlotId *slot = (struct SlotId *)node;
    int composite = slot->flag13 + (slot->val8 << 1);

    if (func_ov002_021b3ef8(self, 11, 0x1379, composite) == 0)
        return;

    func_ov002_021df5e4(self, 0x1379);
    func_ov002_021df848(self, 2000, 0, 0x1379);
}
