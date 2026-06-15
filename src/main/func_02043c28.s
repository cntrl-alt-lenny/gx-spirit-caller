; func_02043c28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern WaitByLoop
        .extern func_02043b38
        .extern func_02043d3c
        .extern func_020928e8
        .extern func_0209640c
        .extern func_02096434
        .global func_02043c28
        .arm
func_02043c28:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r7, r1
    mov r6, r2
    mov r5, #0x4
    mov r4, #0x1
.L_1c8:
    mov r0, r5
    mov r1, r4
    bl func_0209640c
    cmp r0, #0x0
    beq .L_1c8
    ldr r1, _LIT0
    mov r0, #0x4
    bl func_02096434
    mov r0, r6
    mov r1, r7
    bl func_020928e8
    mov r4, #0x40000
    mov r5, #0x2
.L_1fc:
    mov r0, r5
    mov r1, r8
    mov r2, r7
    mov r3, r6
    bl func_02043d3c
    cmp r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r4
    bl WaitByLoop
    b .L_1fc
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word func_02043b38
