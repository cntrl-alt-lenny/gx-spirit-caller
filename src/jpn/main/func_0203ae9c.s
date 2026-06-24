; func_0203ae9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0203ae9c
        .arm
func_0203ae9c:
    stmdb sp!, {r3, lr}
    ldr r0, [r0, #0x78]
    mov ip, #0x0
    add lr, r0, #0x40
.L_31c:
    ldr r0, [lr]
    cmp r0, r2
    ldreqb r0, [lr, #0x7]
    cmpeq r0, r3
    bne .L_34c
    ldrsh r2, [lr, #0x4]
    mov r0, #0x1
    strh r2, [r1]
    ldrb r2, [lr, #0x6]
    strb r2, [r1, #0x2]
    strb r3, [r1, #0x3]
    ldmia sp!, {r3, pc}
.L_34c:
    add ip, ip, #0x1
    cmp ip, #0x10
    add lr, lr, #0x8
    blt .L_31c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
