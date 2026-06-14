; func_ov007_021b2d3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020d0ef0
        .extern func_020211c8
        .extern func_0202147c
        .extern func_02022234
        .extern func_0202224c
        .extern func_02037208
        .extern func_ov007_021b2cf8
        .extern func_ov007_021b2e00
        .extern func_ov007_021b2e84
        .global func_ov007_021b2d3c
        .arm
func_ov007_021b2d3c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq .L_b0
    bl func_ov007_021b2e84
    cmp r0, #0x0
    beq .L_40
    ldr r1, [r4, #0x10]
    ldr r2, [r4, #0x14]
    mov r0, r4
    bl func_ov007_021b2cf8
    mvn r1, #0x0
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_40:
    ldr r1, [r4, #0x20]
    cmp r1, #0x3
    bne .L_7c
    ldr r0, [r4, #0x1c]
    cmp r0, #0x0
    beq .L_7c
    ldr r0, _LIT0
    bl func_020211c8
    mov r5, r0
    bl func_0202147c
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_ov007_021b2e00
    b .L_a0
.L_7c:
    cmp r1, #0xa
    ldreq r0, [r4, #0x1c]
    cmpeq r0, #0x0
    bne .L_a0
    mov r0, #0x0
    bl func_0202224c
    orr r1, r0, #0x4000
    mov r0, #0x0
    bl func_02022234
.L_a0:
    ldr r0, [r4, #0x20]
    add r0, r0, #0x1
    str r0, [r4, #0x20]
    b .L_b8
.L_b0:
    mov r0, #0x0
    str r0, [r4, #0x20]
.L_b8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_020d0ef0
