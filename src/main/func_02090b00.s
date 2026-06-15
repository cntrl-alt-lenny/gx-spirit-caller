; func_02090b00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern WaitByLoop
        .extern func_020909d0
        .global func_02090b00
        .arm
func_02090b00:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_020909d0
    cmp r0, #0x0
    ldmleia sp!, {r4, r5, r6, r7, r8, lr}
    bxle lr
    mov r4, #0x400
.L_28:
    mov r0, r4
    bl WaitByLoop
    mov r0, r8
    mov r1, r7
    mov r2, r6
    mov r3, r5
    bl func_020909d0
    cmp r0, #0x0
    bgt .L_28
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
