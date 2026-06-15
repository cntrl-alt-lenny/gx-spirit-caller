; func_0203d524 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c900
        .extern func_0203d39c
        .global func_0203d524
        .arm
func_0203d524:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x10
    bl func_0203c900
    ldrsh r1, [r4]
    cmp r1, #0x5
    bne .L_4bc
    ldrsh r1, [r4, #0x2]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, [r4, #0x8]
    cmp r1, #0xd
    beq .L_48c
    cmp r1, #0xf
    beq .L_498
    cmp r1, #0x11
    beq .L_4a4
    b .L_4b0
.L_48c:
    mov r1, #0x1
    strb r1, [r0, #0xd14]
    ldmia sp!, {r4, pc}
.L_498:
    mov r1, #0x2
    strb r1, [r0, #0xd14]
    ldmia sp!, {r4, pc}
.L_4a4:
    mov r1, #0x3
    strb r1, [r0, #0xd14]
    ldmia sp!, {r4, pc}
.L_4b0:
    mov r1, #0x4
    strb r1, [r0, #0xd14]
    ldmia sp!, {r4, pc}
.L_4bc:
    cmp r1, #0x7
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    bl func_0203d39c
    ldmia sp!, {r4, pc}
