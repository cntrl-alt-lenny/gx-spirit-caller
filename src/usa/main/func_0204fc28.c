/* func_0204fc28: C-42 — helper(self)+byte-check+helper(self).
 *
 *   push {r4, lr}; mov r4, r0
 *   bl func_0204987c; ldrb r0, [r0, #416]
 *   cmp r0, #2; popeq                   ; if byte == 2 return 2 (r0 already 2)
 *   mov r0, r4; bl func_0204cbac; pop
 */

extern unsigned char *func_0204987c(void);
extern int func_0204cbac(void *self);

int func_0204fc28(void *self) {
    int t = func_0204987c()[416];
    if (t == 2) return t;
    return func_0204cbac(self);
}
