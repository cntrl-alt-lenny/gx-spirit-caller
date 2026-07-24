/* func_ov002_02295b08: two-call guard, shared ret-0 (.L_1b8).
 *
 *     ldrh; b0 ; bl func_02259f74(b0); cmp#0; beq .L_1b8   -> ret != 0
 *     ldrh; 1-b0 ; bl func_021bbf50(1-b0); cmp#0; moveq#1; popeq -> if(==0) return 1
 *  .L_1b8: mov r0,#0; pop
 */

typedef unsigned short u16;

struct FuncOv00202295b08Self { u16 f0; u16 b0 : 1; };

extern int func_ov002_021bbf50(unsigned int v);
extern int func_ov002_02259f74(unsigned int b0);

int func_ov002_02295b08(struct FuncOv00202295b08Self *self) {
    if (func_ov002_02259f74(self->b0) != 0) {
        if (func_ov002_021bbf50(1 - self->b0) == 0) return 1;
    }
    return 0;
}
