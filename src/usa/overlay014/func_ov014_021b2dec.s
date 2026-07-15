; func_ov014_021b2dec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208c79c
        .extern func_ov014_021b3468
        .global func_ov014_021b2dec
        .arm
func_ov014_021b2dec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5]
    mov r4, #0x0
    cmp r1, #0x0
    beq .L_7d4
    cmp r1, #0x1
    beq .L_81c
    cmp r1, #0x2
    beq .L_830
    b .L_864
.L_7d4:
    ldr r1, [r5, #0x8]
    ldr r0, _LIT0
    add r1, r1, #0x1
    str r1, [r5, #0x8]
    sub r1, r1, #0x10
    bl func_0208c79c
    ldr r1, [r5, #0x8]
    ldr r0, _LIT1
    sub r1, r1, #0x10
    bl func_0208c79c
    ldr r0, [r5, #0x8]
    cmp r0, #0x10
    blt .L_864
    mov r0, #0x1
    str r0, [r5]
    mov r0, r4
    str r0, [r5, #0x8]
    b .L_864
.L_81c:
    bl func_ov014_021b3468
    cmp r0, #0x0
    movne r0, #0x2
    strne r0, [r5]
    b .L_864
.L_830:
    ldr r1, [r5, #0x8]
    ldr r0, _LIT0
    add r1, r1, #0x1
    str r1, [r5, #0x8]
    rsb r1, r1, #0x0
    bl func_0208c79c
    ldr r1, [r5, #0x8]
    ldr r0, _LIT1
    rsb r1, r1, #0x0
    bl func_0208c79c
    ldr r0, [r5, #0x8]
    cmp r0, #0x10
    movge r4, #0x1
.L_864:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0400006c
_LIT1: .word 0x0400106c
