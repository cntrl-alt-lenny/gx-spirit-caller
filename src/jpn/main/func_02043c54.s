; func_02043c54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern WaitByLoop
        .extern func_02043ae8
        .extern func_02043cec
        .extern func_020927e4
        .extern func_02096318
        .extern func_02096340
        .global func_02043c54
        .arm
func_02043c54:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r4, r2
    mov r6, r0
    mov r0, r4
    mov r5, r1
    bl func_020927e4
    mov r8, #0x4
    mov r7, #0x1
.L_24:
    mov r0, r8
    mov r1, r7
    bl func_02096318
    cmp r0, #0x0
    beq .L_24
    ldr r1, _LIT0
    mov r0, #0x4
    bl func_02096340
    mov r0, r5, lsl #0x10
    mov r8, r0, lsr #0x10
    mov r7, #0x40000
    mov r9, #0x1
.L_54:
    mov r0, r9
    mov r1, r6
    mov r2, r8
    mov r3, r4
    bl func_02043cec
    cmp r0, #0x1
    beq .L_7c
    mov r0, r7
    bl WaitByLoop
    b .L_54
.L_7c:
    mov r0, r4
    mov r1, r5
    bl func_020927e4
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word func_02043ae8
