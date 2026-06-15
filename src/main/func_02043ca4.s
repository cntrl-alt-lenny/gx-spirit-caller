; func_02043ca4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern WaitByLoop
        .extern func_02043b38
        .extern func_02043d3c
        .extern func_020928cc
        .extern func_0209640c
        .extern func_02096434
        .global func_02043ca4
        .arm
func_02043ca4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r4, r2
    mov r6, r0
    mov r0, r4
    mov r5, r1
    bl func_020928cc
    mov r8, #0x4
    mov r7, #0x1
.L_250:
    mov r0, r8
    mov r1, r7
    bl func_0209640c
    cmp r0, #0x0
    beq .L_250
    ldr r1, _LIT0
    mov r0, #0x4
    bl func_02096434
    mov r0, r5, lsl #0x10
    mov r8, r0, lsr #0x10
    mov r7, #0x40000
    mov r9, #0x1
.L_280:
    mov r0, r9
    mov r1, r6
    mov r2, r8
    mov r3, r4
    bl func_02043d3c
    cmp r0, #0x1
    beq .L_2a8
    mov r0, r7
    bl WaitByLoop
    b .L_280
.L_2a8:
    mov r0, r4
    mov r1, r5
    bl func_020928cc
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word func_02043b38
