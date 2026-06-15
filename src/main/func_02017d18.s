; func_02017d18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern func_02018a38
        .extern func_02018a64
        .extern func_02019664
        .extern func_0201969c
        .extern func_0201abb0
        .extern func_0201abd4
        .extern func_0201b7e0
        .global func_02017d18
        .arm
func_02017d18:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8d8]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x920]
    cmp r0, #0x1
    beq .L_ab8
    cmp r0, #0x2
    beq .L_adc
    cmp r0, #0x3
    beq .L_b08
    ldmia sp!, {r3, r4, r5, pc}
.L_ab8:
    bl func_02019664
    cmp r0, #0x66
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    str r0, [r5, #0x8]
    ldr r0, [r4, #0x900]
    orr r0, r0, #0x1000000
    str r0, [r4, #0x900]
    ldmia sp!, {r3, r4, r5, pc}
.L_adc:
    mov r0, r5
    bl func_0201b7e0
    cmp r0, #0x4
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    mov r0, #0x2
    str r1, [r5, #0x8]
    bl func_0201abb0
    mov r0, #0x13
    bl func_02018a38
    ldmia sp!, {r3, r4, r5, pc}
.L_b08:
    bl func_02019664
    cmp r0, #0x65
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_0201969c
    cmp r0, #0x2
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT2
    mov r0, #0x2
    str r1, [r5, #0x8]
    bl func_0201abd4
    ldr r0, [r4, #0x900]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x900]
    bl func_02018a64
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00270100
_LIT1: .word 0x00270200
_LIT2: .word 0x00270300
