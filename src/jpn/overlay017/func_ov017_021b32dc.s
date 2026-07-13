; func_ov017_021b32dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020371b8
        .extern func_0208c79c
        .extern func_ov017_021b3ba8
        .global func_ov017_021b32dc
        .arm
func_ov017_021b32dc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5]
    mov r4, #0x0
    cmp r1, #0x0
    beq .L_2dc
    cmp r1, #0x1
    beq .L_324
    cmp r1, #0x2
    beq .L_354
    b .L_388
.L_2dc:
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
    blt .L_388
    mov r0, #0x1
    str r0, [r5]
    mov r0, r4
    str r0, [r5, #0x8]
    b .L_388
.L_324:
    bl func_ov017_021b3ba8
    cmp r0, #0x0
    beq .L_388
    mov r2, r4
    mov r0, #0x42
    str r2, [r5, #0x8]
    mov ip, #0x2
    sub r1, r0, #0x43
    mov r3, #0x1
    str ip, [r5]
    bl func_020371b8
    b .L_388
.L_354:
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
.L_388:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x0400006c
_LIT1: .word 0x0400106c
