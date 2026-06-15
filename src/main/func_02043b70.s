; func_02043b70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern WaitByLoop
        .extern func_02043b38
        .extern func_02043d3c
        .extern func_0209640c
        .extern func_02096434
        .global func_02043b70
        .arm
func_02043b70:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, #0x4
    mov r4, #0x1
.L_104:
    mov r0, r5
    mov r1, r4
    bl func_0209640c
    cmp r0, #0x0
    beq .L_104
    ldr r1, _LIT0
    mov r0, #0x4
    bl func_02096434
    mov r4, #0x40000
    mov r6, #0x7
    mov r5, #0x0
.L_130:
    mov r0, r6
    mov r1, r5
    mov r2, r5
    mov r3, r5
    bl func_02043d3c
    cmp r0, #0x1
    beq .L_158
    mov r0, r4
    bl WaitByLoop
    b .L_130
.L_158:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word func_02043b38
