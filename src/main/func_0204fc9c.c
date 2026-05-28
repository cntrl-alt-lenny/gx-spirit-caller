/* func_0204fc9c: C-42 — helper(self)+byte-check+helper(self).
 *
 *   push {r4, lr}; mov r4, r0
 *   bl func_020498f0; ldrb r0, [r0, #424]
 *   cmp r0, #2; popeq                   ; if byte == 2 return 2 (r0 already 2)
 *   mov r0, r4; bl func_0204cc20; pop
 */

extern unsigned char *func_020498f0(void);
extern int func_0204cc20(void *self);

int func_0204fc9c(void *self) {
    int t = func_020498f0()[424];
    if (t == 2) return t;
    return func_0204cc20(self);
}
