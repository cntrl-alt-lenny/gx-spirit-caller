/* func_ov002_0228db80: node = (CE288->f_48c - 0x18) as a list-node pointer;
 * bail (return 0) if node is null or if node->b0 == arg0. Else scan
 * idx=0..node->cnt-1 (8-bit count field at +6) via
 * func_ov002_0223dda4(node, idx) -> packed (lo=byte0, hi=byte1); return 1
 * on the first (byte0==arg0 && byte1==arg1) match, else 0. */
#include "ov002_core.h"

typedef unsigned short u16;

struct DcNode {
    u16 f0;
    u16 b0 : 1;
    char _pad4[2];
    u16 cnt : 8;
};

int func_ov002_0228db80(int arg0, int arg1) {
    struct DcNode *node = (struct DcNode *)(CE288->f_48c - 0x18);
    int i;
    if (node == 0) goto fail;
    if (node->b0 == arg0) goto fail;
    for (i = 0; i < node->cnt; i++) {
        unsigned int packed = func_ov002_0223dda4(node, i);
        int byte0 = packed & 0xff;
        int byte1 = ((unsigned short)packed >> 8) & 0xff;
        if (byte0 == arg0 && byte1 == arg1) return 1;
    }
fail:
    return 0;
}
