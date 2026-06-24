; func_02043b20 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern WaitByLoop
        .extern func_02043ae8
        .extern func_02043cec
        .extern func_02096318
        .extern func_02096340
        .global func_02043b20
        .arm
func_02043b20:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, #0x4
    mov r4, #0x1
.L_c:
    mov r0, r5
    mov r1, r4
    bl func_02096318
    cmp r0, #0x0
    beq .L_c
    ldr r1, _LIT0
    mov r0, #0x4
    bl func_02096340
    mov r4, #0x40000
    mov r6, #0x7
    mov r5, #0x0
.L_38:
    mov r0, r6
    mov r1, r5
    mov r2, r5
    mov r3, r5
    bl func_02043cec
    cmp r0, #0x1
    beq .L_60
    mov r0, r4
    bl WaitByLoop
    b .L_38
.L_60:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word func_02043ae8
